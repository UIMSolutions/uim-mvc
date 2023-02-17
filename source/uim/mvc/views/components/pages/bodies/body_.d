module uim.mvc.views.components.pages.bodies.body_;

@safe:
import uim.mvc;

class DPageBodyViewComponent : DViewComponent {
  mixin(ViewComponentThis!("PageBodyViewComponent"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    super.toH5(options);
     
    return
      [
        UIMPageBody(id, ["mb-3"], 
          UIMCard(
            UIMCardBody(
              // add Content
            )
          )
        )
      ].toH5;
  }
}
mixin(ViewComponentCalls!("PageBodyViewComponent", "DPageBodyViewComponent"));
mixin(ViewComponentCalls!("MVCPageBody", "DPageBodyViewComponent"));
