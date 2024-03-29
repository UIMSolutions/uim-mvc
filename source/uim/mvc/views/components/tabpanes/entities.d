/***********************************************************************************************************************
*	Copyright: © 2017-2022 UI Manufaktur UG / 2022 Ozan Nurettin Süel (sicherheitsschmiede)                              *
*	License: Licensed under Apache 2 [https://apache.org/licenses/LICENSE-2.0.txt]                                       *
*	Authors: UI Manufaktur UG Team, Ozan Nurettin Süel (Sicherheitsschmiede)										                         * 
***********************************************************************************************************************/
module uim.mvc.views.components.tabpanes.entities;

import uim.mvc;

@safe:
class DAPPEntitiesTabpane : DTabPane {
  mixin(ViewComponentThis!("APPEntitiesTabpane"));

override bool initialize(IData[string] configSettings = null) {
    super.initialize(configSettings);

    this.content(APPEntitiesList.itemTemplate(EntityListItem));
  }

  // mixin(OProperty!("DEntity[]", "entities"));
}
mixin(ViewComponentCalls!("APPEntitiesTabpane"));

