module uim.mvc.views.components.forms.crud.entity;

@safe:
import uim.mvc;

class DMVCEntityForm : DMVCForm {
  mixin(MVCViewComponentThis!("MVCEntityForm"));

  // mixin(OProperty!("DEntity", "entity"));

  override void initialize() {
    super.initialize;
  }
}
mixin(MVCViewComponentCalls!("MVCEntityForm", "DMVCEntityForm"));