import 'functionalities/functionalities.dart';
import 'dart:math' as math;

class DartTensor {
  // Default Constructor
  const DartTensor();

  // change dtype
  List changeDtype(List list, String? dtype) {
    List shape = getDim(list);
    var flat;
    if (shape.length > 7) {
      throw new Exception(
          "DartTensorException : Only possible till 7 dimensions.");
    } else {
      flat = flatten(list);
      if (dtype == 'int') {
        flat = flat.map((e) => e.toInt()).toList();
      } else if (dtype == 'double') {
        flat = flat.map((e) => e.toDouble()).toList();
      } else if (dtype == 'string') {
        flat = flat.map((e) => e.toString()).toList();
      } else {
        throw new Exception(
            "DartTensorException : Wrong parameter input provided.");
      }
    }
    var temp = generate(flat, shape);
    return temp;
  }

  // change number of dimension
  List changeDim(List list, int dim) {
    if (dim == 0) {
      throw new Exception("DartTensorException : dimension cannot be 0.");
    } else {
      int getdim = getDim(list).length;
      if (getdim == dim) {
      } else if (getdim < dim) {
        int remain = dim - getdim;
        for (int i = 0; i < remain; i++) {
          list = List.generate(1, (i) => list, growable: true);
        }
      } else {
        throw new Exception(
            "DartTensorException : ndim cannot be lower than dimmension of DartTensor.");
      }
    }
    return list;
  }

  // get number of dimmensions
  int ndim(List list) {
    return getDim(list).length;
  }

  // shape of tensor
  List shape(List list) {
    return getDim(list);
  }

  // flattening of tensor
  List flatten(List list) {
    for (int j = getDim(list).length; j > 1; j--) {
      list = list.expand((i) => i).toList();
    }
    return list;
  }

  // reshaping of tensor
  List reshape(List list, List shape) {
    List flat = flatten(list);
    int mult = 1;
    for (int i = 0; i < shape.length; i++) {
      mult = mult * shape[i] as int;
    }
    var temp;
    if (mult == flat.length) {
      temp = generate(flat, shape);
    } else {
      throw new Exception(
          "DartTensorException : Dart Tensor and shape are different.");
    }
    return temp;
  }

  // add variable or tensor
  List add(List list, {dynamic element = 0, var tensor}) {
    if (tensor == null && element == 0) {
      throw new Exception(
          "DartTensorException : Enter either an element or a tensor to add.");
    } else {
      if (tensor != null && element != 0) {
        throw new Exception(
            "DartTensorException : Provide one either an element or a tensor to add, not both");
      } else {
        List shape = getDim(list);
        List flat = flatten(list);
        List temp = [];
        if (element != 0) {
          flat = flat.map((e) => e + element).toList();
          temp = generate(flat, shape);
          return temp;
        } else {
          bool flag = true;
          List shape1 = getDim(tensor);
          List flat1 = flatten(tensor);
          if (shape.length == shape1.length) {
            for (int i = 0; i < shape.length; i++) {
              if (shape[i] != shape1[i]) {
                flag = false;
                break;
              }
            }
            if (flag) {
              for (int i = 0; i < flat.length; i++) {
                temp.add(flat[i] + flat1[i]);
              }
            } else {
              throw new Exception(
                  "DartTensorException : Both Tensors should be of equal shape. Got tensor of shape $shape and $shape1.");
            }
          } else {
            throw new Exception(
                "DartTensorException : Both Tensors should be of equal shape. Got tensor of shape $shape and $shape1.");
          }
          temp = generate(temp, shape);
          return temp;
        }
      }
    }
  }

  // subtract variable or tensor
  List sub(List list, {dynamic element = 0, var tensor}) {
    if (tensor == null && element == 0) {
      throw new Exception(
          "DartTensorException : Enter either an element or a tensor to subtract.");
    } else {
      if (tensor != null && element != 0) {
        throw new Exception(
            "DartTensorException : Provide one either an element or a tensor to subtract, not both");
      } else {
        List shape = getDim(list);
        List flat = flatten(list);
        List temp = [];
        if (element != 0) {
          flat = flat.map((e) => e - element).toList();
          temp = generate(flat, shape);
          return temp;
        } else {
          bool flag = true;
          List shape1 = getDim(tensor);
          List flat1 = flatten(tensor);
          if (shape.length == shape1.length) {
            for (int i = 0; i < shape.length; i++) {
              if (shape[i] != shape1[i]) {
                flag = false;
                break;
              }
            }
            if (flag) {
              for (int i = 0; i < flat.length; i++) {
                temp.add(flat[i] - flat1[i]);
              }
            } else {
              throw new Exception(
                  "DartTensorException : Both Tensors should be of equal shape. Got tensor of shape $shape and $shape1.");
            }
          } else {
            throw new Exception(
                "DartTensorException : Both Tensors should be of equal shape. Got tensor of shape $shape and $shape1.");
          }
          temp = generate(temp, shape);
          return temp;
        }
      }
    }
  }

