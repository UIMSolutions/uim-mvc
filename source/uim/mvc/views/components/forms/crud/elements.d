module uim.mvc.views.components.forms.crud.elements;

@safe:
import uim.mvc;

class DMVCElementsForm : DMVCForm {
  mixin(MVCViewComponentThis!("MVCElementsForm"));

  mixin(OProperty!("DOOPElement[]", "elements"));

  override void initialize() {
    super.initialize;
  }
}
mixin(MVCViewComponentCalls!("MVCElementsForm", "DMVCElementsForm"));
