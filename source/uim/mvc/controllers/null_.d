/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.null_;

import uim.mvc;
@safe:

// Null Controller - Following the Null Pattern
class DNullController : DController {
  mixin(ControllerThis!("NullController"));
}
mixin(ControllerCalls!("NullController"));