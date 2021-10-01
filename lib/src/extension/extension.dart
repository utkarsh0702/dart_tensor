import 'package:dart_tensor/dart_tensor.dart';

extension DartTensorExtension on List {
  // return the tensor with changed datatype
  List changeDtype({String? dtype = 'int'}) =>
      DartTensor().changeDtype(this, dtype);
  // return the tensor with changed dimensions
  List changeDim(int dim) => DartTensor().changeDim(this, dim);
  // return the number of dimension of tensor
  int get ndim => DartTensor().ndim(this);
  // return the shape of tensor
  List get shape => DartTensor().shape(this);
  // return a flattend list
  List get flatten => DartTensor().flatten(this);
  // return a reshaped tensor
  List reshape(List shape) => DartTensor().reshape(this, shape);
  // return a tensor with added values
  List add({int element = 0, var tensor}) =>
      DartTensor().add(this, element: element, tensor: tensor);
  // return a tensor with subtracted values
  List sub({int element = 0, var tensor}) =>
      DartTensor().sub(this, element: element, tensor: tensor);
  // return a tensor with multiplicated values
  List mult({int element = 0, var tensor}) =>
      DartTensor().mult(this, element: element, tensor: tensor);
  // return a tensor with divided values
  List div({int element = 0, var tensor}) =>
      DartTensor().div(this, element: element, tensor: tensor);
  // return a tensor with modulated values
  List modulo({int element = 0, var tensor}) =>
      DartTensor().modulo(this, element: element, tensor: tensor);
  // return a tensor with powered values
  List power({int element = 0, var tensor}) =>
      DartTensor().power(this, element: element, tensor: tensor);
  // return a tensor with the dot product
  List dot(List tensor) => DartTensor().dot(this, tensor);
  // return the maximum value out of tensor
  dynamic get max => DartTensor().max(this);
  // return the minimum value out of tensor
  dynamic get min => DartTensor().min(this);
  // return a tensor of random values
  List random(List shape,
          {int start = 0, int end = 100, String? dtype = 'int'}) =>
      DartTensor().random(shape, start: start, end: end, dtype: dtype);
  // return a tensor of uniform distributed random values
  List rand(List shape) => DartTensor().rand(shape);
  // return a tensor of zeros
  List zeros(List shape, {String? dtype = 'int'}) =>
      DartTensor().zeros(shape, dtype: dtype);
  // return a tensor of ones
  List ones(List shape, {String? dtype = 'int'}) =>
      DartTensor().ones(shape, dtype: dtype);
  // return the sum of all values in tensor
  dynamic get sum => DartTensor().sum(this);
  // return the product of all values in tensor
  dynamic get prod => DartTensor().prod(this);
  // return the sqrt of all values in tensor
  List get sqrt => DartTensor().sqrt(this);
  // return the sin of all values in tensor
  List get sin => DartTensor().sin(this);
  // return the cos of all values in tensor
  List get cos => DartTensor().cos(this);
  // return the tan of all values in tensor
  List get tan => DartTensor().tan(this);
  // return the asin of all values in tensor
  List get asin => DartTensor().asin(this);
  // return the acos of all values in tensor
  List get acos => DartTensor().acos(this);
  // return the atan of all values in tensor
  List get atan => DartTensor().atan(this);
  // return the abs of all values in tensor
  List get abs => DartTensor().abs(this);
  // return the floor of all values in tensor
  List get floor => DartTensor().floor(this);
  // return the ceil of all values in tensor
  List get ceil => DartTensor().ceil(this);
  // return the round of all values in tensor
  List get round => DartTensor().round(this);
  // return the natural log of all values in tensor
  List get log => DartTensor().log(this);
  // return a comparition of a variable with a tensor
  List compareOfVariable(String operator, var element) =>
      DartTensor().compareOfVariable(this, operator, element);
  // return a comparition of a tensor with a tensor
  List compareOfTensor(String operator, List tensor) =>
      DartTensor().compareOfTensor(this, operator, tensor);
  // return concatenate of two tensor
  List concatenate(List tensor, {int axis = 0}) =>
      DartTensor().concatenate(this, tensor, axis: axis);
  // return a completely sorted tensor
  List sort({bool? desc = false}) => DartTensor().sort(this, desc: desc);
}
