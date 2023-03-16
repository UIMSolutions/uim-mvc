module uim.mvc.interfaces.formatter;

@safe:
import uim.mvc;

interface IFormatter : IMVCObject {
  /**
  * Returns a string with all passed variables interpolated into the original
  * message. Variables are interpolated using the sprintf format.
  *
  * messageLocale - The locale in which the message is presented.
  * messageToTranslate - The message to be translated
  * tokenValues - The list of values to interpolate in the message
  * @return string The formatted message
  */
  string format(string messageLocale, string messageToTranslate, STRINGAA tokenValues);
}