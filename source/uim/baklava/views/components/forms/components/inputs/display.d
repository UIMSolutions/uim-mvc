module uim.baklava.views.components.forms.components.inputs.display;

@safe:
import uim.baklava;

class DDisplayFormInput : DBLVTextFormInput {
  mixin(BLVViewComponentThis!("BLVDisplayFormInput"));

  override void initialize() {
    super.initialize();

    this
    .id("entity_display")
    .inputName("entity_display")
    .fieldName("display")
    .label("Titel")
    .placeholder("Titel eingeben")
    .invalidFeedback("Titel ist nicht korrekt"); 
  }
}
mixin(BLVViewComponentCalls!("BLVDisplayFormInput", "DBLVDisplayFormInput"));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    // TODO Add Tests
}}