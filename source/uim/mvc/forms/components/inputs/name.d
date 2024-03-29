/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.forms.components.inputs.name;

import uim.mvc;

@safe:
class DMVCNameFormInput : DTextFormInput {
  mixin(ViewComponentThis!("MVCNameFormInput"));

  override bool initialize(IData[string] configSettings = null) {
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
