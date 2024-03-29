/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.interfaces.route;

import uim.mvc;
@safe:

interface IRoute : IMVCObject {
	IRouteManager manager();
	void manager(IRouteManager aManager);
	
	string path();
  HTTPMethod method();

	bool isHandler(string aPath, vibe.http.common.HTTPMethod aMethod);

  IController controller();
}
