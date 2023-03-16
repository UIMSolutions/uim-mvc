/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.interfaces;

public {
  import uim.mvc.interfaces.action;
  import uim.mvc.interfaces.application;
  import uim.mvc.interfaces.authentication;
  import uim.mvc.interfaces.cache;
  import uim.mvc.interfaces.collection;
  import uim.mvc.interfaces.command;
  import uim.mvc.interfaces.commandfactory;
  import uim.mvc.interfaces.console;
  import uim.mvc.interfaces.container;
  import uim.mvc.interfaces.controller;
  import uim.mvc.interfaces.controllercomponent;
  import uim.mvc.interfaces.event;
  import uim.mvc.interfaces.eventlistener;
  import uim.mvc.interfaces.eventmanager;
  import uim.mvc.interfaces.form;
  import uim.mvc.interfaces.layout;
  import uim.mvc.interfaces.model;
  import uim.mvc.interfaces.mvc;
  import uim.mvc.interfaces.page;
  import uim.mvc.interfaces.request;
  import uim.mvc.interfaces.route;
  import uim.mvc.interfaces.view;
  import uim.mvc.interfaces.viewcomponent;
}
/* interface IAPPWithEntities {  
  @property DEntity[] entities();
  // @property O entities(this O)(DEntity[] myEntities);
  @property void entities(DEntity[] myEntities);
}

interface IAPPWithEntity {  
  @property DEntity entity();
  @property O entity(this O)(DEntity myEntity);
} */