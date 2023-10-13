import 'package:dart_tensor/dart_tensor.dart';

void main() {
  List dataList = List.generate(
      5,
      (j) => List.generate(
          3,
          (i) => [
                3 * 3 * j + 3 * i + 0,
                3 * 3 * j + 3 * i + 1,
                3 * 3 * j + 3 * i + 2
              ],
          growable: false),
      growable: false);
  DartTensor dt = DartTensor();
  print("Original List : $dataList");

  // change to new datatype
  List data = dt.utils.changeDtype(
      dataList, 'double'); // available options arte: 'int', 'double', 'string'
  print(data);

  // change number of dimensions
  data = dt.utils.changeDim(dataList, 4);
  print(data);

  // get number of dimensions
  print(data.ndim);

  // get shape of tensor
  print(data.shape);

  // flatten the tensor
  print(data.flatten);

  // reshaping the tensor
  data = dt.utils.reshape(dataList, [9, 5]);
  print("Reshaped tensor: $data");
  print("Reshaped shape: ${data.shape}");

  // reshaping to 2D tensor
  data = dt.linalg.cvt2D(dataList, 9, 5);
  print("Reshaped 2D tensor: $data");

  // adding tensor or element
  data = dt.utils.add(dataList, tensor: dataList);
  print("Added tensor data: $data");

  // subtract tensor or element
  data = dt.utils.sub(dataList, element: 20);
  print("subtracted tensor data: $data");

  // multiply tensor or element
  data = dt.utils.mult(dataList, tensor: dataList);
  print("multiplied tensor data: $data");

  // divide tensor or element
  data = dt.utils.div(dataList, element: 7);
  print("divided tensor data: $data");

  // modulo of tensor or element
  data = dt.utils.modulo(dataList, element: 8);
  print("modulated tensor data: $data");

  // power of tensor or element
  data = dt.utils.power(dataList, element: 2);
  print("powered tensor data: $data");

  // dot product of two tensors
  data = dt.linalg.dot([
    [1, 2, 3, 4, 5],
    [6, 7, 8, 9, 10],
    [11, 12, 13, 14, 15]
  ], [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [10, 11, 12],
    [13, 14, 15]
  ]);

  print("Dot Product of two tensors: $data");

  // max of all elements
  print(dataList.max);

  // min of all elements
  print(dataList.min);

  // create a tensor of random values between start and end
  data = dt.random.random([2, 5, 3, 5], start: 10, end: 50, dtype: 'double');
  print("Tensor of Random Data: $data");

  // create a tensor of random uniform distribution
  data = dt.random.rand([3, 5]);
  print("Tensor of Uniform Distribution Data: $data");

  // tensor of zeros
  data = dt.utils.zeros([2, 5, 3], dtype: 'int');
  print("Zeros Tensor: $data");

  // tensor of ones
  data = dt.utils.ones([2, 5, 3], dtype: 'double');
  print("Ones Tensor: $data");

  // sum of all elements
  print(dataList.sum);

  // product of all elements
  print(dataList.prod);

  // sqrt of all elements
  print(dataList.sqrt);

  // sin of all elements
  print(dataList.sin);

  // cos of all elements
  print(dataList.cos);

  // tan of all elements
  print(dataList.tan);

  // asin of all elements
  print(dataList.asin);

  // acos of all elements
  print(dataList.acos);

  // atan of all elements
  print(dataList.atan);

  // abs of all elements
  print(dataList.abs);

  // floor of all elements
  print(dataList.floor);

  // ceil of all elements
  print(dataList.ceil);

  // round of all elements
  print(dataList.round);

  // log of all elements
  print(dataList.log);

  // radian to degree of all elements
  print(dataList.rad2deg);

  // degree to radian of all elements
  print(dataList.deg2rad);

  // comparison from a variable
  data = dt.utils.compareOfVariable(dataList, ">=", 12);
  print("Compared Data: $data");

  // comparison from a tensor
  data = dt.utils.compareOfTensor(dataList, "==", dataList);
  print("Compared Data: $data");

  // concatenation of 2 tensors
  data = dt.utils.concatenate(dataList, dataList, axis: 2);
  print("Concatenated Data: $data");

  // Completely sorted data
  data = dt.utils.sort(dataList, desc: true);
  print("Sorted Data: $data");

  // randomly genrating 2D tensor
  List matrix = dt.random.random([3, 3]);
  print("2D Tensor: $matrix");
  print("Matrix Trace: ${matrix.trace}");
}