  // multiply variable or tensor
  List mult(List list, {dynamic element = 0, var tensor}) {
    if (tensor == null && element == 0) {
      throw new Exception(
          "DartTensorException : Enter either an element or a tensor to multiply.");
    } else {
      if (tensor != null && element != 0) {
        throw new Exception(
            "DartTensorException : Provide one either an element or a tensor to multiply, not both");
      } else {
        List shape = getDim(list);
        List flat = flatten(list);
        List temp = [];
        if (element != 0) {
          flat = flat.map((e) => e * element).toList();
          temp = generate(flat, shape);
          return temp;
        } else {
          bool flag = true;
          List shape1 = getDim(tensor);
          List flat1 = flatten(tensor);
          if (shape.length == shape1.length) {
            for (int i = 0; i < shape.length; i++) {
              if (shape[i] != shape1[i]) {
                flag = false;
                break;
              }
            }
            if (flag) {
              for (int i = 0; i < flat.length; i++) {
                temp.add(flat[i] * flat1[i]);
              }
            } else {
              throw new Exception(
                  "DartTensorException : Both Tensors should be of equal shape. Got tensor of shape $shape and $shape1.");
            }
          } else {
            throw new Exception(
                "DartTensorException : Both Tensors should be of equal shape. Got tensor of shape $shape and $shape1.");
          }
          temp = generate(temp, shape);
          return temp;
        }
      }
    }
  }

  // divide variable or tensor
  List div(List list, {dynamic element = 0, var tensor}) {
    if (tensor == null && element == 0) {
      throw new Exception(
          "DartTensorException : Enter either an element or a tensor to divide.");
    } else {
      if (tensor != null && element != 0) {
        throw new Exception(
            "DartTensorException : Provide one either an element or a tensor to divide, not both");
      } else {
        List shape = getDim(list);
        List flat = flatten(list);
        List temp = [];
        if (element != 0) {
          flat = flat.map((e) => e / element).toList();
          temp = generate(flat, shape);
          return temp;
        } else {
          bool flag = true;
          List shape1 = getDim(tensor);
          List flat1 = flatten(tensor);
          if (shape.length == shape1.length) {
            for (int i = 0; i < shape.length; i++) {
              if (shape[i] != shape1[i]) {
                flag = false;
                break;
              }
            }
            if (flag) {
              for (int i = 0; i < flat.length; i++) {
                temp.add(flat[i] / flat1[i]);
              }
            } else {
              throw new Exception(
                  "DartTensorException : Both Tensors should be of equal shape. Got tensor of shape $shape and $shape1.");
            }
          } else {
            throw new Exception(
                "DartTensorException : Both Tensors should be of equal shape. Got tensor of shape $shape and $shape1.");
          }
          temp = generate(temp, shape);
          return temp;
        }
      }
    }
  }

  // modulo variable or tensor
  List modulo(List list, {dynamic element = 0, var tensor}) {
    if (tensor == null && element == 0) {
      throw new Exception(
          "DartTensorException : Enter either an element or a tensor to modulo.");
    } else {
      if (tensor != null && element != 0) {
        throw new Exception(
            "DartTensorException : Provide one either an element or a tensor to modulo, not both");
      } else {
        List shape = getDim(list);
        List flat = flatten(list);
        List temp = [];
        if (element != 0) {
          flat = flat.map((e) => e % element).toList();
          temp = generate(flat, shape);
          return temp;
        } else {
          bool flag = true;
          List shape1 = getDim(tensor);
          List flat1 = flatten(tensor);
          if (shape.length == shape1.length) {
            for (int i = 0; i < shape.length; i++) {
              if (shape[i] != shape1[i]) {
                flag = false;
                break;
              }
            }
            if (flag) {
              for (int i = 0; i < flat.length; i++) {
                temp.add(flat[i] % flat1[i]);
              }
            } else {
              throw new Exception(
                  "DartTensorException : Both Tensors should be of equal shape. Got tensor of shape $shape and $shape1.");
            }
          } else {
            throw new Exception(
                "DartTensorException : Both Tensors should be of equal shape. Got tensor of shape $shape and $shape1.");
          }
          temp = generate(temp, shape);
          return temp;
        }
      }
    }
  }

