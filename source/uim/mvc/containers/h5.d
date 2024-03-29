/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.containers.h5;

import uim.mvc;
@safe:

// Container for H5 data
class DH5Container {
  mixin(OProperty!("DH5Obj[]", "entries"));
  DH5Obj[] toH5() { return _entries; }

  O entries(this O)(STRINGAA[] newEntries...) { 
    this.entries(newEntries); 
    return cast(O)this;
  }

	O add(this O, T:DH5Obj)(T[] newEntries...) { 
    this.add(newEntries); 
    return cast(O)this;
  }
	
  O add(this O, T:DH5Obj)(T[] newEntries) { 
    this.entries(this.entries~newEntries.toH5); 
    return cast(O)this;
  }

	O remove(this O)(size_t pos) { 
    this.entries(this.entries.remove(pos)); 
    return cast(O)this; }
	
  O removeByKey(this O)(string key) { 
    this.entries(this.entries.filter!(entry => key in entry.attributes).array); 
    return cast(O)this; 
  }

  O removeByNoKey(this O)(string key) { 
    this.entries(this.entries.filter!(entry => key !in entry.attributes).array); 
    return cast(O)this; 
  }

  O removeKeyWithValue(this O)(string key, string value) { 
    this.entries(this.entries.filter!(entry => entry.attributes.get(key, null) != value).array); 
    return cast(O)this; 
  }

  O clear(this O)() { 
    _entries = null; 
    return cast(O)this; 
  }
}
auto H5Container() { return new DH5Container; }