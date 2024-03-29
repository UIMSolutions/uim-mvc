module uim.mvc.scripts.entities.delete_;

import uim.mvc;
@safe:

auto deleteEntity() {
  string result;

  result ~= jsElementById(["entity_id", "entity_name", "entity_display", "entity_description", "messages"]);

  return result;
}

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    auto f = File("../../PUBLIC/js/apps/entities/delete.js", "w"); // open for writing
    f.write(deleteEntity);
}}