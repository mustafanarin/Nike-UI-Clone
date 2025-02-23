enum PngOnboardPath {
  bigLogo,
  footShadow,
  foot,
  pageShush1,
  titleShush1,
  titleShush2,
}

extension PngOnboardPathExtension on PngOnboardPath {
  String _path() {
    switch (this) {
      case PngOnboardPath.bigLogo:
        return "big_logo";

      case PngOnboardPath.footShadow:
        return "foot_shadow";

      case PngOnboardPath.foot:
        return "foot";

      case PngOnboardPath.pageShush1:
        return "page_shush1";

      case PngOnboardPath.titleShush1:
        return "title_shush1";

      case PngOnboardPath.titleShush2:
        return "title_shush2";
    }
  }

  String get path => "assets/png/onboardings/${_path()}.png";
}
