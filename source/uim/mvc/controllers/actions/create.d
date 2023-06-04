/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.actions.create;

import uim.mvc;
@safe:

class DCreateActionController : DActionController {
  mixin(ControllerThis!("CreateActionController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings); 
    this.name = "CreateActionController";
    this.checks([AppSessionExistsCheck, DatabaseExistsCheck, AppSessionHasSessionCheck, AppSessionHasSiteCheck]); 
  }

  mixin(OProperty!("string", "pool"));
  mixin(OProperty!("string", "pgPath"));
  
  override void beforeResponse(STRINGAA options = null) {
    debug writeln(moduleName!DCreateActionController~":DCreateActionController::beforeResponse");
    super.beforeResponse(options);   
    if (hasError || "redirect" in options) return; 

    auto mySession = getAppSession(options);
    if (mySession.isNull) {
      options["redirect"] = "/login"; 
      return; // TODO: Redirect to login 
    }

    auto mySite = mySession.site;
    if (mySite.isNull) { 
      options["redirect"] = "/sites"; 
      return; // TODO: Redirect to login 
    }

    if (application.isNull) return; 

    auto myDatabase = application.database;
    if (myDatabase.isNull) return;

    auto myTenant = myDatabase[mySite];
    if (myTenant.isNull) return; // TODO: Redirect ?

    auto collection = myTenant[pool];
    if (collection.isNull) {
      options["redirect"] = pgPath~"/view"; 
      return; }

    if (auto entity = collection.createFromTemplate) {
      with (entity) {
        readFromRequest(options);
        save; 
      }

      options["redirect"] = pgPath~"/view?id="~entity.id.toString; 
    }
  }
}
mixin(ControllerCalls!("CreateActionController"));

version(test_uim_mvc) { unittest {
  writeln("--- Test in ", __MODULE__, "/", __LINE__);

  assert(new DCreateActionController);
  assert(CreateActionController);
  assert(CreateActionController.pool("testPool").pool == "testPool");
  assert(CreateActionController.pgPath("testPath").pgPath == "testPath");
  assert(CreateActionController.name == "CreateActionController");
}}

