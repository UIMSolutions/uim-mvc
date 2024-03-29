/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.forms.components.inputs.switch_;

import uim.mvc;

@safe:
class DSwitchFormInput : DFormInput {
  mixin(ViewComponentThis!("SwitchFormInput"));

  override bool initialize(IData[string] configSettings = null) {
    super.initialize(configSettings);

    this
      .fieldValue("false");
  }

  mixin(OProperty!("bool", "checked"));
 
  override DH5Obj h5Input(STRINGAA options = null) {
    debugMethodCall(moduleName!DSwitchFormInput~":DSwitchFormInput::h5Input");
    super.h5Input(options);
    
    auto input = H5Input(name, ["form-check-input me-1"], ["type":"checkbox", "name":inputName]);
    if (entity) {
      this.checked = (entity[fieldName] == "true"); 
    }
    if (checked) input.attribute("checked", "checked");    

    if (crudMode != CRUDModes.Create) input.value("true");
    if (crudMode == CRUDModes.Read || crudMode == CRUDModes.Delete) input.attribute("readonly","readonly").attribute("disabled","disabled");

    return input;
  }
  
  override DH5Obj h5FormGroup(STRINGAA options = null) {
    super.h5FormGroup(options);

    return BS5FormGroup(["row", "mb-0"],
      H5Label(["form-label col-2 col-form-label"], ""),
      BS5Col(["col"], 
        H5Label(["form-check form-switch"], 
          h5Input(options), H5Span(["form-check-label"], label))));
  }
}
mixin(ViewComponentCalls!("SwitchFormInput", "DSwitchFormInput"));
