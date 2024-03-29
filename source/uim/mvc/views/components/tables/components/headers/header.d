/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.components.tables.components.headers.header;

import uim.mvc;

@safe:
class DTableHeader : DTableComponent {
  mixin(ViewComponentThis!("MVCTableHeader"));

  mixin(OProperty!("STRINGAA[]", "cols"));

  override DH5Obj[] toH5(STRINGAA options = null) { // hook
    super.toH5(options);
    if (hasError || "redirect in options") { return null; }

    DH5Obj[] ths;
    foreach(col; cols) {
      auto th = H5Td;
      if ("classes" in col) { th.classes([col["classes"]]); }
      if ("id" in col) { th.id(col["id"]); }
      if ("name" in col) { th.attribute("name", col["name"]); }
      if ("display" in col) { th(col["display"]); }
      if ("content" in col) { th(col["content"]); }
      ths ~= th;
    }

    return [H5Thead.row(ths)].toH5;
  }
}
mixin(ViewComponentCalls!("MVCTableHeader", "DTableHeader"));
