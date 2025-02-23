import 'package:flutter/cupertino.dart';

extension SizeBoxDoubleExtension on double {
  Widget get toHeight {
    return SizedBox(
      height: this,
    );
  }

  Widget get toWidth {
    return SizedBox(
      width: this,
    );
  }
}
