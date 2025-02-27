enum PngGeneralPath {
  appbarShush,
  footShadow1,
  googleIcon,
  saleShoe,
  saleShush,
  shoe1,
  shoe2,
  starShush,
}

extension PngGeneralPathExtension on PngGeneralPath {
  String _path() {
    switch (this) {
      case PngGeneralPath.appbarShush:
        return "appbar_shush";
      case PngGeneralPath.footShadow1:
        return "foot_shadow1";
      case PngGeneralPath.googleIcon:
        return "googleIcon";
      case PngGeneralPath.saleShoe:
        return "sale_shoe";
      case PngGeneralPath.saleShush:
        return "sale_shush";
      case PngGeneralPath.shoe1:
        return "shoe1";
      case PngGeneralPath.shoe2:
        return "shoe2";
      case PngGeneralPath.starShush:
        return "star_shush";
    }
  }

  String get path => "assets/png/general/${_path()}.png";
}
