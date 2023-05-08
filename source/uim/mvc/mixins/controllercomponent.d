/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.mixins.controllercomponent;

import uim.mvc;
@safe:

string controllerComponentThis(string name) {
  return 
    mvcObjectThis(name)~
  `
    this(DController myController) { this().controller(myController); }
  `;
}

template ControllerComponentThis(string name) {
  const char[] ControllerComponentThis = controllerComponentThis(name);
}

string mvcControllerComponentCalls(string shortName, string className = null) {
  auto clName = className.length > 0 ? className : "D"~shortName;
  return `
    auto `~shortName~`() { return new `~clName~`; }
    auto `~shortName~`(IApplication myApplication) { return new `~clName~`(myApplication); }
    auto `~shortName~`(string myName) { return new `~clName~`(myName); }
    auto `~shortName~`(string[string] myParameters) { return new `~clName~`(myParameters); }

    auto `~shortName~`(string myName, string[string] myParameters) { return new `~clName~`(myName, myParameters); }

    auto `~shortName~`(IApplication myApplication, string myName) { return new `~clName~`(myApplication, myName); }
    auto `~shortName~`(IApplication myApplication, string[string] myParameters) { return new `~clName~`(myApplication, myParameters); }
  `;
}

template ControllerComponentCalls(string shortName, string className = null) {
  const char[] ControllerComponentCalls = mvcControllerComponentCalls(shortName, className);
}


