
module uim.mvc.i18n.parsers.mofile;

import uim.mvc;
@safe:

/**
 * Parses file in MO format
 *
 * @copyright Copyright (c) 2010, Union of RAD http://union-of-rad.org (http://lithify.me/)
 * @copyright Copyright (c) 2014, Fabien Potencier https://github.com/symfony/Translation/blob/master/LICENSE
 */
class MoFileParser {
    /**
     * Magic used for validating the format of a MO file as well as
     * detecting if the machine used to create that file was little endian.
     *
     * @var int
     */
    const int MO_LITTLE_ENDIAN_MAGIC = 0x950412de;

    /**
     * Magic used for validating the format of a MO file as well as
     * detecting if the machine used to create that file was big endian.
     */
    const int MO_BIG_ENDIAN_MAGIC = 0xde120495;

    // The size of the header of a MO file in bytes.
    const int MO_HEADER_SIZE = 28;

    /**
     * Parses machine object (MO) format, independent of the machine"s endian it
     * was created on. Both 32bit and 64bit systems are supported.
     *
     * @param string file The file to be parsed.
     * @return array List of messages extracted from the file
     * @throws \RuntimeException If stream content has an invalid format.
     * /
    auto parse(file) {
        stream = fopen(file, "rb");

        stat = fstat(stream);

        if (stat["size"] < self::MO_HEADER_SIZE) {
            throw new RuntimeException("Invalid format for MO translations file");
        }
        magic = unpack("V1", fread(stream, 4));
        magic = hexdec(substr(dechex(current(magic)), -8));

        if (magic == self::MO_LITTLE_ENDIAN_MAGIC) {
            isBigEndian = false;
        } elseif (magic == self::MO_BIG_ENDIAN_MAGIC) {
            isBigEndian = true;
        } else {
            throw new RuntimeException("Invalid format for MO translations file");
        }

        // offset formatRevision
        fread(stream, 4);

        count = _readLong(stream, isBigEndian);
        anOffsetId = _readLong(stream, isBigEndian);
        anOffsetTranslated = _readLong(stream, isBigEndian);

        // Offset to start of translations
        fread(stream, 8);
        messages = null;

        for (i = 0; i < count; i++) {
            pluralId = null;
            context = null;
            plurals = null;

            fseek(stream, anOffsetId + i * 8);

            length = _readLong(stream, isBigEndian);
            anOffset = _readLong(stream, isBigEndian);

            if (length < 1) {
                continue;
            }

            fseek(stream, anOffset);
            singularId = fread(stream, length);

            if (strpos(singularId, "\x04") != false) {
                [context, singularId] = explode("\x04", singularId);
            }

            if (strpos(singularId, "\000") != false) {
                [singularId, pluralId] = explode("\000", singularId);
            }

            fseek(stream, anOffsetTranslated + i * 8);
            length = _readLong(stream, isBigEndian);
            anOffset = _readLong(stream, isBigEndian);
            fseek(stream, anOffset);
            translated = fread(stream, length);

            if (pluralId != null || strpos(translated, "\000") != false) {
                translated = explode("\000", translated);
                plurals = pluralId != null ? translated : null;
                translated = translated[0];
            }

            singular = translated;
            if (context != null) {
                messages[singularId]["_context"][context] = singular;
                if (pluralId != null) {
                    messages[pluralId]["_context"][context] = plurals;
                }
                continue;
            }

            messages[singularId]["_context"][""] = singular;
            if (pluralId != null) {
                messages[pluralId]["_context"][""] = plurals;
            }
        }

        fclose(stream);

        return messages;
    }

    /**
     * Reads an unsigned long from stream respecting endianess.
     *
     * @param resource stream The File being read.
     * @param bool isBigEndian Whether the current platform is Big Endian
     * /
    protected int _readLong(stream, isBigEndian) {
        result = unpack(isBigEndian ? "N1" : "V1", fread(stream, 4));
        result = current(result);

        return (int)substr((string)result, -8);
    } */
}
