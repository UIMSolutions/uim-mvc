/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.commands.base;

import uim.mvc;

@safe:
class DBaseCommand /* : ICommand */ {
  mixin(OProperty!("string", "name"));

  int run(STRINGAA arguments) {
    return 0;
  }
}

auto BaseCommand() {
  return new DBaseCommand;
}

version (test_uim_mvc) {
  unittest {
    assert(BaseCommand);
  }
}
