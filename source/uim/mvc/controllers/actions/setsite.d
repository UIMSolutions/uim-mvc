/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.actions.setsite;

import uim.mvc;
@safe:

class DSelectSiteActionController : DActionController {
  mixin(ControllerThis!("SelectSiteActionController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings); 
    
    this.name = "SelectSiteActionController";
    this.checks([
      InternalSessionHasSessionCheck, // InternalSession Checks
      DatabaseHasSessionsCheck, DatabaseHasSitesCheck, // Database checks 
      RequestHasSiteIdCheck // Request Checks
    ]); 
  }
  
  override void beforeResponse(STRINGAA options = null) {
    debug writeln(moduleName!DSelectSiteActionController~":DSelectSiteActionController::request");
    super.beforeResponse(options);
    if ("redirect" in options) return;
        
    debug writeln(moduleName!DSelectSiteActionController~":DSelectSiteActionController::request - Working with InternalSession");
    DInternalSession myInternalSession = getInternalSession(options); // DInternalSession[string]
    
    debug writeln(moduleName!DSelectSiteActionController~":DSelectSiteActionController::request - Working with session.session");
    DEntity mySession = myInternalSession.session; 
    debug writeln(mySession ? "Found session" : "Missing session");

    DEntity mySite = database["systems"]["system_sites"].findOne(["id":options.get("siteId", null)]);
    debug writeln(mySite ? "Found site" : "Missing site");

    if (mySession && mySite) {
      mySession.lastAccessedOn = toTimestamp(now());
      mySession["lastAccessISO"] = now.toISOString;
      mySession["siteId"] = mySite.id.toString;
      // myInternalSession.save; // Save to Store
      myInternalSession.session = mySession; 
    
      debug writeln(moduleName!DSelectSiteActionController~":DSelectSiteActionController::request - Working with session.site");
      mySite.lastAccessedOn = mySession.lastAccessedOn;
      mySite["lastAccessISO"] = mySession["lastAccessISO"];
      mySite.save; 
      myInternalSession.site = mySite; 
      setInternalSession(myInternalSession, options); 
    }

    debug writeln(moduleName!DSelectSiteActionController~":DSelectSiteActionController::request - Redirect to /");
    options["redirect"] = "/";
    debug writeln(session.debugInfo);
	}
}
mixin(ControllerCalls!("SelectSiteActionController"));