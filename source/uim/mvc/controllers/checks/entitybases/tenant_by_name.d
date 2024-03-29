/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.checks.entitybases.entityTenant_by_name;

import uim.mvc;

@safe:
class DDatabaseHasTenantCheck : DDatabaseExistsCheck {
  mixin(ControllerComponentThis!("DatabaseHasTenantCheck"));

  override bool initialize(IData[string] configSettings = null) {
    super.initialize(configSettings);

    this
    .redirectUrl("/error?message=tenant_missing");
  }

  mixin(OProperty!("string", "tenantName"));
  
  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!DDatabaseHasTenantCheck~":DDatabaseHasTenantCheck::check");
    if (!super.execute(options)) { 
      return false; 
    }

    auto myEntityBase = manager.entityBase;
    if (!myEntityBase) {
      this.error("entitybase_missing");
      return false; 
    }

    if (!myEntityBase.hasEntityTenant(tenantName)) {  
      this.error("collection_("~tenantName~")_missing");
      return false; }

    return true;
  }
}
mixin(ControllerComponentCalls!("DatabaseHasTenantCheck"));
