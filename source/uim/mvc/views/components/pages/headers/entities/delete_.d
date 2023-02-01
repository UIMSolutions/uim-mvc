module uim.mvc.views.components.pages.headers.entities.delete_;

@safe:
import uim.mvc;

class DMVCDeletePageHeaderViewComponent : DMVCPageHeaderViewComponent {
  mixin(ViewComponentThis!("MVCDeletePageHeaderViewComponent"));
  
  override void initialize() {
    super.initialize;

    this
      .actions([["refresh"], ["list"], ["view", "edit"], ["print", "export"]]); 
  }
}
mixin(ViewComponentCalls!("MVCDeletePageHeaderViewComponent", "DMVCDeletePageHeaderViewComponent"));
mixin(ViewComponentCalls!("MVCDeletePageHeader", "DMVCDeletePageHeaderViewComponent"));
