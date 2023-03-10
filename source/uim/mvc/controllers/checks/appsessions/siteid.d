/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.controllers.checks.appsessions.siteid;

@safe:
import uim.mvc;

class DAppSessionHasSiteIdCheck : DAppSessionHasSessionCheck {
  mixin(ControllerComponentThis!("AppSessionHasSiteIdCheck"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
    .redirectUrl("/login");
  }
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DAppSessionHasSiteIdCheck~":DAppSessionHasSiteIdCheck::execute");
    if (!super.execute(options)) { return false; }

    auto session = getAppSession(options).session;
    if (!session["siteId"]) { // site id in session missing 
      this.error("appsession_siteid_missing");
      return false; 
    }

    return true;
  }
}
mixin(ControllerComponentCalls!("AppSessionHasSiteIdCheck"));
