import 'package:cookbook/utils/screen/size_fit.dart';

/// int的扩展
///
/// 知识点：
///     1.extension的使用
extension IntFit on int {
  double get px {
    return SizeFit.px2dpr(this.toDouble());
  }

  double get dpr {
    return SizeFit.dpr2px(this.toDouble());
  }
}
