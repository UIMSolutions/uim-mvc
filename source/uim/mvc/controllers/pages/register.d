/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.pages.register;

import uim.mvc;

@safe:
class DRegisterPageController : DPageController {
  mixin(ControllerThis!("RegisterPageController"));      
  
override bool initialize(IData[string] configSettings = null) {
    super.initialize(configSettings);

    this
    .parameter("pageTitle", "Registrierung")
    .parameter("pageBreadcrumbs", `<ol class="breadcrumb" aria-label="breadcrumbs">
  <li class="breadcrumb-item"><a href="#">Start</a></li>
  <li class="breadcrumb-item active" aria-current="page"><a href="#">Registrierung</a></li>
</ol>`)
      .title("Registrierung");
  }
}
mixin(ControllerCalls!("RegisterPageController"));

version(test_uim_mvc) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DRegisterPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(RegisterPageController); 
}}