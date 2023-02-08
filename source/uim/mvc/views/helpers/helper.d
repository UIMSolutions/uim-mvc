/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views;

@safe:
import uim.mvc;

/**
 * Abstract base class for all other Helpers in UIM.
 * Provides common methods and features.
 *
 * ### Callback methods
 *
 * Helpers support a number of callback methods. These callbacks allow you to hook into
 * the various view lifecycle events and either modify existing view content or perform
 * other application specific logic. The events are not implemented by this base class, as
 * implementing a callback method subscribes a helper to the related event. The callback methods
 * are as follows:
 *
 * - `beforeRender(IEvent myEvent, $viewFile)` - beforeRender is called before the view file is rendered.
 * - `afterRender(IEvent myEvent, $viewFile)` - afterRender is called after the view file is rendered
 *   but before the layout has been rendered.
 * - beforeLayout(IEvent myEvent, $layoutFile)` - beforeLayout is called before the layout is rendered.
 * - `afterLayout(IEvent myEvent, $layoutFile)` - afterLayout is called after the layout has rendered.
 * - `beforeRenderFile(IEvent myEvent, $viewFile)` - Called before any view fragment is rendered.
 * - `afterRenderFile(IEvent myEvent, $viewFile, myContents)` - Called after any view fragment is rendered.
 *   If a listener returns a non-null value, the output of the rendered file will be set to that.
 */
class Helper : IEventListener {
/*     use InstanceConfigTrait; */

  // List of helpers used by this helper
  protected string[] _helpers;

  // Default config for this helper.
  protected Json _defaultConfig = Json(null);

  // A helper lookup table used to lazy load helper objects.
  protected array[string] _helperMap = null;

  // The View instance this helper is attached to
  protected DView _view;
  /**
    * Get the view instance this helper is bound to.
    * returns The bound view instance.
    */
  auto DView view() {
    return _view;
  }
  /**
    * Default Constructor
    *
    * attachedView - The View this helper is being attached to.
    * aConfig - Configuration settings for the helper.
    */
  this(DView attachedView, Json configSettings = Json(null)) {
    _view = attachedView;
    this.setConfig(configSettings);

    if (!empty(this.helpers)) {
      _helperMap = $view.helpers().normalizeArray(this.helpers);
    }

    this.initialize(configSettings);
  }

  /**
    * Constructor hook method.
    *
    * Implement this method to avoid having to overwrite the constructor and call parent.
    *
    * configSettings - The configuration settings provided to this helper.
    */
  void initialize(Json configSettings) {
  }
  /**
    * Provide non fatal errors on missing method calls.
    *
    * methodName - Method to invoke
    * @param array myParams Array of params for the method.
    * @return mixed|void
    */
  auto __call(string methodName, array myParams) {
    trigger_error(sprintf("Method %1$s::%2$s does not exist", static::class, $method), E_USER_WARNING);
  }

  /**
    * Lazy loads helpers.
    *
    * propertyName - Name of the property being accessed.
    * @return uim.mvc.views\Helper|null|void Helper instance if helper with provided name exists
    */
  auto __get(string propertyName) {
    if (isSet(_helperMap, myName) && !isSet(this.{myName})) {
      myConfig = ["enabled": false] + (array)_helperMap[myName]["config"];
      this.{myName} = _View.loadHelper(_helperMap[myName]["class"], myConfig);

      return this.{myName};
    }
  }

  /**
    * Returns a string to be used as onclick handler for confirm dialogs.
    *
    * @param string okCode Code to be executed after user chose "OK"
    * @param string cancelCode Code to be executed after user chose "Cancel"
    * @return string "onclick" JS code
    */
  protected string _confirm(string okCode, string cancelCode) {
    return "if (confirm(this.dataset.confirmMessage)) { {$okCode} } {$cancelCode}";
  }

  /**
    * Adds the given class to the element options
    *
    * @param array<string, mixed> myOptions Array options/attributes to add a class to
    * @param string myClass The class name being added.
    * @param string myKey the key to use for class. Defaults to `"class"`.
    * @return array<string, mixed> Array of options with myKey set.
    */
  array addClass(array myOptions, string myClass, string myKey = "class") {
    if (isSet(myOptions, myKey) && is_array(myOptions[myKey])) {
      myOptions[myKey] ~= myClass;
    } elseif (isSet(myOptions[myKey]) && trim(myOptions[myKey])) {
      myOptions[myKey] ~= " " ~ myClass;
    } else {
      myOptions[myKey] = myClass;
    }

    return myOptions;
  }

  /**
    * Get the View callbacks this helper is interested in.
    *
    * By defining one of the callback methods a helper is assumed
    * to be interested in the related event.
    *
    * Override this method if you need to add non-conventional event listeners.
    * Or if you want helpers to listen to non-standard events.
    *
    * @return array<string, mixed>
    */
  Json implementedEvents() {
    myEventMap = [
      "View.beforeRenderFile": "beforeRenderFile",
      "View.afterRenderFile": "afterRenderFile",
      "View.beforeRender": "beforeRender",
      "View.afterRender": "afterRender",
      "View.beforeLayout": "beforeLayout",
      "View.afterLayout": "afterLayout",
    ];
    Json myEvents = Json.emptyObject;
    foreach (myEvent, $method; myEventMap) {
      if (method_exists(this, $method)) {
        myEvents[myEvent] = $method;
      }
    }

    return myEvents;
  }

  // Returns an array that can be used to describe the internal state of this object.
  Json __debugInfo() {
    auto myDebugInfo = Json.emptyObject;
    
    myDebugInfo["helpers"] = this.helpers;
    myDebugInfo["implementedEvents"] = this.implementedEvents();
    myDebugInfo["_config"] = this.getConfig();

    return myDebugInfo;
  }
}
