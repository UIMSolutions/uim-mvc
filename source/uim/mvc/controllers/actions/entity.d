module uim.mvcs.controllers.actions.entity;

@safe:
import uim.mvcs;

class DAPPEntityActionController : DActionController {
  mixin(ControllerThis!("APPEntityActionController"));

  mixin(OProperty!("DEntity", "entity"));
}
mixin(ControllerCalls!("APPEntityActionController"));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    testController(new DAPPEntityActionController);

    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    testController(APPEntityActionController);
}}