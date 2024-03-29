/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.forms.crud.read;

import uim.mvc;

@safe:
class DMVCReadForm : DEntityForm {
  mixin(ViewComponentThis!("MVCReadForm"));

  override bool initialize(IData[string] configSettings = null) {
    super.initialize(configSettings);

    this
      .crudMode(CRUDModes.Read);
  }
}
mixin(ViewComponentCalls!("MVCReadForm", "DMVCReadForm"));

/* 
auto viewForm(T:DEntity)(string path, T entity, STRINGAA[] panes, STRINGAA requestParameters) {


    auto createdOn = (cast(DateTime)fromTimestamp(entity.createdOn)).toISOExtString;
    auto modifiedOn = (cast(DateTime)fromTimestamp(entity.modifiedOn)).toISOExtString;

    return 
    H5Form(["card"], ["action":path~"/create/action", "method":"post"], 
      BS5CardHeader( 
        H5H4(["card-title"], "ID: "~entity.id.toString)
      ),
      BS5CardBody(
        BS5Row( 
          BS5Col(["col-12"], 
            BS5InputHidden(["name":"entity_id", "value": entity.id.toString])~
            viewFormFroups(entity)
          )
        )),       
      BS5CardBody(["container-fluid"],
        BS5Row(
          BS5Col(["col-12"], 
            cardTabs(entity, panes, requestParameters)                       
            )
          )
        )
      );
}

auto viewForm(T:DEntity)(string path, T entity, DMVCPanes panes, STRINGAA requestParameters) {

    return 
    H5Form(["card"], ["action":path~"/create/action", "method":"post"], 
          BS5CardHeader( 
            H5H4(["card-title"], "ID: "~entity.id.toString)
          ),
          BS5CardBody(
            BS5Row( 
              BS5Col(["col-12"], 
                BS5InputHidden(["name":"entity_id"]).value(entity.id)~
                viewFormGroups(entity)
            ))),       
        BS5CardBody(["container-fluid"],
              BS5Row(
                BS5Col(["col-12"], 
                  panes.toString(requestParameters)                       
              )
            )
          )
      );
}

DH5Obj[] viewFormGroups(DEntity entity, string[] fields = ["name", "display", "description"]) {
  DH5Obj[] results; 

  foreach(field; fields) {
    switch(field) {
      case "name": results ~= BS5FormGroup(["row", "mb-1"],
        H5Label(["form-label col-2 col-form-label"], "Name"),
        BS5Col(["col"], 
          UIMTextInput(["name":"entity_name", "readonly":"readonly"]).value(entity.name)));
        break;
      case "display": results ~= BS5FormGroup(["row", "mb-1"],
        H5Label(["form-label col-2 col-form-label"], "Titel"),
        BS5Col(["col"], 
          UIMTextInput(["name":"entity_display", "readonly":"readonly"]).value(entity.display)));
        break;
      case "description": results ~= BS5FormGroup(["row", "mb-1"],
        H5Label(["form-label col-2 col-form-label"], "Beschreibung"),
        BS5Col(["col"], 
          UIMTextInputarea(["rows":"3", "name":"entity_description", "readonly":"readonly"], entity.description)));
        break;
      default: break;
    }
  }
  return results;
} */