  // power of variable or tensor
  List power(List list, {dynamic element = 0, var tensor}) {
    if (tensor == null && element == 0) {
      throw new Exception(
          "DartTensorException : Enter either an element or a tensor for power.");
    } else {
      if (tensor != null && element != 0) {
        throw new Exception(
            "DartTensorException : Provide one either an element or a tensor for power, not both");
      } else {
        List shape = getDim(list);
        List flat = flatten(list);
        List temp = [];
        if (element != 0) {
          flat = flat.map((e) => math.pow(e, element)).toList();
          temp = generate(flat, shape);
          return temp;
        } else {
          bool flag = true;
          List shape1 = getDim(tensor);
          List flat1 = flatten(tensor);
          if (shape.length == shape1.length) {
            for (int i = 0; i < shape.length; i++) {
              if (shape[i] != shape1[i]) {
                flag = false;
                break;
              }
            }
            if (flag) {
              for (int i = 0; i < flat.length; i++) {
                temp.add(math.pow(flat[i], flat1[i]));
              }
            } else {
              throw new Exception(
                  "DartTensorException : Both Tensors should be of equal shape. Got tensor of shape $shape and $shape1.");
            }
          } else {
            throw new Exception(
                "DartTensorException : Both Tensors should be of equal shape. Got tensor of shape $shape and $shape1.");
          }
          temp = generate(temp, shape);
          return temp;
        }
      }
    }
  }

