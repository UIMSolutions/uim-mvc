/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.registry;

import uim.mvc;

@safe:
class DControllerRegistry : DRegistry!DController{
  this() {}

  static DControllerRegistry registry; 
}
auto ControllerRegistry() { // Singleton
  if (!DControllerRegistry.registry) {
    DControllerRegistry.registry = new DControllerRegistry; 
  }
  return 
    DControllerRegistry.registry;
}

version(test_uim_mvc) { unittest {
  assert(ControllerRegistry.register("mvc/controllercomponent",  Controller).paths == ["mvc/controllercomponent"]);
  assert(ControllerRegistry.register("mvc/controllercomponent2", Controller).paths.length == 2);
}}