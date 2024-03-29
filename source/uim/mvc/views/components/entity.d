/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.components.entity;

import uim.mvc;

@safe:
class DMVCEntityViewComponent : DViewComponent {
  mixin(ViewComponentThis!("MVCEntityViewComponent"));

  // mixin(OProperty!("DEntity", "entity"));
  mixin(OProperty!("CRUDModes", "crudMode"));

  override void beforeH5(STRINGAA options = null) {
    version(test_uim_mvc) { debugMethodCall(moduleName!DMVCEntityViewComponent~":DMVCEntityViewComponent("~this.name~")::beforeH5"); }
    super.beforeH5(options);
  }
}
mixin(ViewComponentCalls!("MVCEntityViewComponent", "DMVCEntityViewComponent"));
