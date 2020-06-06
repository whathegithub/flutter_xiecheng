import 'package:flutter/material.dart';
import 'package:flutter_xiecheng/common/common.dart';

class Utils {
  static String getImgPath(String name, {String format: 'png'}) {
    return 'images/$name.$format';
  }

  static int getLoadStatus(bool hasError, List data) {
    if (hasError) return LoadStatus.fail;
    if (data == null) {
      return LoadStatus.loading;
    } else if (data.isEmpty) {
      return LoadStatus.empty;
    } else {
      return LoadStatus.success;
    }
  }
}
