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
module uim.mvc.controllers.checks.internalsessions.internalsession;

import uim.mvc;
@safe:

class DInternalSessionExistsCheck : DControllerCheck {
  mixin(ControllerComponentThis!("InternalSessionExistsCheck"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
    .redirectUrl("/account");
  }

  override bool execute(STRINGAA options = null) {    
    debug writeln(moduleName!DInternalSessionExistsCheck~":DInternalSessionExistsCheck::check");

    if (auto internalSession = getInternalSession(options)) {
      return true;
    } else { // internalsession missing 
      this.error("internalsession_missing");
      return false; 
    }
  }
}
mixin(ControllerComponentCalls!("InternalSessionExistsCheck"));

///
unittest {
  auto check = new DInternalSessionExistsCheck;
  assert(check.name == "InternalSessionExistsCheck");
}
