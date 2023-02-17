module uim.mvc.views.entities;

@safe:
import uim.mvc;

// View with entities
class DEntitiesView : DView {
  mixin(ViewThis!("EntitiesView"));
  
  // mixin(OProperty!("DEntity[]", "entities"));

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DEntitiesView~":DEntitiesView("~this.name~")::beforeH5");
    super.beforeH5(options);

    debug writeln("In DEntitiesView -> %s entities".format(this.entities.length));
    this
      .components.all
        .filter!(comp => cast(DEntitiesViewComponent)comp)
        .each!(comp => (cast(DEntitiesViewComponent)comp).entities(this.entities));
  }
}
mixin(ViewCalls!("EntitiesView"));