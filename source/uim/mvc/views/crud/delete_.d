/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.crud.delete_;

import uim.mvc;

@safe:
class DEntityDeleteView : DEntityCRUDView {
  mixin(ViewThis!("EntityDeleteView"));
  
override bool initialize(IData[string] configSettings = null) {
    super.initialize(configSettings);

    this.crudMode(CRUDModes.Delete);
    this.header(
      PageHeader(this)
        .actions([["refresh", "list", "create"]]));

    this.form(
      Form(this)
        .crudMode(CRUDModes.Delete)
        .header(
          FormHeader
            .actions([["cancel2root", "finalDelete"], ["view", "version", "edit"], ["print", "export"]])));
  }
}
mixin(ViewCalls!("EntityDeleteView"));

version(test_uim_mvc) { unittest {
  writeln("--- Tests in ", __MODULE__, "/", __LINE__);
  testView(new DEntityDeleteView); 

  writeln("--- Tests in ", __MODULE__, "/", __LINE__);
  testView(EntityDeleteView); 
}}