sealed class BottomNavigationBarIntent {}
class SelectedIndex extends BottomNavigationBarIntent{
  final int index;
  SelectedIndex(this.index);

}