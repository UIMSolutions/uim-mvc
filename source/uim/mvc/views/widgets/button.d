module uim.mvc.views.widgets;

@safe:
import uim.mvc;

/**
 * Button input class
 *
 * This input class can be used to render button elements.
 * If you need to make basic submit inputs with type=submit,
 * // use  the Basic input widget.
 */
class ButtonWidget : DWidget {
    // StringTemplate instance.
    protected DVIWStringTemplate _templates;

    /**
     * Constructor.
     *
     * @param uim.mvc.views\StringTemplate myTemplates Templates list.
     */
    this(StringTemplate aTemplate) {
        super(aTemplate);
        _templates = aTemplate;
    }

    override void initialize() {
        super.initialize;
    }
    /**
     * Render a button.
     *
     * This method accepts a number of keys:
     *
     * - `text` The text of the button. Unlike all other form controls, buttons
     *   do not escape their contents by default.
     * - `escapeTitle` Set to false to disable escaping of button text.
     * - `escape` Set to false to disable escaping of attributes.
     * - `type` The button type defaults to "submit".
     *
     * Any other keys provided in myData will be converted into HTML attributes.
     *
     * @param array<string, mixed> myData The data to build a button with.
     * @param uim.mvc.views\Form\IContext $context The current form context.
     */
    string render(Json someData, IContext aContext) {
        myData += [
            "text": "",
            "type": "submit",
            "escapeTitle": true,
            "escape": true,
            "templateVars": [],
        ];

        return _templates.format("button", [
            "text": myData["escapeTitle"] ? h(myData["text"]) : myData["text"],
            "templateVars": myData["templateVars"],
            "attrs": _templates.formatAttributes(myData, ["text", "escapeTitle"]),
        ]);
    }


    array secureFields(array myData) {
        if (!myData.isSet("name") || myData["name"] == "") {
            return [];
        }

        return [myData["name"]];
    }
}