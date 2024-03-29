/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.forms.components.contents.content;

import uim.mvc;

@safe:
class DFormContent : DFormComponent {
  mixin(ViewComponentThis!("FormContent"));

  override bool initialize(IData[string] configSettings = null) {
    version(test_uim_mvc) { debugMethodCall(moduleName!DFormContent~"::DFormContent("~this.className~"):initialize"); }
    super.initialize(configSettings);

    debug writeln("In ", __MODULE__, "/", __LINE__);
  }
}
mixin(ViewComponentCalls!("FormContent", "DFormContent"));

version(test_uim_mvc) { unittest {
  assert(FormContent);
}}