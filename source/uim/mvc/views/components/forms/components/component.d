/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.components.forms.components.component;

@safe:
import uim.mvc;

class DMVCFormComponent : DMVCViewComponent {
  mixin(MVCViewComponentThis!("MVCFormComponent"));

  override void initialize() {
    debugMethodCall(moduleName!DMVCFormComponent~"::DMVCFormComponent("~this.name~"):initialize");   
    super.initialize;

    debug writeln("In ", __MODULE__, "/", __LINE__);
  }

  mixin(OProperty!("CRUDModes", "crudMode"));
  mixin(OProperty!("DMVCForm", "form"));
  mixin(OProperty!("bool", "readonly")); 
  mixin(MVCParameter!("title"));  
  mixin(MVCParameter!("rootPath"));  
}
mixin(MVCViewComponentCalls!("MVCFormComponent", "DMVCFormComponent"));

version(test_uim_mvc) { unittest {
  assert(MVCFormComponent);
}}