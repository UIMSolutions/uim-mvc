module uim.mvc.interfaces.i18ndatetime;

/**
 * Interface for date formatting methods shared by both Time & Date.
 */
interface I18nDateTime /* : IChronos, JsonSerializable */ {
    /**
     * Gets the default locale.
     *
     * @return string|null The default locale string to be used or null.
     */
    string defaultLocale();

    /**
     * Sets the default locale.
     *
     * @param string|null locale The default locale string to be used or null.
     */
    void defaultLocale(string aLocale);

    /**
     * Returns a nicely formatted date string for this object.
     *
     * The format to be used is stored in the property `Time::niceFormat`.
     *
     * @param \DateTimeZone|string|null timezone Timezone string or DateTimeZone object
     * in which the date will be displayed. The timezone stored for this object will not
     * be changed.
     * @param string|null locale The locale name in which the date should be displayed (e.g. pt-BR)
     * @return string Formatted date string
     */
    /* string nice(DateTimeZone timezone = null, string locale = null); */

    /**
     * Returns a formatted string for this time object using the preferred format and
     * language for the specified locale.
     *
     * It is possible to specify the desired format for the string to be displayed.
     * You can either pass `IntlDateFormatter` constants as the first argument of this
     * function, or pass a full ICU date formatting string as specified in the following
     * resource: https://unicode-org.github.io/icu-docs/apidoc/released/icu4c/classSimpleDateFormat.html#details.
     *
     * Additional to `IntlDateFormatter` constants and date formatting string you can use
     * Time::UNIX_TIMESTAMP_FORMAT to get a unix timestamp
     *
     * ### Examples
     *
     * ```
     * time = new Time("2014-04-20 22:10");
     * time.i18nFormat(); // outputs "4/20/14, 10:10 PM" for the en-US locale
     * time.i18nFormat(\IntlDateFormatter::FULL); // Use the full date and time format
     * time.i18nFormat([\IntlDateFormatter::FULL, \IntlDateFormatter::SHORT]); // Use full date but short time format
     * time.i18nFormat("yyyy-MM-dd HH:mm:ss"); // outputs "2014-04-20 22:10"
     * time.i18nFormat(Time::UNIX_TIMESTAMP_FORMAT); // outputs "1398031800"
     * ```
     *
     * If you wish to control the default format to be used for this method, you can alter
     * the value of the `Time::defaultLocale` variable and set it to one of the
     * possible formats accepted by this function.
     *
     * You can read about the available IntlDateFormatter constants at
     * https://secure.php.net/manual/en/class.intldateformatter.php
     *
     * If you need to display the date in a different timezone than the one being used for
     * this Time object without altering its internal state, you can pass a timezone
     * string or object as the second parameter.
     *
     * Finally, should you need to use a different locale for displaying this time object,
     * pass a locale string as the third parameter to this function.
     *
     * ### Examples
     *
     * ```
     * time = new Time("2014-04-20 22:10");
     * time.i18nFormat(null, null, "de-DE");
     * time.i18nFormat(\IntlDateFormatter::FULL, "Europe/Berlin", "de-DE");
     * ```
     *
     * You can control the default locale to be used by setting the variable
     * `Time::defaultLocale` to a valid locale string. If empty, the default will be
     * taken from the `intl.default_locale` ini config.
     *
     * @param string|int|null format Format string.
     * @param \DateTimeZone|string|null timezone Timezone string or DateTimeZone object
     * in which the date will be displayed. The timezone stored for this object will not
     * be changed.
     * @param string|null locale The locale name in which the date should be displayed (e.g. pt-BR)
     * @return string|int Formatted and translated date string
     */
    string i18nFormat(string format = null, string aTimezone = null, string aLocale = null);

    // Resets the format used to the default when converting an instance of this type to a string
    void resetToStringFormat();

    /**
     * Sets the default format used when type converting instances of this type to string
     * @param array<int>|string|int format Format.
     */
    void setToStringFormat(string format);

    /**
     * Sets the default format used when converting this object to JSON
     *
     * The format should be either the formatting constants from IntlDateFormatter as
     * described in (https://secure.php.net/manual/en/class.intldateformatter.php) or a pattern
     * as specified in (https://unicode-org.github.io/icu-docs/apidoc/released/icu4c/classSimpleDateFormat.html#details)
     *
     * It is possible to provide an array of 2 constants. In this case, the first position
     * will be used for formatting the date part of the object and the second position
     * will be used to format the time part.
     *
     * Alternatively, the format can provide a callback. In this case, the callback
     * can receive this datetime object and return a formatted string.
     *
     * @see uim.cake.i18n\Time::i18nFormat()
     * @param \Closure|array|string|int format Format.
     */
    void setJsonEncodeFormat(string format);

    /**
     * Returns a new Time object after parsing the provided time string based on
     * the passed or configured date time format. This method is locale dependent,
     * Any string that is passed to this function will be interpreted as a locale
     * dependent string.
     *
     * When no format is provided, the `toString` format will be used.
     *
     * If it was impossible to parse the provided time, null will be returned.
     *
     * Example:
     *
     * ```
     *  time = Time::parseDateTime("10/13/2013 12:54am");
     *  time = Time::parseDateTime("13 Oct, 2013 13:54", "dd MMM, y H:mm");
     *  time = Time::parseDateTime("10/10/2015", [IntlDateFormatter::SHORT, -1]);
     * ```
     *
     * @param string time The time string to parse.
     * @param array<int>|string|null format Any format accepted by IntlDateFormatter.
     * @param \DateTimeZone|string|null tz The timezone for the instance
     * @return static|null
     * @throws \InvalidArgumentException If format is a single int instead of array of constants
     */
    /* void parseDateTime(string aTtime, string aFormat = null, DateTimeZone timezone = null);
 */
    /**
     * Returns a new Time object after parsing the provided date string based on
     * the passed or configured date time format. This method is locale dependent,
     * Any string that is passed to this function will be interpreted as a locale
     * dependent string.
     *
     * When no format is provided, the `wordFormat` format will be used.
     *
     * If it was impossible to parse the provided time, null will be returned.
     *
     * Example:
     *
     * ```
     *  time = Time::parseDate("10/13/2013");
     *  time = Time::parseDate("13 Oct, 2013", "dd MMM, y");
     *  time = Time::parseDate("13 Oct, 2013", IntlDateFormatter::SHORT);
     * ```
     *
     * @param string date The date string to parse.
     * @param array|string|int|null format Any format accepted by IntlDateFormatter.
     * @return static|null
     */
    void parseDate(string aDateString, string aFormat = null);

    /**
     * Returns a new Time object after parsing the provided time string based on
     * the passed or configured date time format. This method is locale dependent,
     * Any string that is passed to this function will be interpreted as a locale
     * dependent string.
     *
     * When no format is provided, the IntlDateFormatter::SHORT format will be used.
     *
     * If it was impossible to parse the provided time, null will be returned.
     *
     * Example:
     *
     * ```
     *  time = Time::parseTime("11:23pm");
     * ```
     *
     * @param string time The time string to parse.
     * @param string|int|null format Any format accepted by IntlDateFormatter.
     * @return static|null
     */
    void parseTime(string aTimeString, string aFormat = null);

    /**
     * Get the difference formatter instance.
     *
     * @return uim.cake.Chronos\DifferenceIFormatter The formatter instance.
     */
    /* DifferenceIFormatter getDiffFormatter(); */

    /**
     * Set the difference formatter instance.
     * aFormatter - The formatter instance when setting.
     */
    /* void setDiffFormatter(DifferenceIFormatter aFormatter); */
}
