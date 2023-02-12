/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.components.forms.crud.create;

@safe:
import uim.mvc;

class DMVCCreateForm : DMVCEntityForm {
  mixin(ViewComponentThis!("MVCCreateForm"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .crudMode(CRUDModes.Create);
  }
}
mixin(ViewComponentCalls!("MVCCreateForm", "DMVCCreateForm"));

/* 
auto createPageHeader(string path, string mainTitle, string subTitle) {
  return
    H5Div(["page-header d-print-none"], 
      BS5Row(["align-items-center"])
        .col(["col"], 
          H5Div("pageBreadcrumbs", [BreadcrumbsStyle], mainTitle),
          H5H2(["page-title"], "Create "~subTitle))
        .col(["col-auto ms-auto d-print-none"], 
          H5Div(["btn-list"], 
            H5Span(["d-none d-sm-inline"], 
              buttonLinkRefresh(path),
              buttonLinkList(path)
              )
            )
    ));
}

auto createForm(string path, string id, STRINGAA reqParameters) {
  return 
    H5Form("entity_create", ["card"], 
      createheader(path, id, reqParameters),
      MVCCreatebody_.path(path).id(id).toH5(reqParameters)
    );
}

auto createheader(string path, string id, STRINGAA reqParameters) {
  return 
    BS5CardHeader( 
      H5H4(["card-title me-auto"], "ID: "~id),
      H5Div(["btn-list"], 
        H5Span(["d-none d-sm-inline"], 
            resetClear,
            submitSave
          )
        )
      );
}



 */