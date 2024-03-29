/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.pages.crud.delete_;
/**************************************************/
/* This package contains general delete_ page definitions */
/**************************************************/

import uim.mvc;

@safe:
class DEntityDeleteController : DEntityCrudPageController {
  mixin(ControllerThis!("EntityDeleteController"));

  override bool initialize(IData[string] configSettings = null) {
    super.initialize(configSettings);

    this
      .view(EntityDeleteView)
      .scripts.addLinks(
        "/js/apps/entities/entity.js", 
        "/js/apps/entities/delete.js"); 
  }

/*   this(string newEntityName) {
    this()
    .entityName(newEntityName)
    .scripts.addLinks(
      "/js/apps/entities/"~entityName~"/entity.js", 
      "/js/apps/entities/"~entityName~"/delete.js");
  } */

    /* override void jsCode(STRINGAA requestParameters) {
    super.jsCode(requestParameters);
    if (viewMode == ViewModes.JS) 
      addToPageScript(requestParameters, 
        `
window.addEventListener('load', (event) => {
  editorSummary.disabled(true);
  editorText.disabled(true);
    setThemes('`~"(session ? session.id.toString : \"\")"~`', '`~"entity.theme.toString"~`');
    document.getElementById("Form").addEventListener("submit", event => {
      event.preventDefault();
      deleteEntity();
    })
  });`);
  else addToPageScript(requestParameters, 
        `window.addEventListener('load', (event) => {
  editorSummary.disabled(true);
  editorText.disabled(true);
  setThemes('`~"(session ? session.id.toString : \"\")"~`', '`~"entity.theme.toString"~`');
});`); 
  }
  unittest {
    version(uim_cms) {
      /// TODO
    }}
 */
  override bool beforeResponse(STRINGAA options = null) {
    debug writeln(moduleName!DEntityDeleteController~":DEntityDeleteController::beforeResponse");
    super.beforeResponse(options);   
    if ("redirect" in options) {
      // debug writeln("Redirect to "~options["redirect"]);
      return false;
    }

    string mySessionId = options.get("internalSessionId", "");
    auto mySession = manager.session(options);
    if (!mySession) {
      options["redirect"] = "/";
      return false; }
/* 
    if (!mySession.isValid(["session", "site"], options)) {
      options["redirect"] = "/";
      return; } */

    if (!manager) {
      this.error("manager_missing");
      return false; 
    }

    auto myEntityBase = manager.entityBase;
    if (!myEntityBase) {
      this.error("entitybase_missing");
      return false; 
    }

    this.entity(myEntityBase[mySession.site, collectionName].findOne(options.toEntitySelect));
    if (!entity) {
      // TODO Errorhandling
      return false;
    }

    auto poolId = uniform(1, 1_000_000_000);
    entityPool[poolId] = entity;
    options["entityPool"] = to!string(poolId);

    if (auto myView = cast(DEntityView)this.view) {
      myView.entity(this.entity);
    }  

    return true;
  }
version(test_uim_mvc) { unittest {
  writeln("--- Test in ", __MODULE__, "/", __LINE__);

    /// TODO
  }}
}
mixin(ControllerCalls!("EntityDeleteController"));


/*

auto myJsPath = "";

class DAPPDeletePage(T:DEntity) : DAPPPage {
  this() { super(); 
      this
      .title("ADMIN!CMS - Pages - Delete")
      .scripts(        
        ["src":"/js/apps/cms/app.js"],
      ["src":"/js/apps/"~myJsPath~"/entity.js"],
        ["src":"/js/apps/"~myJsPath~"/delete.js"])       
      .scripts(
        `let editor_text; let editor_summary;`~
        `
        ClassicEditor 
          .create( document.querySelector( '#entity_summary' ) )
          .then( newEditor => { editor_summary = newEditor; editor_summary.isReadOnly = true; } )
          .catch( error => { console.error( error ); } );
        ClassicEditor
          .create( document.querySelector( '#entity_text' ) )
          .then( newEditor => { editor_text = newEditor; editor_text.isReadOnly = true; } )
          .catch( error => { console.error( error ); } );
        `);
      }

    override DH5Obj[] toH5(STRINGAA requestParameters) { 
      // debug writeln(StyledString("In "~_request.path~"-DAPPDeletePage:toJson...").setForeground(AnsiColor.green).setBackground(AnsiColor.white));

      // debug writeln("Looking for entity in ->", siteName~"."~"myPool");
      auto json = this.app.DEntityBase", "entityBase.findOne("siteName", "myPool", urlToSelect(requestParameters));
      auto entity = new T(json);


      auto tabpanes = APPPanes(entity);
      tabpanes.panes([
        APPPaneGeneral(entity),
        APPPaneVersions(entity),
        APPPaneHistory(entity)
      ]);

/*       .panes(
        ACGeneralPane("general", "General", "/themes"),
        ACTabpane("specific", "Specific", myPath),
        ACAttclassesPane("attclasses", "Attribute Classes", myPath).attclasses(entity.attclasses).actions(["view"]),
        ACObjclassesPane("objclasses", "Object Classes", myPath).objclasses(entity.objclasses).actions(["view"]),
        ACVersionsPane("versions", "Versions", myPath)
          .versions(this.app.DEntityBase", "entityBase.find("themes", ["id":requestParameters["id"]])),
        ACHistoryPane("history", "History", myPath)
      );
 *      
        if ("pane" in requestParameters) tabpanes.active(requestParameters["pane"]); else tabpanes.panes[0].active = true;

      return 
        H5Div(["content"],
          H5Div(["container-xl"], 
            BS5Row("messages", [""]),
            deletePageHeader("/cms/themes", "Themes", "Delete Page", entity.id.toString),
            BS5Row(["row-cards"],
                // CMSThemeForm("delete", myPath).panes(tabpanes).entity(entity).toH5(requestParameters)
  
//                deleteTheme("/themes", entity, tabpanes, requestParameters)
            )
          )
        );

    }
}


*/