/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.forms.crud.elements;

@safe:
import uim.mvc;

class DMVCElementsForm : DForm {
  mixin(ViewComponentThis!("MVCElementsForm"));

  mixin(OProperty!("DElement[]", "elements"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);
  }
}
mixin(ViewComponentCalls!("MVCElementsForm", "DMVCElementsForm"));