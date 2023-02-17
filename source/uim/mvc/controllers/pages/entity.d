module uim.mvc.controllers.pages.entity;

@safe:
import uim.mvc;

class DAPPEntityPageController : DPageController {
  mixin(ControllerThis!("APPEntityPageController"));

  protected DEntity _entity;
  DEntity entity() { 
    return _entity; 
  }
  O entity(this O)(DEntity newEntity) { 
    _entity = newEntity;

    if (auto myView = cast(DEntityView)this.view) {
      myView.entity(this.entity);
    }
    
    return cast(O)this; 
  }

  mixin(OProperty!("string", "entityName"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DPageController~":DPageController("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }
    
    this.entityName = options.get("entityName", null);
  }
}
mixin(ControllerCalls!("APPEntityPageController"));

version(test_uim_mvc) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DAPPEntityPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(APPEntityPageController); 
}}
