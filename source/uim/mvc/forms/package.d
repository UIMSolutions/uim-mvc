/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.forms;

import uim.mvc;
@safe:

public { // Main
	import uim.mvc.forms.form;
	import uim.mvc.forms.registry;
}

// Packages
public {
	import  uim.mvc.forms.components;
	import  uim.mvc.forms.crud;
	import  uim.mvc.forms.schemas;
}

template FormThis(string name, bool withEntity = false, bool withEntities = false) {
  const char[] FormThis = `
this() { super(); this.name("`~name~`"); initialize; }
this(DView myView) { this().view(myView); }
this(string myName) { this().name(myName); }
this(DView myView, string myName) { this(myView).name(myName); }`~
(withEntity ? `
this(DEntity myEntity) { this().entity(myEntity); }
this(DView myView, DEntity myEntity) { this(myView).entity(myEntity); }
this(string myName, DEntity myEntity) { this(myName).entity(myEntity); }
this(DView myView, string myName, DEntity myEntity) { this(myView, myName).entity(myEntity); }
` : ``)~
(withEntities ? `
this(DEntity[] myEntities) { this().entities(myEntities); }
this(DView myView, DEntity[] myEntities) { this(myView).entities(myEntities); }
this(string myName, DEntity[] myEntities) { this(myName).entities(myEntities); }
this(DView myView, string myName, DEntity[] myEntities) { this(myView, myName).entities(myEntities); }
` : ``);
}

template FormCalls(string name, bool withEntity = false, bool withEntities = false) {
  const char[] FormCalls = `
auto `~name~`() { return new D`~name~`(); }
auto `~name~`(DView myView) { return new D`~name~`(myView); }
auto `~name~`(string myName) { return new D`~name~`(myName); }
auto `~name~`(DView myView, string myName) { return new D`~name~`(myView, myName); }`~
(withEntity ? `
auto `~name~`(DEntity myEntity) { return new D`~name~`(myEntity); }
auto `~name~`(DView myView, DEntity myEntity) { return new D`~name~`(myView, myEntity); }
auto `~name~`(string myName, DEntity myEntity) { return new D`~name~`(myName, myEntity); }
auto `~name~`(DView myView, string myName, DEntity myEntity) { return new D`~name~`(myView, myName, myEntity); }
` : ``)~
(withEntities ? `
auto `~name~`(DEntity[] myEntities) { return new D`~name~`(myEntities); }
auto `~name~`(DView myView, DEntity[] myEntities) { return new D`~name~`(myView, myEntities); }
auto `~name~`(string myName, DEntity[] myEntities) { return new D`~name~`(myName, myEntities); }
auto `~name~`(DView myView, string myName, DEntity[] myEntities) { return new D`~name~`(myView, myName, myEntities); }
` : ``);
}

