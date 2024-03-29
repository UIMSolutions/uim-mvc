/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.interfaces.consoleapplication;

import uim.mvc;
@safe:

// An interface defining the methods that the console runner depend on.
interface IConsoleApplications {
  /**
    * Load all the application configuration and bootstrap logic.
    * Override this method to add additional bootstrap logic for your application.
    */
  void bootstrap();

  /**
    * Define the console commands for an application.
    *
    * commandCollection - The command collection to add commands into.
    * returns the updated command collection.
    */
  DCommandCollection console(DCommandCollection commandCollection);
}