// ignore_for_file: avoid_init_to_null

import 'package:dart_tensor/dart_tensor.dart';

extension DartTensorExtension on List {
  // ----------------- Basic Tensor Functions-----------------------//
  // return the tensor with changed datatype
  List changeDtype({String? dtype = 'int'}) =>
      DartTensor().utils.changeDtype(this, dtype);
  // return the tensor with changed dimensions
  List changeDim(int dim) => DartTensor().utils.changeDim(this, dim);
  // return the number of dimension of tensor
  int get ndim => DartTensor().utils.ndim(this);
  // return the shape of tensor
  List get shape => DartTensor().utils.shape(this);
  // return a flattend list
  List get flatten => DartTensor().utils.flatten(this);
  // return a reshaped tensor
  List reshape(List shape) => DartTensor().utils.reshape(this, shape);
  // return a tensor with added values
  List add({int element = 0, var tensor}) =>
      DartTensor().utils.add(this, element: element, tensor: tensor);
  // return a tensor with subtracted values
  List sub({int element = 0, var tensor}) =>
      DartTensor().utils.sub(this, element: element, tensor: tensor);
  // return a tensor with multiplicated values
  List mult({int element = 0, var tensor}) =>
      DartTensor().utils.mult(this, element: element, tensor: tensor);
  // return a tensor with divided values
  List div({int element = 0, var tensor}) =>
      DartTensor().utils.div(this, element: element, tensor: tensor);
  // return a tensor with modulated values
  List modulo({int element = 0, var tensor}) =>
      DartTensor().utils.modulo(this, element: element, tensor: tensor);
  // return a tensor with powered values
  List power({int element = 0, var tensor}) =>
      DartTensor().utils.power(this, element: element, tensor: tensor);
  // return the maximum value out of tensor
  dynamic get max => DartTensor().utils.max(this);
  // return the minimum value out of tensor
  dynamic get min => DartTensor().utils.min(this);
  // return a comparition of a variable with a tensor
  List compareOfVariable(String operator, var element) =>
      DartTensor().utils.compareOfVariable(this, operator, element);
  // return a comparition of a tensor with a tensor
  List compareOfTensor(String operator, List tensor) =>
      DartTensor().utils.compareOfTensor(this, operator, tensor);
  // return concatenate of two tensor
  List concatenate(List tensor, {int axis = 0}) =>
      DartTensor().utils.concatenate(this, tensor, axis: axis);
  // return a completely sorted tensor
  List sort({bool? desc = false}) => DartTensor().utils.sort(this, desc: desc);
  // return a tensor of zeros
  List zeros(List shape, {String? dtype = 'int'}) =>
      DartTensor().utils.zeros(shape, dtype: dtype);
  // return a tensor of ones
  List ones(List shape, {String? dtype = 'int'}) =>
      DartTensor().utils.ones(shape, dtype: dtype);
  // return the sum of all values in tensor
  dynamic get sum => DartTensor().utils.sum(this);
  // return the product of all values in tensor
  dynamic get prod => DartTensor().utils.prod(this);
  // ----------------------------------------------------------------//

  // ----------------- Random Tensor Functions-----------------------//
  // return a tensor of random values
  List random(List shape,
          {int start = 0, int end = 100, String? dtype = 'int'}) =>
      DartTensor().random.random(shape, start: start, end: end, dtype: dtype);
  // return a tensor of uniform distributed random values
  List rand(List shape) => DartTensor().random.rand(shape);
  // tensor with random values from tensor n number of times
  dynamic choice(List list, {int times = 1}) =>
      DartTensor().random.choice(list, times: times);
  // shuffle elements in a tensor
  List shuffle(List list) => DartTensor().random.shuffle(list);
  // ----------------------------------------------------------------//

  // ----------------- Mathematical Tensor Functions-----------------------//
  // return the sqrt of all values in tensor
  List get sqrt => DartTensor().math.sqrt(this);
  // return the sin of all values in tensor
  List get sin => DartTensor().math.sin(this);
  // return the cos of all values in tensor
  List get cos => DartTensor().math.cos(this);
  // return the tan of all values in tensor
  List get tan => DartTensor().math.tan(this);
  // return the asin of all values in tensor
  List get asin => DartTensor().math.asin(this);
  // return the acos of all values in tensor
  List get acos => DartTensor().math.acos(this);
  // return the atan of all values in tensor
  List get atan => DartTensor().math.atan(this);
  // return the abs of all values in tensor
  List get abs => DartTensor().math.abs(this);
  // return the floor of all values in tensor
  List get floor => DartTensor().math.floor(this);
  // return the ceil of all values in tensor
  List get ceil => DartTensor().math.ceil(this);
  // return the round of all values in tensor
  List get round => DartTensor().math.round(this);
  // return the natural log of all values in tensor
  List get log => DartTensor().math.log(this);
  // return the negative values  of all values in tensor
  List get neg => DartTensor().math.neg(this);
  // return the degree of all radian values in tensor
  List get rad2deg => DartTensor().math.rad2deg(this);
  // return the radian of all degree values in tensor
  List get deg2rad => DartTensor().math.deg2rad(this);
  // return the GCD of all values in tensor
  int get gcd => DartTensor().math.gcd(this);
  // return the LCM of all values in tensor
  int get lcm => DartTensor().math.lcm(this);
  // return the cumulative sum of the elements in tensor
  List cumsum(List list, {dtype = null}) =>
      DartTensor().math.cumsum(list, dtype: dtype);
  // return the cumulative product of the elements in tensor
  List cumprod(List list, {dtype = null}) =>
      DartTensor().math.cumprod(list, dtype: dtype);

  // ----------------------------------------------------------------//

  // ----------------- Algebra Tensor Functions-----------------------//
  // return a 2D tensor
  List cvt2D(int row, int column) =>
      DartTensor().linalg.cvt2D(this, row, column);
  // return a tensor with the dot product
  List dot(List tensor) => DartTensor().linalg.dot(this, tensor);
  // return the transpose of a 2D tensor
  List get T => DartTensor().linalg.transpose(this);
  // return the determinant of a 2D tensor
  double get det => DartTensor().linalg.det(this);
  // return the adjoint of a 2D tensor
  List get adjoint => DartTensor().linalg.adjoint(this);
  // return the inverse of a 2D tensor
  List get inverse => DartTensor().linalg.inverse(this);
  // return the trace of a 2D tensor
  double get trace => DartTensor().linalg.trace(this);
}
