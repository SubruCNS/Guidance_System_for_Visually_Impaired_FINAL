

class GridItem {
  final String title;
  final String path;

//to initialise them
  GridItem({required this.title, required this.path});
}

GridList allGrid = GridList(grid: [
  GridItem(title: 'Camera', path: 'gridimages/profile1.png'),
  GridItem(title: 'Where To?', path: 'gridimages/profile2.png'),
  GridItem(title: 'Emergency Contacts', path: 'gridimages/profile3.png'),
  GridItem(title: 'Ambulance', path: 'gridimages/profile4.png'),
  GridItem(title: 'Profile', path: 'gridimaages/profile6.png'),
]);

class GridList {
  late List<GridItem> grid;

  GridList({required this.grid});
}
