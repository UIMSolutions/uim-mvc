module uim.mvc.scripts.entities.view;

import uim.mvc;
@safe:

auto viewEntity() {
  string result;

  result ~= jsElementById(["entity_id", "entity_name", "entity_display", "entity_description", "messages"]);

  return result;
}

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    auto f = File("../../PUBLIC/js/apps/entities/view.js", "w"); // open for writing
    f.write(viewEntity);
}}