/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.commands.plugins.unload;

@safe:
import uim.mvc;

class DPluginUnloadCommand {
  this() { initialize; }

    void initialize() {
    // 
  }
}
auto PluginUnloadCommand() { return new DPluginUnloadCommand; }

version(test_uim_mvc) { unittest {
  assert(PluginUnloadCommand);
}}