/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.sessions.manager;

import uim.mvc;
@safe:

/* DSession[string] sessions;

class DSessionManager : ISessionManager {
	this() {}

  mixin(OProperty!("bool", "isNull"));

	// #region Sessions
		protected ISession[string] _sessions;

		ISession[] sessions() { return _sessions.values; }

		void addSession(ISession aSession) {
			aSession.manager(this);
			_sessions[aSession.httpSessionId] = aSession;
		}

		ISession session(string httpSessionId, STRINGAA options = null) {
			return _sessions.get(httpSessionId, null);
		}
		ISession session(STRINGAA options) {
			return _sessions.get(
				options.get("sessionId", null), null);
		}
	// #endregion Sessions

	bool initialize(IData[string] configSettings = null) {

    this
      .isNull(true);
  }

	bool update(ISession aSession) {
		return false;
	}
}
auto SessionManager() { return new DSessionManager(); }
 */