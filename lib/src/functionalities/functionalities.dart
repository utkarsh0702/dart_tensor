// private function to find shape of tensor
getDim(List list) {
  List dim = [];
  for (;;) {
    dim.add(list.length);
    if (list[0] is List) {
      list = list[0];
    } else {
      break;
    }
  }
  return dim;
}

// private function to generate list
List generate(List flat, List shape) {
  var temp;
  if (shape.length == 1) {
    temp = flat;
  } else if (shape.length == 2) {
    temp = List.generate(shape[0],
        (i) => List.generate(shape[1], (j) => flat[i * shape[1] + j as int]));
  } else if (shape.length == 3) {
    temp = List.generate(
        shape[0],
        (index) => List.generate(
            shape[1],
            (i) => List.generate(
                shape[2],
                (j) => flat[
                    index * shape[1] * shape[2] + i * shape[2] + j as int])));
  } else if (shape.length == 4) {
    temp = List.generate(
        shape[0],
        (index) => List.generate(
            shape[1],
            (index1) => List.generate(
                shape[2],
                (i) => List.generate(
                    shape[3],
                    (j) => flat[index * shape[1] * shape[2] * shape[3] +
                        index1 * shape[2] * shape[3] +
                        i * shape[3] +
                        j as int]))));
  } else if (shape.length == 5) {
    temp = List.generate(
        shape[0],
        (index) => List.generate(
            shape[1],
            (index1) => List.generate(
                shape[2],
                (index2) => List.generate(
                    shape[3],
                    (i) => List.generate(
                        shape[4],
                        (j) => flat[
                            index * shape[1] * shape[2] * shape[3] * shape[4] +
                                index1 * shape[2] * shape[3] * shape[4] +
                                index2 * shape[3] * shape[4] +
                                i * shape[4] +
                                j as int])))));
  } else if (shape.length == 6) {
    temp = List.generate(
        shape[0],
        (index) => List.generate(
            shape[1],
            (index1) => List.generate(
                shape[2],
                (index2) => List.generate(
                    shape[3],
                    (index3) => List.generate(
                        shape[4],
                        (i) => List.generate(
                            shape[5],
                            (j) => flat[index *
                                    shape[1] *
                                    shape[2] *
                                    shape[3] *
                                    shape[4] *
                                    shape[5] +
                                index1 *
                                    shape[2] *
                                    shape[3] *
                                    shape[4] *
                                    shape[5] +
                                index2 * shape[3] * shape[4] * shape[5] +
                                index3 * shape[4] * shape[5] +
                                i * shape[5] +
                                j as int]))))));
  } else if (shape.length == 7) {
    temp = List.generate(
        shape[0],
        (index) => List.generate(
            shape[1],
            (index1) => List.generate(
                shape[2],
                (index2) => List.generate(
                    shape[3],
                    (index3) => List.generate(
                        shape[4],
                        (index4) => List.generate(
                            shape[5],
                            (i) => List.generate(
                                shape[6],
                                (j) => flat[index *
                                        shape[1] *
                                        shape[2] *
                                        shape[3] *
                                        shape[4] *
                                        shape[5] *
                                        shape[6] +
                                    index1 *
                                        shape[2] *
                                        shape[3] *
                                        shape[4] *
                                        shape[5] *
                                        shape[6] +
                                    index2 *
                                        shape[3] *
                                        shape[4] *
                                        shape[5] *
                                        shape[6] +
                                    index3 * shape[4] * shape[5] * shape[6] +
                                    index4 * shape[5] * shape[6] +
                                    i * shape[6] +
                                    j as int])))))));
  } else {
    throw new Exception(
        "DartTensorException : Only possible till 7 dimensions.");
  }
  return temp;
}
