/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.components.accordions.themes;

import uim.mvc;

@safe:
class DAPPAccordionThemes : DAPPAccordion {
  mixin(ViewComponentThis!("APPAccordionThemes"));

override bool initialize(IData[string] configSettings = null) {
    super.initialize(configSettings);
    
    this
      .id("accordion-themes"); 
  }
}
mixin(ViewComponentCalls!("APPAccordionThemes"));
