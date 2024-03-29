module uim.mvc.interfaces.configengine;

import uim.mvc;
@safe:

// An interface for creating objects compatible with Configure::load()
interface IConfigEngine {
    /**
     * Read a configuration file/storage key
     *
     * This method is used for reading configuration information from sources.
     * These sources can either be static resources like files, or dynamic ones like
     * a database, or other datasource.
     *
     * @param string aKey Key to read.
     * @return array An array of data to merge into the runtime configuration
     */
    Json read(string aKey);

    /**
     * Dumps the configure data into the storage key/file of the given `key`.
     *
     * @param string aKey The identifier to write to.
     * @param array data The data to dump.
     * @return bool True on success or false on failure.
     */
    bool dump(string aKey, Json someData);
}
