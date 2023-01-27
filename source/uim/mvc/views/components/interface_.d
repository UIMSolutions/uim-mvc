module uim.mvc.views.components.interface_;

@safe:
import uim.mvc;

interface IBKLViewComponent : IBKLBase {
  IBKLView view();
  O view(this O)(IBKLView newView);

  DH5Obj[] toH5(STRINGAA options = null);
  string render(STRINGAA options = null);
}