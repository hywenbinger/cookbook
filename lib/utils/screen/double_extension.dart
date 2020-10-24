import 'package:cookbook/utils/screen/size_fit.dart';

/// double的扩展
///
/// 知识点：
///     1.extension的使用
extension DoubleFit on double {
  double get px {
    return SizeFit.px2dpr(this);
  }

  double get dpr {
    return SizeFit.dpr2px(this);
  }
}
