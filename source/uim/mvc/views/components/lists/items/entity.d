/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.components.lists.items.entity;

import uim.mvc;

@safe:
class DEntityListItem : DListItem {
  mixin(ViewComponentThis!("EntityListItem"));

  mixin(OProperty!("string", "icon"));

  override bool initialize(IData[string] configSettings = null) {
    super.initialize(configSettings);

    this
      .icon(
        tablerIcon("chevron-right"));
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; }
    
    auto link = this.rootPath~this.entity.name;

    return [
      BS5Row(["align-items-center"],
        BS5Col(["col"], 
          H5A(["href":link], H5H3(this.entity.display))),
        BS5Col(["col-auto"], 
          H5A(["list-group-item-actions show"], ["href":link], this.icon)))
    ].toH5;
  }
}
mixin(ViewComponentCalls!("EntityListItem"));
