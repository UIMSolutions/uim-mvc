module uim.mvc.views.crud.delete_;

@safe:
import uim.mvc;

class DAPPEntityDeleteView : DAPPEntityCRUDView {
  mixin(ViewThis!("APPEntityDeleteView"));

override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
    super.initialize;

    this
      .crudMode(CRUDModes.Delete)
      .header(
        PageHeader(this)
          .actions([["refresh", "list", "create"]]))
      .form(
        Form(this)
          .crudMode(CRUDModes.Delete)
          .header(
            FormHeader
              .actions([["cancel2root", "finalDelete"], ["view", "version", "edit"], ["print", "export"]])));
  }
}
mixin(ViewCalls!("APPEntityDeleteView"));

version(test_uim_apps) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DAPPEntityDeleteView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(APPEntityDeleteView); 
}}