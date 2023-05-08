/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.models.model;

import uim.mvc;
@safe:

class DModel : DMVCObject, IModel { 
  mixin(ModelThis!("Model"));

  override void initialize(Json configSettings = Json(null)) {}

  mixin(OProperty!("DETBBase", "datasource")); 
}
mixin(ModelCalls!("Model", "DModel"));

version(test_uim_mvc) { unittest { 
  assert(Model);
  assert(Model.name == "Model");
}} 
