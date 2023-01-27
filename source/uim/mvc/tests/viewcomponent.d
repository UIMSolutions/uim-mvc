module uim.mvc.tests.viewcomponent;

@safe:
import uim.mvc;

void testBKLViewComponent(DMVCViewComponent aViewComponent, string viewcomponentName) { 
  assert(aViewComponent, "ViewComponent "~viewcomponentName~" does not exist");
  assert(aViewComponent.name("testName").name == "testName", "ViewComponent "~viewcomponentName~" could not change name");
  assert(aViewComponent.parameters(["a":"b"])["a"] == "b", "ViewComponent "~viewcomponentName~" could set parameter 'a'");
  assert(aViewComponent.parameter("c", "d")["c"] == "d", "ViewComponent "~viewcomponentName~" could set parameter 'c'");
  assert(cast(DMVCViewComponent)BKLViewComponent, "ViewComponent "~viewcomponentName~" couldn't cast to DMVCViewComponent");
  assert(cast(IBKLViewComponent)BKLViewComponent, "ViewComponent "~viewcomponentName~" couldn't cast to DMVCViewComponent");
}