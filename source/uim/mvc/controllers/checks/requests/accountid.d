/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.checks.requests.accountid;

import uim.mvc;

@safe:
class DRequestHasAccountIdCheck : DDatabaseHasAccountsCheck {
  mixin(ControllerComponentThis!("RequestHasAccountIdCheck"));

  override bool initialize(IData[string] configSettings = null) {
    super.initialize(configSettings);

    this
    .redirectUrl("/login");
  }

  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!RequestHasAccountIdCheck~"::execute");
    if (!super.execute(options)) { 
      return false; 
    }

    if ("accountId" !in options) { // Account  missing
      this.error("request_accountid_missing");
      return false; 
    }

    debug writeln("accountId = ", options["accountId"]);
    return true;
  }
}
mixin(ControllerComponentCalls!("RequestHasAccountIdCheck"));
