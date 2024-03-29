/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.crud.create;

import uim.mvc;

@safe:
class DEntityCreateView : DEntityCRUDView {
  mixin(ViewThis!("EntityCreateView"));

override bool initialize(IData[string] configSettings = null) {
    super.initialize(configSettings);

    debug writeln("In ", __MODULE__, "/", __LINE__); 

    if (auto pgHeader = cast(DPageHeaderViewComponent)this.header) {
      pgHeader.actions([["refresh", "list"]]); }

    if (auto frm = cast(DForm)this.form) {
      if (auto frmHeader = cast(DFormHeader)frm.header) {
        frmHeader.actions([["cancel", "save"], ["print", "export"]]); }

      if (auto frmContent = cast(DEntityFormContent)frm.content) {
        frmContent.fields(["name", "display", "description"]); }
    }

    this.crudMode(CRUDModes.Create);
  }
}
mixin(ViewCalls!("EntityCreateView"));

version(test_uim_mvc) { unittest {
  assert(EntityCreateView);

  writeln("--- Tests in ", __MODULE__, "/", __LINE__);
  testView(new DEntityCreateView); 

  writeln("--- Tests in ", __MODULE__, "/", __LINE__);
  testView(EntityCreateView); 
}}