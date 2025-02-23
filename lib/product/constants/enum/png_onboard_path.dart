enum PngOnboardPath {
  bigLogo,
  footShadow1,
  foot,
  pageShush1,
  pageShush2,
  titleShush1,
  titleShush2,
  smile1,
  shoe1,
  footShadow2,
}

extension PngOnboardPathExtension on PngOnboardPath {
  String _path() {
    switch (this) {
      case PngOnboardPath.bigLogo:
        return "big_logo";

      case PngOnboardPath.footShadow1:
        return "foot_shadow1";

      case PngOnboardPath.foot:
        return "foot";

      case PngOnboardPath.pageShush1:
        return "page_shush1";

      case PngOnboardPath.titleShush1:
        return "title_shush1";

      case PngOnboardPath.titleShush2:
        return "title_shush2";

      case PngOnboardPath.pageShush2:
        return "page_shush2";

      case PngOnboardPath.smile1:
        return "smile1";

      case PngOnboardPath.shoe1:
        return "shoe1";

      case PngOnboardPath.footShadow2:
        return "foot_shadow2";
    }
  }

  String get path => "assets/png/onboardings/${_path()}.png";
}
