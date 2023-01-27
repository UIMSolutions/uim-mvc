module uim.mvc.routes.route;

@safe:
import uim.mvc;

class DMVCRoute : DMVCBase, IBKLRoute {
  this() { super(); }
  this(string aPath, HTTPMethod aMethod, DMVCController aController) {
    this().path(aPath).method(aMethod).controller(aController);
  }

  override void initialize() {
    super.initialize;
  }

  mixin(OProperty!("string", "path"));
  mixin(OProperty!("HTTPMethod", "method"));
  mixin(OProperty!("DMVCController", "controller"));
}
auto BKLRoute() { return new DMVCRoute; }
auto BKLRoute(string aPath, HTTPMethod aMethod, DMVCController aController) { return new DMVCRoute(aPath, aMethod, aController); }

version(test_uim_mvc) { unittest { 
  assert(BKLRoute);
  assert(BKLRoute("testPath", HTTPMethod.GET, BKLController));
  assert(BKLRoute("testPath", HTTPMethod.GET, BKLActionController));
  assert(BKLRoute("testPath", HTTPMethod.GET, BKLPageController));
}} 
