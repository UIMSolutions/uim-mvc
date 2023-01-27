/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.components.forms.components.contents.table;

@safe:
import uim.mvc;

class DBKLTableFormContent : DBKLEntitiesViewComponent {
  mixin(BKLViewComponentThis!("BKLTableFormContent"));

  mixin(OProperty!("DBKLViewComponent", "row"));

  override void initialize() {
    debugMethodCall(moduleName!DBKLTableFormContent~"::DBKLTableFormContent("~this.name~"):initialize");   
    super.initialize;
  }
}
mixin(BKLViewComponentCalls!("BKLTableFormContent", "DBKLTableFormContent"));

version(test_baklava) { unittest {
  assert(BKLTableFormContent);
}}