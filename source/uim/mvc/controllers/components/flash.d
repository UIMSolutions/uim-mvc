module uim.mvc.controllers.components.flash;

@safe:
import uim.mvc;

/**
 * The UIM FlashComponent provides a way for you to write a flash variable
 * to the session from your controllers, to be rendered in a view with the FlashHelper.
 *
 * @method void success(string $message, DOptions someOptions = null) Set a message using "success" element
 * @method void info(string $message, DOptions someOptions = null) Set a message using "info" element
 * @method void warning(string $message, DOptions someOptions = null) Set a message using "warning" element
 * @method void error(string $message, DOptions someOptions = null) Set a message using "error" element
 */
class FlashComponent : DControllerComponent {
  mixin(ControllerComponentThis!("FlashControllerComponent"));
  
  override void initialize(DConfig configSettings = null) {
    super.initialize(configSettings);

    // Default configuration
    _defaultConfig["key"] = "flash";
    _defaultConfig["element"] = "default";
    _defaultConfig["params"] = ArrayValue;
    _defaultConfig["clear"] = false;
    _defaultConfig["duplicate"] = true;
  }
}