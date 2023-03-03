/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.routers.logout;

@safe:
import uim.mvc;

void uimLogout(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimLogout~":uimLogout");

  APPLogoutPageController(thisServer).request(req, res);
}