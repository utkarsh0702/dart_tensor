import 'functionalities/functionalities.dart';
import 'dart:math' as maths;

import 'utils.dart';

class LinearAlgebra {
  LinearAlgebra() {}

  Utils utils = Utils();

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

  // convert to 2D tensor
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

  // calculate determinant of a 2D tensor

  List __cut(List list, int m, int n) {
    List cm = utils.zeros([m, n]);

    int dr = 0;
    for (int r = 0; r < m; r++) {
      int dc = 0;
      if (r == m) {
        continue;
      }
      for (int c = 0; c < n; c++) {
        if (c == n) {
          continue;
        }
        cm[dr][dc] = list[r][c];
        dc++;
      }
      dr++;
    }

    return cm;
  }

  List transpose(List list) {
    List shape = getDim(list);
    if(shape.length != 2){
      throw new Exception("only support 2-D Tensor");
    }
    shape = shape.reversed.toList(growable: true);
    List toReturn = utils.zeros(shape);
    for (int i = 0; i < shape[0]; i++) {
      for (int j = 0; j < shape[1]; j++) {
        toReturn[i][j] = list[j][i];
      }
    }
    return toReturn;
  }
  
  double det(List list) {
    List shape = getDim(list);
    if (shape.length > 2 || shape.length < 2) {
      throw new Exception(
          'DartTensorException: Deteminant only possible for 2D Tensor. Found tensor shape: $shape');
    } else if (shape[0] == 2 && shape[1] == 2) {
      return list[0][0] * list[1][1] - list[1][0] * list[0][1];
    }

    int bestColumnCount = 0;
    int bestColumn = -1;
    for (int c = 0; c < shape[1]; c++) {
      int count = 0;
      for (int r = 0; r < shape[0]; r++) {
        if (list[r][c] == 0.0) {
          count++;
        }
      }
      if (count >= bestColumnCount) {
        bestColumnCount = count;
        bestColumn = c;
      }
    }

    int bestRowCount = 0;
    int bestRow = -1;
    for (int r = 0; r < shape[0]; r++) {
      int count = 0;
      for (int c = 0; c < shape[1]; c++) {
        if (list[r][c] == 0.0) {
          count++;
        }
      }
      if (count >= bestRowCount) {
        bestRowCount = count;
        bestRow = r;
      }
    }

    if (bestColumnCount > bestRowCount) {
      double det = 0.0;
      int c = bestColumn;
      for (int r = 0; r < shape[0]; r++) {
        double v = list[r][c].toDouble();
        if (v != 0.0) {
          List sub = __cut(list, r, c);
          var coFactor = maths.pow(-1, r + c) * this.det(sub);
          det += v * coFactor;
        }
      }
      return det;
    } else {
      double det = 0.0;
      int r = bestRow;
      for (int c = 0; c < shape[1]; c++) {
        double v = list[r][c].toDouble();
        if (v != 0.0) {
          List sub = __cut(list, r, c);
          var coFactor = maths.pow(-1, r + c) * this.det(sub);
          det += v * coFactor;
        }
      }
      return det;
    }
  }

  // Adjoint of a 2D Tensor
  List adjoint(List list) {
    List shape = getDim(list);
    if (shape[0] != shape[1]) {
      throw new Exception(
          'DartTensorException: Adjoint can only be calculated with 2D Tensor with same number of rows and columns.');
    }
    if (shape[0] < 3) {
      throw new Exception(
          'DartTensorException: Adjoint can only be calculated with 2D Tensor with less than 4 rows and columns.');
    }
    List cf = utils.zeros(shape);
    for (int r = 0; r < shape[0]; r++) {
      for (int c = 0; c < shape[1]; c++) {
        List sub = __cut(list, r, c);
        var v = maths.pow(-1, r + c) * det(sub);
        cf[r][c] = v;
      }
    }
    return cf;
  }

  // inverse of a 2D Tensor
  List inverse(List list) {
    List shape = getDim(list);
    double d = det(list);
    if (d == 0.0) {
      throw new Exception(
          'DartTensorException: Inverse cannot be calculates as deternimant is 0.');
    }

    if (shape[0] == 2) {
      List i = utils.zeros(shape);
      i[0][0] = list[1][1];
      i[1][1] = list[0][0];
      i[0][1] = -1.0 * list[0][1];
      i[1][0] = -1.0 * list[1][0];
      return utils.div(list, element: d);
    } else {
      List i = adjoint(list);
      i = transpose(i);
      return utils.div(i, element: d);
    }
  }

  // Trace of a 2D Tensor
  double trace(List list) {
    List shape = getDim(list);
    if (shape[0] != shape[1]) {
      throw new Exception(
          'DartTensorException: Adjoint can only be calculated with 2D Tensor with same number of rows and columns.');
    }
    double tr = 0.0;
    for (int i = 0; i < shape[0]; i++) {
      tr += list[i][i];
    }
    return tr;
  }
}
