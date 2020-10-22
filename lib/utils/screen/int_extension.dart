import 'package:cookbook/utils/screen/size_fit.dart';

extension IntFit on int {
  double get px {
    return SizeFit.px2dpr(this.toDouble());
  }

  double get dpr {
    return SizeFit.dpr2px(this.toDouble());
  }
}
