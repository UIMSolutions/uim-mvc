/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.widgets.registry;

@safe:
import uim.mvc;

class DWidgetRegistry : DRegistry!DWidget{
  this() {}

  static DWidgetRegistry registry; 
}
auto WidgetRegistry() { 
  if (!DWidgetRegistry.registry) {
    DWidgetRegistry.registry = new DWidgetRegistry; 
  }
  return 
    DWidgetRegistry.registry;
}

version(test_uim_mvc) { unittest {
  assert(WidgetRegistry.register("mvc/model",  Widget).paths == ["mvc/model"]);
  assert(WidgetRegistry.register("mvc/model2", Widget).paths.length == 2);
}}