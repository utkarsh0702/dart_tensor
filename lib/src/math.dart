// ignore_for_file: avoid_init_to_null

import 'functionalities/functionalities.dart';
import 'dart:math' as math;

class Math {
  const Math();

  List __flatten(List list) {
    for (int j = getDim(list).length; j > 1; j--) {
      list = list.expand((i) => i).toList();
    }
    return list;
  }

  // sqrt of tensor
  List sqrt(List list) {
    List shape = getDim(list);
    List temp = __flatten(list).map((e) => math.sqrt(e)).toList();
    temp = generate(temp, shape);
    return temp;
  }

  // sin of tensor
  List sin(List list) {
    List shape = getDim(list);
    List temp = __flatten(list).map((e) => math.sin(e)).toList();
    temp = generate(temp, shape);
    return temp;
  }

  // cos of tensor
  List cos(List list) {
    List shape = getDim(list);
    List temp = __flatten(list).map((e) => math.cos(e)).toList();
    temp = generate(temp, shape);
    return temp;
  }

  // tan of tensor
  List tan(List list) {
    List shape = getDim(list);
    List temp = __flatten(list).map((e) => math.tan(e)).toList();
    temp = generate(temp, shape);
    return temp;
  }

  // asin of tensor
  List asin(List list) {
    List shape = getDim(list);
    List temp = __flatten(list).map((e) => math.asin(e)).toList();
    temp = generate(temp, shape);
    return temp;
  }

  // acos of tensor
  List acos(List list) {
    List shape = getDim(list);
    List temp = __flatten(list).map((e) => math.acos(e)).toList();
    temp = generate(temp, shape);
    return temp;
  }

  // atan of tensor
  List atan(List list) {
    List shape = getDim(list);
    List temp = __flatten(list).map((e) => math.atan(e)).toList();
    temp = generate(temp, shape);
    return temp;
  }

  // abs of tensor
  List abs(List list) {
    List shape = getDim(list);
    List temp = __flatten(list).map((e) => e > 0 ? e : -e).toList();
    temp = generate(temp, shape);
    return temp;
  }

  // negative of each number of tensor
  List neg(List list) {
    List shape = getDim(list);
    List temp = __flatten(list).map((e) => -e).toList();
    temp = generate(temp, shape);
    return temp;
  }

  // floor of tensor
  List floor(List list) {
    List shape = getDim(list);
    List temp = __flatten(list).map((e) => e.floor()).toList();
    temp = generate(temp, shape);
    return temp;
  }

  // ceil of tensor
  List ceil(List list) {
    List shape = getDim(list);
    List temp = __flatten(list).map((e) => e.ceil()).toList();
    temp = generate(temp, shape);
    return temp;
  }

  // round of tensor
  List round(List list) {
    List shape = getDim(list);
    List temp = __flatten(list).map((e) => e.round()).toList();
    temp = generate(temp, shape);
    return temp;
  }

  // log of tensor
  List log(List list) {
    List shape = getDim(list);
    List temp = __flatten(list).map((e) => math.log(e)).toList();
    temp = generate(temp, shape);
    return temp;
  }

  // rad2deg of tensor
  List rad2deg(List list) {
    List shape = getDim(list);
    List temp = __flatten(list).map((e) => (e * 180.0) / math.pi).toList();
    temp = generate(temp, shape);
    return temp;
  }

  // deg2rad of tensor
  List deg2rad(List list) {
    List shape = getDim(list);
    List temp = __flatten(list).map((e) => (e * math.pi) / 180.0).toList();
    temp = generate(temp, shape);
    return temp;
  }

  // gcd of a tensor
  int gcd(List list) {
    list = __flatten(list);
    bool result = list.every((element) => (element is int));
    if (!result) {
      throw new Exception(
          "DartTensorException : GCD operation can only be performed on Integer Tensor.");
    }
    var minVal = list.reduce((curr, next) => curr < next ? curr : next);
    for (int i = minVal; i >= 1; i--) {
      int j;
      for (j = 0; j < list.length; ++j) {
        if (list[j] % i != 0) {
          break;
        }
      }
      if (j == list.length) {
        return i;
      }
    }
    return 1;
  }

  // lcm of a tensor
  int __gcd(int a, int b) {
    while (b != 0) {
      var t = b;
      b = a % t;
      a = t;
    }
    return a;
  }

  int lcm(List list) {
    list = __flatten(list);
    bool result = list.every((element) => (element is int));
    if (!result) {
      throw new Exception(
          "DartTensorException : LCM operation can only be performed on Integer Tensor.");
    }
    int b = list[0];
    for (int i = 1; i < list.length; i++) {
      b = ((list[i] * b) ~/ __gcd(list[i], b)).toInt();
    }
    return b;
  }

  // cumulative sum of elements in tensor
  List cumsum(List list, {dtype = null}) {
    list = __flatten(list);
    if (dtype != null) {
      if (dtype == 'int') {
        list = list.map((e) => e.toInt()).toList();
      } else if (dtype == 'double') {
        list = list.map((e) => e.toDouble()).toList();
      } else {
        throw new Exception("DartTensorException : Invalid dtype provided.");
      }
    }
    num sum = 0;
    list = list.map((e) {
      sum += e;
      e = sum;
    }).toList();
    return list;
  }

  // cumulative sum of elements in tensor
  List cumprod(List list, {dtype = null}) {
    list = __flatten(list);
    if (dtype != null) {
      if (dtype == 'int') {
        list = list.map((e) => e.toInt()).toList();
      } else if (dtype == 'double') {
        list = list.map((e) => e.toDouble()).toList();
      } else {
        throw new Exception("DartTensorException : Invalid dtype provided.");
      }
    }
    num prod = 1;
    list = list.map((e) {
      prod *= e;
      e = prod;
    }).toList();
    return list;
  }
}
