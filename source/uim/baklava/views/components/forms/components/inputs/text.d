module uim.baklava.views.components.forms.components.inputs.text;

@safe:
import uim.baklava;

class DBLVTextFormInput : DBLVFormInput {
  mixin(BLVViewComponentThis!("BLVTextFormInput"));

  override DH5Obj[] toH5(STRINGAA options = null) { // hook
    super.toH5(options);
    if (hasError) { return null; }
    
    auto input = UIMTextInput
      .id(inputId).name(inputName).placeholder(placeholder)
      .readonly(readonly)
      .addAttributes(["autocomplete":"off"]);

    if (crudMode == CRUDModes.Read || crudMode == CRUDModes.Delete) input.readonly(true);
    input.value(fieldValue).invalidText(invalidFeedback);

    return [
      BS5FormGroup(id, ["row", "mb-1"],
        H5Label(labelId, ["form-label col-2 col-form-label required"], label),
        input
      )
    ].toH5;
  }
}
mixin(BLVViewComponentCalls!("BLVTextFormInput", "DBLVTextFormInput"));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

  }}
