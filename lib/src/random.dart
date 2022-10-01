import 'dart:math' as math;
import 'functionalities/functionalities.dart';

class Random {
  const Random();

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

  // tensor with random values from list n number of times
  dynamic choice(List list, {int times = 1}) {
    for (int j = getDim(list).length; j > 1; j--) {
      list = list.expand((i) => i).toList();
    }

    math.Random random = new math.Random();
    var element;
    List outputList = [];
    for (int i = 0; i < times; i++) {
      element = list[random.nextInt(list.length)];
      if (times > 1) {
        outputList.add(element);
      }
    }
    if (times == 1) {
      return element;
    } else {
      return outputList;
    }
  }

// shuffle elements in a list
  List shuffle(List list) {
    var shape = getDim(list);
    for (int j = getDim(list).length; j > 1; j--) {
      list = list.expand((i) => i).toList();
    }
    list.shuffle();
    list = generate(list, shape);
    return list;
  }
}