  // dot product between two tensors
  dot(List list, List tensor) {
    List shape = getDim(list);
    List shape1 = getDim(tensor);
    if (shape.length == shape1.length) {
      if (shape.length == 1 && shape[0] == shape1[0]) {
        List flat1 = flatten(list);
        List flat2 = flatten(tensor);
        dynamic sum = 0;
        for (int i = 0; i < flat1.length; i++) {
          sum += flat1[i] * flat2[i];
        }
        return sum;
      } else if (shape.length == 2 && shape[1] == shape1[0]) {
        List flat1 = flatten(list);
        List flat2 = flatten(tensor);
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

  // max of all elements
  max(List list) {
    var maxVal =
        flatten(list).reduce((curr, next) => curr > next ? curr : next);
    return maxVal;
  }

  // min of all elements
  min(List list) {
    var minVal =
        flatten(list).reduce((curr, next) => curr < next ? curr : next);
    return minVal;
  }

  // tensor with random values
  List random(List shape,
      {int start = 0, int end = 100, String? dtype = 'int'}) {
    math.Random random = new math.Random();
    int mult = 1;
    for (int i = 0; i < shape.length; i++) {
      mult = mult * shape[i] as int;
    }
    List temp = [];
    var val;
    for (int i = 0; i < mult; i++) {
      if (dtype == 'int') {
        val = random.nextInt(end - start);
        temp.add(val > start ? val : val + start);
      } else if (dtype == 'double') {
        val = random.nextDouble() * (end - start) + start;
        temp.add(val);
      } else {
        throw new Exception(
            "DartTensorException : Undefined dtype. Choose 'int' or 'double'.");
      }
    }
    temp = generate(temp, shape);
    return temp;
  }

  // random sample tensor of uniform distribution
  List rand(List shape) {
    math.Random random = new math.Random();
    int mult = 1;
    for (int i = 0; i < shape.length; i++) {
      mult = mult * shape[i] as int;
    }
    List temp = [];
    var val;
    for (int i = 0; i < mult; i++) {
      val = random.nextDouble();
      temp.add(val);
    }
    temp = generate(temp, shape);
    return temp;
  }

  // zero tensor
  List zeros(List shape, {String? dtype = 'int'}) {
    int mult = 1;
    for (int i = 0; i < shape.length; i++) {
      mult = mult * shape[i] as int;
    }
    List temp;
    if (dtype == 'int') {
      temp = List.generate(mult, (_) => 0);
    } else if (dtype == 'double') {
      temp = List.generate(mult, (_) => 0.0);
    } else {
      throw new Exception(
          "DartTensorException : Undefined dtype. Choose 'int' or 'double'.");
    }
    temp = generate(temp, shape);
    return temp;
  }

  // one tensor
  List ones(List shape, {String? dtype = 'int'}) {
    int mult = 1;
    for (int i = 0; i < shape.length; i++) {
      mult = mult * shape[i] as int;
    }
    List temp;
    if (dtype == 'int') {
      temp = List.generate(mult, (_) => 1);
    } else if (dtype == 'double') {
      temp = List.generate(mult, (_) => 1.0);
    } else {
      throw new Exception(
          "DartTensorException : Undefined dtype. Choose 'int' or 'double'.");
    }
    temp = generate(temp, shape);
    return temp;
  }

  // sum of tensor
  sum(List list) {
    var sums = flatten(list).reduce((a, b) => a + b);
    return sums;
  }

  // product of tensor
  prod(List list) {
    var product = flatten(list).reduce((a, b) => a * b);
    return product;
  }

  // sqrt of tensor
  List sqrt(List list) {
    List shape = getDim(list);
    List temp = flatten(list).map((e) => math.sqrt(e)).toList();
    temp = generate(temp, shape);
    return temp;
  }

  // sin of tensor
  List sin(List list) {
    List shape = getDim(list);
    List temp = flatten(list).map((e) => math.sin(e)).toList();
    temp = generate(temp, shape);
    return temp;
  }

  // cos of tensor
  List cos(List list) {
    List shape = getDim(list);
    List temp = flatten(list).map((e) => math.cos(e)).toList();
    temp = generate(temp, shape);
    return temp;
  }

  // tan of tensor
  List tan(List list) {
    List shape = getDim(list);
    List temp = flatten(list).map((e) => math.tan(e)).toList();
    temp = generate(temp, shape);
    return temp;
  }

  // asin of tensor
  List asin(List list) {
    List shape = getDim(list);
    List temp = flatten(list).map((e) => math.asin(e)).toList();
    temp = generate(temp, shape);
    return temp;
  }

  // acos of tensor
  List acos(List list) {
    List shape = getDim(list);
    List temp = flatten(list).map((e) => math.acos(e)).toList();
    temp = generate(temp, shape);
    return temp;
  }

  // atan of tensor
  List atan(List list) {
    List shape = getDim(list);
    List temp = flatten(list).map((e) => math.atan(e)).toList();
    temp = generate(temp, shape);
    return temp;
  }

  // abs of tensor
  List abs(List list) {
    List shape = getDim(list);
    List temp = flatten(list).map((e) => e > 0 ? e : -e).toList();
    temp = generate(temp, shape);
    return temp;
  }

  // floor of tensor
  List floor(List list) {
    List shape = getDim(list);
    List temp = flatten(list).map((e) => e.floor()).toList();
    temp = generate(temp, shape);
    return temp;
  }

  // ceil of tensor
  List ceil(List list) {
    List shape = getDim(list);
    List temp = flatten(list).map((e) => e.ceil()).toList();
    temp = generate(temp, shape);
    return temp;
  }

  // round of tensor
  List round(List list) {
    List shape = getDim(list);
    List temp = flatten(list).map((e) => e.round()).toList();
    temp = generate(temp, shape);
    return temp;
  }

  // log of tensor
  List log(List list) {
    List shape = getDim(list);
    List temp = flatten(list).map((e) => math.log(e)).toList();
    temp = generate(temp, shape);
    return temp;
  }

  // comparision from a variable
  List compareOfVariable(List list, String operator, var element) {
    if (element == null) {
      throw new Exception(
          "DartTensorException : element not found for comparision.");
    } else if (element is List) {
      throw new Exception("DartTensorException : List is not allowed.");
    } else {
      List opratorList = ['<', '>', '>=', '<=', '==', '!='];
      List shape = getDim(list);
      List temp = [];
      if (!opratorList.contains(operator)) {
        throw new Exception(
            "DartTensorException : Unrecognised comparision operator.");
      } else {
        if (operator == '<') {
          temp = flatten(list).map((e) => e < element ? true : false).toList();
        } else if (operator == '>') {
          temp = flatten(list).map((e) => e > element ? true : false).toList();
        } else if (operator == '>=') {
          temp = flatten(list).map((e) => e >= element ? true : false).toList();
        } else if (operator == '<=') {
          temp = flatten(list).map((e) => e <= element ? true : false).toList();
        } else if (operator == '==') {
          temp = flatten(list).map((e) => e == element ? true : false).toList();
        } else if (operator == '!=') {
          temp = flatten(list).map((e) => e != element ? true : false).toList();
        }
      }
      temp = generate(temp, shape);
      return temp;
    }
  }

  // comparision from a tensor
  List compareOfTensor(List list, String operator, List tensor) {
    // ignore: unnecessary_null_comparison
    if (tensor == null) {
      throw new Exception(
          "DartTensorException : tensor not found for comparision.");
    } else {
      List opratorList = ['<', '>', '>=', '<=', '==', '!='];
      List shape = getDim(list);
      List temp = [];
      if (!opratorList.contains(operator)) {
        throw new Exception(
            "DartTensorException : Unrecognised comparision operator.");
      } else {
        List flat = flatten(list);
        bool flag = true;
        List shape1 = getDim(tensor);
        List flat1 = flatten(tensor);
        if (shape.length == shape1.length) {
          for (int i = 0; i < shape.length; i++) {
            if (shape[i] != shape1[i]) {
              flag = false;
              break;
            }
          }
          if (flag) {
            if (operator == '<') {
              for (int i = 0; i < flat.length; i++) {
                temp.add(flat[i] < flat1[i] ? true : false);
              }
            } else if (operator == '>') {
              for (int i = 0; i < flat.length; i++) {
                temp.add(flat[i] > flat1[i] ? true : false);
              }
            } else if (operator == '>=') {
              for (int i = 0; i < flat.length; i++) {
                temp.add(flat[i] >= flat1[i] ? true : false);
              }
            } else if (operator == '<=') {
              for (int i = 0; i < flat.length; i++) {
                temp.add(flat[i] <= flat1[i] ? true : false);
              }
            } else if (operator == '==') {
              for (int i = 0; i < flat.length; i++) {
                temp.add(flat[i] == flat1[i] ? true : false);
              }
            } else if (operator == '!=') {
              for (int i = 0; i < flat.length; i++) {
                temp.add(flat[i] != flat1[i] ? true : false);
              }
            }
          } else {
            throw new Exception(
                "DartTensorException : Both Tensors should be of equal shape. Got tensor of shape $shape and $shape1.");
          }
        } else {
          throw new Exception(
              "DartTensorException : Both Tensors should be of equal shape. Got tensor of shape $shape and $shape1.");
        }
        temp = generate(temp, shape);
        return temp;
      }
    }
  }

  // concatenation of two tensors
  List concatenate(List list, List tensor, {int axis = 0}) {
    List shape = getDim(list);
    List shape1 = getDim(tensor);
    bool flag = true;
    List temp = [];
    if (axis >= shape.length || axis >= shape1.length) {
      throw new Exception(
          "DartTensorException : Axis $axis is not allowed with provided tensors.");
    }
    if (shape.length == shape1.length) {
      for (int i = 0; i < shape.length; i++) {
        if (shape[i] != shape1[i]) {
          flag = false;
          break;
        }
      }
      List flat = flatten(list);
      List flat1 = flatten(tensor);
      if (flag) {
        if (axis == 0) {
          temp = list + tensor;
          return temp;
        } else if (axis > 0) {
          int mult = 1;
          for (int i = axis; i < shape.length; i++) {
            mult = mult * shape[i] as int;
          }
          int remain = 1;
          for (int i = axis - 1; i >= 0; i--) {
            remain = remain * shape[i] as int;
          }
          for (int i = 0; i < remain; i++) {
            for (int j = 0; j < mult; j++) {
              temp.add(flat[i * mult + j]);
            }
            for (int j = 0; j < mult; j++) {
              temp.add(flat1[i * mult + j]);
            }
          }
          shape[axis] = shape[axis] * 2;
        }
        temp = generate(temp, shape);
        return temp;
      } else {
        throw new Exception(
            "DartTensorException : Both Tensors should be of equal shape. Got tensor of shape $shape and $shape1.");
      }
    }
    return temp;
  }

  // sort a tensor
  List sort(List list, {bool? desc = false}) {
    List shape = getDim(list);
    List flat = flatten(list);
    if (flat.contains(true) || flat.contains(false)) {
      throw new Exception(
          "DartTensorException : Cannot sort boolean elements.");
    }
    if (desc == false) {
      flat.sort((a, b) => a.compareTo(b));
    } else {
      flat.sort((b, a) => a.compareTo(b));
    }
    List temp = generate(flat, shape);
    return temp;
  }
}
