/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.consoles.commands.command;

import uim.mvc;

@safe:
class DConsoleCommand : DMVCObject, ICommand {
	  // Default error code
  const int CODE_ERROR = 1;

  // Default success code
  const int CODE_SUCCESS = 0;

	override void name(string aName) {
		super.name(aName);
	}
	override string name() {
		return super.name();
	}

  int run(STRINGAA arguments, DConsoleIo aConsoleIo = null) {
		return 0;
	}
}
auto ConsoleCommand() { return new DConsoleCommand; }