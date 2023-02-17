module uim.mvc.controllers.checks.requests.accountid;

@safe:
import uim.mvc;

class DRequestHasAccountIdCheck : DDatabaseHasAccountsCheck {
  mixin(ControllerComponentThis!("RequestHasAccountIdCheck"));

  override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
    .redirectUrl("/login");
  }

  override bool execute(STRINGAA options = null) {
    debug writeln(moduleName!RequestHasAccountIdCheck~"::execute");
    if (!super.execute(options)) { return false; }

    if ("accountId" !in options) { // Account  missing
      this.error("request_accountid_missing");
      return false; 
    }

    debug writeln("accountId = ", options["accountId"]);
    return true;
  }
}
mixin(ControllerComponentCalls!("RequestHasAccountIdCheck"));