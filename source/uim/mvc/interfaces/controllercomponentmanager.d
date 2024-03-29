/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.interfaces.controllercomponentmanager;

import uim.mvc;
@safe:

interface IControllerComponentManager : ISessionManager {
  IEntityBase entityBase();
  HTTPServerRequest request();

  IControllerComponent[] components();
  void components(IControllerComponent[] someComponents);
  void addComponents(IControllerComponent[] someComponents);
  void addComponent(IControllerComponent aComponent);
}