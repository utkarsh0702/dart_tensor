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
}
