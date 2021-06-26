class WindowSizes {
  static List<double> small = [0.0, 640.0];
  static List<double> medium = [641.0, 1007.0];
  static List<double> large = [1008.0, 99999.0];
  static size(double width) {
    if (width >= small[0] && width <= small[1]) {
      return Sizes.Small;
    } else if (width >= medium[0] && width <= medium[1]) {
      return Sizes.Medium;
    } else if (width >= large[0] && width <= large[1]) {
      return Sizes.Large;
    }
  }
}

enum Sizes { Small, Medium, Large }
