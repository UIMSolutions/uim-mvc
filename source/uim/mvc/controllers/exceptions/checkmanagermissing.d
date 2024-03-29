/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.exceptions.checkmanagermissing;

import uim.mvc;
@safe:

class DManagerMissingException : DException {
	mixin(ExceptionThis!("ManagerMissingException"));

	override bool initialize(IData[string] configSettings = null) {
		super.initialize(configSettings);

    this
      .message("Manager for Check is missing");
  }
}
mixin(ExceptionCalls!("ManagerMissingException"));

