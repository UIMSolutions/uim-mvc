module uim.mvc.interfaces.cacheengine;

import uim.mvc;
@safe:

/**
 * Interface for cache engines that defines methods
 * outside of the PSR16 interface that are used by `Cache`.
 *
 * Internally Cache uses this interface when calling engine
 * methods.
 */
interface ICacheEngine {
  /**
    * Write data for key into a cache engine if it doesn"t exist already.
    *
    * dataId - Identifier for the data.
    * @param mixed value Data to be cached - anything except a resource.
    * @return bool True if the data was successfully cached, false on failure.
    *   Or if the key existed already.
    */
  bool addData(string dataId, IValue value);

  /**
    * Increment a number under the key and return incremented value
    *
    * dataId - Identifier for the data.
    * @param int anOffset How much to add
    * @return int|false New incremented value, false otherwise
    */
  int increment(string dataId, int anOffset = 1);

  /**
    * Decrement a number under the key and return decremented value
    *
    * dataId - Identifier for the data.
    * @param int anOffset How much to subtract
    * @return int|false New incremented value, false otherwise
    */
  int decrement(string dataId, int anOffset = 1);

  /**
    * Clear all values belonging to the named group.
    *
    * Each implementation needs to decide whether actually
    * delete the keys or just augment a group generation value
    * to achieve the same result.
    *
    * @param string group name of the group to be cleared
    * @return bool
    */
  bool clearGroup(string aGroup);
}
