/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.forms.components.inputs.name;

@safe:
import uim.mvc;

class DMVCNameFormInput : DMVCTextFormInput {
  mixin(ViewComponentThis!("MVCNameFormInput"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .id("entity_name")
      .inputName("entity_name")
      .fieldName("name")
      .label("Name")
      .placeholder("Name eingeben")
      .invalidFeedback("Name ist nicht korrekt");
  }
}
mixin(ViewComponentCalls!("MVCNameFormInput", "DMVCNameFormInput"));