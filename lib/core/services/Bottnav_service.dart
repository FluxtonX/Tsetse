class BottomNavService {
  int selectedIndex = 0;

  int getIndex() {
    return selectedIndex;
  }

  void updateIndex(int index) {
    selectedIndex = index;
  }
}
