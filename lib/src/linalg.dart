import 'functionalities/functionalities.dart';

class LinearAlgebra {
  const LinearAlgebra();

  // flattening of tensor
  List __flatten(List list) {
    for (int j = getDim(list).length; j > 1; j--) {
      list = list.expand((i) => i).toList();
    }
    return list;
  }

  // dot product between two tensors
  List dot(List list, List tensor) {
    List shape = getDim(list);
    List shape1 = getDim(tensor);
    if (shape.length == shape1.length) {
      if (shape.length == 1 && shape[0] == shape1[0]) {
        List flat1 = __flatten(list);
        List flat2 = __flatten(tensor);
        dynamic sum = 0;
        for (int i = 0; i < flat1.length; i++) {
          sum += flat1[i] * flat2[i];
        }
        return sum;
      } else if (shape.length == 2 && shape[1] == shape1[0]) {
        List flat1 = __flatten(list);
        List flat2 = __flatten(tensor);
        List temp = [];
        int num = 0, range = shape[0] * shape1[1];
        dynamic sum;
        int count = 0;
        for (int i = 0; i < range; i++) {
          if (i != 0) {
            if (i % shape1[1] == 0) {
              num += shape[1] as int;
              count += 1;
            }
          }
          sum = 0;
          for (int j = 0; j < shape[1]; j++) {
            sum +=
                flat1[j + num] * flat2[shape1[1] * j + i - count * shape1[1]];
          }
          temp.add(sum);
        }
        temp = generate(temp, [shape[0], shape1[1]]);
        return temp;
      } else {
        throw new Exception(
            'Dot product is not applicable for more than 2 dimmensions and both tensors need to be of same shape. Got shapes: $shape and $shape1.');
      }
    } else {
      throw new Exception(
          'Both tensors need to be of same dimensions. Invalid tensor shapes: $shape and $shape1');
    }
  }

  // convert to 2D array
  List cvt2D(List list, int row, int column) {
    List flat = __flatten(list);
    List temp;
    if (column == -1) {
      column = (flat.length / row).round();
      temp = generate(flat, [row, column]);
      return temp;
    }
    if (flat.length == row * column) {
      temp = generate(flat, [row, column]);
      return temp;
    } else {
      throw new Exception(
          'DartTensorException: Tensor of shape ${getDim(list)} cannot be convered to 2D Tensor with shape [$row,$column]');
    }
  }
}
