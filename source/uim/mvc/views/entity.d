module uim.mvc.views.entity;

@safe:
import uim.mvc;

// View with entity
class DEntityView : DView {
  mixin(ViewThis!("EntityView"));
  
  // mixin(OProperty!("DEntity", "entity"));
  mixin(OProperty!("CRUDModes", "crudMode"));

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DEntityView~":DEntityView("~this.name~")::beforeH5");
    super.beforeH5(options);

    debug writeln("In DEntityView -> "~(this.entity ? "has entity" : "no entity"));
    this
      .components.all
        .filter!(comp => cast(DEntityViewComponent)comp)
        .each!(comp => (cast(DEntityViewComponent)comp).entity(this.entity));
  }
}
mixin(ViewCalls!("EntityView"));