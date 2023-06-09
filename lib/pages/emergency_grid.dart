

class GridItem {
  final String title;
  final String path;

//to initialise them
  GridItem({required this.title, required this.path});
}

GridList Emergencygrid = GridList(grid: [
  GridItem(title: 'Harikrishnan', path: 'gridimages/profile1.png'),
  GridItem(title: 'Vignesh', path: 'gridimages/profile2.png'),
  GridItem(title: 'Subramaniam', path: 'gridimages/profile3.png'),
  GridItem(title: 'Devika', path: 'gridimages/profile4.png'),
  GridItem(title: 'Soja Miss', path: 'gridimaages/profile6.png'),
]);

class GridList {
  late List<GridItem> grid;

  GridList({required this.grid});
}
