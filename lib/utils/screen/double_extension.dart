import 'package:cookbook/utils/screen/size_fit.dart';

extension DoubleFit on double {
  double get px {
    return SizeFit.px2dpr(this);
  }

  double get dpr {
    return SizeFit.dpr2px(this);
  }
}
