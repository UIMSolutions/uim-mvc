module uim.mvc.views.components.pages.headers.entities.create;

@safe:
import uim.mvc;

class DMVCCreatePageHeaderViewComponent : DMVCPageHeaderViewComponent {
  mixin(ViewComponentThis!("MVCCreatePageHeaderViewComponent"));
  
  override void initialize() {
    super.initialize;
    
    this
      .actions([["refresh"], ["list"]]); 
  }
}
mixin(ViewComponentCalls!("MVCCreatePageHeaderViewComponent", "DMVCCreatePageHeaderViewComponent"));
mixin(ViewComponentCalls!("MVCCreatePageHeader", "DMVCCreatePageHeaderViewComponent"));
