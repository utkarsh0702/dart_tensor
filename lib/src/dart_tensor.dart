import 'package:dart_tensor/src/linalg.dart';
import 'package:dart_tensor/src/math.dart';
import 'package:dart_tensor/src/random.dart';
import 'package:dart_tensor/src/utils.dart';

class DartTensor {
  // Default Constructor
  DartTensor() {}

  // Random Tensor Generation
  final random = const Random();
  // Mathematical operations on tensors
  final math = const Math();
  // Linear Algebra operations on 2D tensors
  final linalg = LinearAlgebra();
  // Utils for basic tensor operations
  final utils = Utils();
}
