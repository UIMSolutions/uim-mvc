/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.components.tables.listheader;

import uim.mvc;

@safe:
class DMVCListTableHeader : DViewComponent {
  this() { super(); }
  this(DView myView) { this(); this.view(myView); }

  override DH5Obj[] toH5(STRINGAA options) {
    return [
      H5Tr
        .th(["w-1"], `<input id="cbSelectAllEntities" class="form-check-input m-0 align-middle" type="checkbox" aria-label="Select all">`)
        .th("headCreated", ["w-1"], H5String("Erstellt "))
        .th("headChanged", ["w-1"], H5String("Geändert "))
        .th("headName", ["w-1"], ["style":"min-width:100px;"], H5String("Name "), H5Span("nameSort", [""], tablerIcon("arrow-sort")), H5Span("nameUp", ["d-none"], tablerIcon("arrow-up")), H5Span("nameDown", ["d-none"], tablerIcon("arrow-down")))
        .th("headDisplay", [""], 
          H5Span("Titel "), 
          H5Span("displaySort", [""], tablerIcon("arrow-sort")), 
          H5Span("displayUp", ["d-none"], tablerIcon("arrow-up")), H5Span("displayDown", ["d-none"], tablerIcon("arrow-down")))
        .th("headActions", ["w-1"], H5String("Aktionen"))];
  }
}
auto MVCListTableHeader() { return new DMVCListTableHeader; }
auto MVCListTableHeader(DView myView) { return new DMVCListTableHeader(myView); }