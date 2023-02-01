module uim.mvc.views.components.pages.headers.entities.edit;

@safe:
import uim.mvc;

class DMVCEditPageHeaderViewComponent : DMVCPageHeaderViewComponent {
  mixin(ViewComponentThis!("MVCEditPageHeaderViewComponent"));
  
  override void initialize() {
    super.initialize;

    this
      .actions([["refresh"], ["list"], ["view"], ["print", "export"]]); 
  }
}
mixin(ViewComponentCalls!("MVCEditPageHeaderViewComponent", "DMVCEditPageHeaderViewComponent"));
mixin(ViewComponentCalls!("MVCEditPageHeader", "DMVCEditPageHeaderViewComponent"));
