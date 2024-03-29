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
module uim.mvc.controllers.actions.action;

import uim.mvc;

@safe:
class DActionController : DController/* , IActionController */ {
  mixin(ControllerThis!("ActionController"));

  override bool initialize(IData[string] configSettings = null) {
    super.initialize(configSettings); 
  }

	override bool beforeResponse(STRINGAA options = null) {
    debug writeln(moduleName!DActionController~":DActionController::beforeResponse");
    if (!super.beforeResponse(options)) { 
      return false; 
    } 

		return true;
	}
}
mixin(ControllerCalls!("ActionController"));