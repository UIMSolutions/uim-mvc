/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.components.forms.crud.list;

@safe:
import uim.mvc;

class DMVCEntitiesListForm : DMVCEntitiesForm {
  mixin(ViewComponentThis!("MVCEntitiesListForm"));

  override void initialize(DConfig configSettings = null) {
    super.initialize(configSettings);

    this
      .header(
        MVCFormHeader //.mainTitle("Blogs").subTitle("Übersicht Blogs").actions([["print", "export"]])
      )
      .content(
        MVCEntitiesFormContent      
      );
    /*       .form
        .header(MVCEntitiesheader(this.form).rootPath("/cms/blogs").mainTitle("Blogs").subTitle("Blogs anzeigen").actions([["print", "export"]]))
        .body_(MVCListbody_(this.form).rootPath("/cms/blogs"));
 */
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMVCEntitiesListForm~":DMVCEntitiesListForm("~this.name~")::toH5");
    super.toH5(options);
    
    DBS5Col _col = BS5Col(["col-12"]);
    _col(
      H5Form("Form", ["card"], ["method":method, "action":action], 
        this.header.toH5(options)~
        this.content.toH5(options)~
        this.footer.toH5(options) 
      ));
    
    return [_col].toH5;
  }  
}
mixin(ViewComponentCalls!("MVCEntitiesListForm", "DMVCEntitiesListForm"));

version(test_uim_mvc) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    assert(new DMVCEntitiesListForm);
    assert(MVCEntitiesListForm);
  }
}
