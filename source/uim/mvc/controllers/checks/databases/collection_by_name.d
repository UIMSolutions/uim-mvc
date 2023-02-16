module uim.mvc.controllers.checks.databases.collection_by_name;

@safe:
import uim.mvc;

class DControllerCheckDatabaseHasCollection : DDatabaseExistsCheck {
  mixin(ControllerComponentThis!("APPCheckDatabaseHasCollection"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
    .redirectUrl("/error?message=collection_missing");
  }

  mixin(OProperty!("string", "tenantName"));
  mixin(OProperty!("string", "collectionName"));
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DControllerCheckDatabaseHasCollection~":DControllerCheckDatabaseHasCollection::check");
    if (!super.execute(options)) { return false; }
    
    if (!this.database.hasTenant(tenantName) || !this.database[tenantName].hasCollection(collectionName)) {  
      this.error("collection_("~tenantName~","~collectionName~")_missing");
      return false; }

    return true;
  }
}
mixin(ControllerComponentCalls!("APPCheckDatabaseHasCollection"));
