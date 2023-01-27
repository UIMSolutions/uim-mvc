module uim.mvc.views.components.pages.headers.entities.edit;

@safe:
import uim.mvc;

class DBKLEditPageHeaderViewComponent : DBKLPageHeaderViewComponent {
  mixin(BKLViewComponentThis!("BKLEditPageHeaderViewComponent"));
  
  override void initialize() {
    super.initialize;

    this
      .actions([["refresh"], ["list"], ["view"], ["print", "export"]]); 
  }
}
mixin(BKLViewComponentCalls!("BKLEditPageHeaderViewComponent", "DBKLEditPageHeaderViewComponent"));
mixin(BKLViewComponentCalls!("BKLEditPageHeader", "DBKLEditPageHeaderViewComponent"));
