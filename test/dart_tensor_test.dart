import 'package:test/test.dart';
import 'package:dart_tensor/dart_tensor.dart';

void main() {
  test("Add a tensor: ", () {
    // final dt = DartTensor();
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
    expect(dataList.ndim, 3);
    expect(dataList.shape, [5, 3, 3]);
    expect(dataList.max, 44);
    expect(dataList.min, 0);
  });
}
