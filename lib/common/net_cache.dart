import 'dart:collection';

import 'package:buchang_education/common/cache_object.dart';
import 'package:dio/dio.dart';
class NetCache extends Interceptor{
  // 为确保迭代器顺序和对象插入时间一致顺序一致，我们使用LinkedHashMap
  var cache =LinkedHashMap<String,CacheObject>();
  @override
  Future onRequest(RequestOptions options) {
    return super.onRequest(options);
  }
}