/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.actions.update;

import uim.mvc;
@safe:

class DUpdateActionController : DActionController {
  mixin(ControllerThis!("UpdateActionController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings); 
    this.name = "UpdateActionController";
    this.checks([InternalSessionExistsCheck, DatabaseExistsCheck, InternalSessionHasSessionCheck, InternalSessionHasSiteCheck]); 
  }

  mixin(OProperty!("string", "pool"));
  mixin(OProperty!("string", "pgPath"));
  
  override void beforeResponse(STRINGAA options = null) {
    debug writeln(moduleName!DUpdateActionController~":DUpdateActionController::beforeResponse");
    super.beforeResponse(options);   
    if (hasError || "redirect" in options) { return; }

    auto session = getInternalSession(options);
    auto site = session.site;

    auto collection = database[site, pool];
    if (!collection) {
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
mixin(ControllerCalls!("UpdateActionController"));

version(test_uim_mvc) { unittest {
  writeln("--- Test in ", __MODULE__, "/", __LINE__);

  assert(new DUpdateActionController);
  assert(UpdateActionController);
  assert(UpdateActionController.pool("testPool").pool == "testPool");
  assert(UpdateActionController.pgPath("testPath").pgPath == "testPath");
  assert(UpdateActionController.name == "UpdateActionController");
}}

