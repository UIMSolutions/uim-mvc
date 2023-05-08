/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.checks.appsessions.appsession;

import uim.mvc;
@safe:

class DAppSessionExistsCheck : DControllerCheck {
  mixin(ControllerComponentThis!("AppSessionExistsCheck"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
    .redirectUrl("/account");
  }

  override bool execute(STRINGAA options = null) {    
    debug writeln(moduleName!DAppSessionExistsCheck~":DAppSessionExistsCheck::check");

    if (auto appSession = getAppSession(options)) {
      return true;
    } else { // appsession missing 
      this.error("appsession_missing");
      return false; 
    }
  }
}
mixin(ControllerComponentCalls!("AppSessionExistsCheck"));

///
unittest {
  auto check = new DAppSessionExistsCheck;
  assert(check.name == "AppSessionExistsCheck");
}
