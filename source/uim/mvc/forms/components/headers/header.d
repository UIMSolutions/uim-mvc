/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.forms.components.headers.header;

import uim.mvc;

@safe:
class DFormHeader : DFormComponent {
  mixin(ViewComponentThis!("FormHeader"));

  override bool initialize(IData[string] configSettings = null) {
    version(test_uim_mvc) { debugMethodCall(moduleName!DFormHeader~"::DFormHeader("~this.className~"):initialize"); }  
    super.initialize(configSettings);
    version(test_uim_mvc) { 
      debug writeln("In ", __MODULE__, "/", __LINE__); 
    }

    this
      .id("formheader-%s".format(uniform(1,1_000)))
      .crudMode(CRUDModes.Read); 
  }
  
  // mixin(OProperty!("DEntity", "entity"));
  // mixin(OProperty!("string", "rootPath"));
  mixin(MVCParameter!("mainTitle"));
  mixin(MVCParameter!("subTitle"));
  mixin(OProperty!("string[][]", "actions"));
/*   O actions(this O)(string[][] newActions...) { 
    this.actions(newActions); 
    return cast(O)this;
  } */

  DH5Obj actionButton(string action, STRINGAA options = null) {
    debugMethodCall(moduleName!DFormHeader~":DFormHeader::actionButton");

    auto entityId = this.entity ? this.entity["id"] : "-missing-";

    switch(action) {
/*       case "refresh": return buttonLinkRefresh(rootPath); 
      case "list": return buttonLinkList(rootPath); 
      case "cancel2root": return buttonLinkCancel(rootPath); 
      case "save": return submitSave();       
      case "create": return buttonLinkCreate(rootPath); 
      case "read": 
      case "view": return buttonLinkView(rootPath, entityId); 
      case "edit":  
      case "update": return buttonLinkEdit(rootPath, entityId); 
      case "delete": return buttonLinkDelete(rootPath, entityId); 
      case "finalDelete": return submitDelete(); 
      case "version": return buttonLinkVersion(rootPath, entityId); 
      case "print": return buttonLinkPrint(rootPath, entityId); 
      case "export": return buttonLinkExport(rootPath, entityId);  */
      default: return null;       
    }
  }

  DH5Obj[] actionButtons(STRINGAA options = null) {
    debugMethodCall(moduleName!DFormHeader~":DFormHeader::actionButtons");
    debug writeln ("Actions: ", this.actions);

    DH5Obj[] results;
    foreach(actionGroup; actions) {
      debug writeln ("Action Group: ", this.actions);
      results ~= BS5ButtonGroup(["ms-3"], actionGroup
        .map!(action => actionButton(action, options))
        .filter!(button => button) // no nulls
        .array);
    }    
    return results;
  }

  DH5Obj h5CardHeader(STRINGAA options = null) {
    debugMethodCall(moduleName!DFormHeader~":DFormHeader::h5CardHeader");

    return BS5CardHeader(id,
      H5H4(["card-title me-auto"], title),
      H5Div(["btn-list"], 
        H5Span(["d-none d-sm-inline"], actionButtons(options))));    
  }

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DFormHeader~":DFormHeader::beforeH5");
    super.beforeH5(options);

    /* if (form) {
      this
        .crudMode(form.crudMode)
        .rootPath(form.rootPath)
        .entity(form.entity)
        .entities(form.entities);
    } */
    if (!rootPath && "rootPath" in options) {
      this.rootPath(options["rootPath"]);
    }
  } 

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DFormHeader~":DFormHeader::toH5");
    super.toH5(options);
    if (hasError) { return null; }
    
    DH5Obj[] buttons = actionButtons(options);    
    string entityId = this.entity ? this.entity.id.toString : null;

    return [
        BS5CardHeader(id,
        H5H4(["card-title me-auto"], "ID: "~entityId),
        H5Div(["btn-list"], 
          H5Span(["d-none d-sm-inline"], buttons)))].toH5;    
  } 
}
mixin(ViewComponentCalls!("FormHeader"));

version(test_uim_mvc) { unittest {
  assert(FormHeader);
}}