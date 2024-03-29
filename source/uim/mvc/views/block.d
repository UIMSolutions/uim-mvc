/***********************************************************************************************************************
*	Copyright: © 2017-2022 UI Manufaktur UG / 2022 Ozan Nurettin Süel (sicherheitsschmiede)                              *
*	License: Licensed under Apache 2 [https://apache.org/licenses/LICENSE-2.0.txt]                                       *
*	Authors: UI Manufaktur UG Team, Ozan Nurettin Süel (Sicherheitsschmiede)										                         * 
***********************************************************************************************************************/
module uim.mvc.views.block;

import uim.mvc;

@safe:
class DViewBlock {
  this() {
  }

  this(DH5Obj[] content) {
    this();
    this.content(content);
  }

  // Override content
  static const string OVERRIDE = "override";

  // Append content
  static const string APPEND = "append";

  // Prepend content
  static const string PREPEND = "prepend";

  // Name of block view
  mixin(OProperty!("string", "name"));

  // #region blocks
  // An array of blocks indexed by name.
  mixin(OProperty!("DViewBlock[string]", "blocks"));

  // Check if a block exists
  bool exists(string name) { // name = Name of the block
    return name in _blocks ? true : false;
  }

  // Get the names of all the existing blocks.
  string[] keys() {
    return _blocks.byKey.array;
  }

  // Add/Set block.
  O set(this O)(string name, DH5Obj[] blockContent) { // name = Name of the block, blockContent = The content for the block
    _blocks[name] = ViewBlock(blockContent);
    return cast(O) this;
  }

  // Get block.
  DViewBlock get(string name, DViewBlock defaultValue = null) { // name = Name of the block, defaultValue = Default block
    return _blocks.get(name, defaultValue);
  } // return = The block content or defaultValue if the block does not exist.

  // Get block.
  DViewBlock get(string name, DH5Obj[] content) { // name = Name of the block, defaultValue = Default block
    return _blocks.get(name, ViewBlock(content));
  } // return = The block content or defaultValue if the block does not exist.

  // Remove blocks
  O remove(this O)(string[] names...) {
    remove(names);
    return cast(O) this;
  }

  // Remove blocks
  O remove(this O)(string[] names) {
    names.each!(name => _blocks.remove(name));
    return cast(O) this;
  }
  // #endregion blocks

  // #region content
  O append(this O)(DH5Obj[] newContent...) {
    append(newContent);
    return cast(O) this;
  }

  O append(this O)(DH5Obj[] newContent) {
    _content ~= newContent;
    return cast(O) this;
  }

  // Content of block.
  mixin(OProperty!("DH5Obj[]", "content"));
  // #endregion content

  // content of a viewBlock
  DH5Obj[] toH5(STRINGAA options) {
    return content;
  }

  // render viewBlockrender
  string render(STRINGAA options) {
    auto h5 = toH5(options);

    return h5 !is null
      ? h5.map!(a => a.toString).join() 
      : "";
  }
}

auto ViewBlock() {
  return new DViewBlock;
}

auto ViewBlock(DH5Obj[] content) {
  return new DViewBlock(content);
}

version (test_uim_mvc) {
  unittest {
    assert(ViewBlock);
  }
}
