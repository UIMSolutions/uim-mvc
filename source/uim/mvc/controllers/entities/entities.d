module uim.mvc.controllers.entities.entities;

@safe:
import uim.mvc;

class DAPPEntitiesController : DController {
  mixin(ControllerThis!("APPEntitiesController"));

  protected DEntity[] _entities;
  DEntity[] entities() { return _entities; }
  bool hasEntities() {
    return (this.entities !is null); 
  }

  void entities(DEntity[] newEntities) {
    _entities = newEntities;
  }
}
mixin(ControllerCalls!("APPEntitiesController"));