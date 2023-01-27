module uim.mvc.views.components.forms.components.inputs.name;

@safe:
import uim.mvc;

class DBKLNameFormInput : DBKLTextFormInput {
  mixin(BKLViewComponentThis!("BKLNameFormInput"));

  override void initialize() {
    super.initialize;

    this
      .id("entity_name")
      .inputName("entity_name")
      .fieldName("name")
      .label("Name")
      .placeholder("Name eingeben")
      .invalidFeedback("Name ist nicht korrekt");
  }
}
mixin(BKLViewComponentCalls!("BKLNameFormInput", "DBKLNameFormInput"));
