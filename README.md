# **Dart Tensor**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) &nbsp;&nbsp;&nbsp; [![Pub Package](https://img.shields.io/pub/v/dart_tensor.svg)](https://pub.dev/packages/dart_tensor)

![Logo](https://github.com/utkarsh0702/dart_tensor/blob/main/logo/dart_tensor.png?raw=true)

## Description
Dart Tensor is light weight dart plugin to help deal with multi-dimensional lists (or tensors). The project is the dart language edition of the NumPy package in python.

## Operations
**Basic Tensor Operation Functions**

- ```changeDtype(list,dtype)``` returns the tensor with transformed datatype. Available dtypes can be 'int', 'double' and 'string'

- ```changeDim(list,n)``` returns the tensor with `n` dimensions

- ```ndim(list)``` returns dimensions of the tensor.

- ```shape(list)``` returns the shape of the tensor.

- ```flatten(list)``` returns 1-D tensor from any dimension tensor.

- ```reshape(list, shape)``` returns the reshaped tensor of the give shape.

- ```add(listA, element, listB)``` returns the tensor after addition with either the element or the other tensor.

- ```sub(listA, element, listB)``` returns the tensor after subtraction with either the element or the other tensor.

- ```mult(listA, element, listB)``` returns the tensor after multiplication with either the element or the other tensor.

- ```div(listA, element, listB)``` returns the tensor after division with either the element or the other tensor.

- ```modulo(listA, element, listB)``` returns the tensor after getting modulus with either the element or the other tensor.

- ```power(listA, element, listB)``` returns the tensor after powering with either the element or the other tensor.

- ```max(list)``` returns the maximum element from the tensor.

- ```min(list)``` returns the minimum element from the tensor.

- ```zeros(shape,dtype)``` returns a tensor of zeros of given shape of given dtype. Available dtypes can be 'int' and 'double'.

- ```ones(shape,dtype)``` returns a tensor of ones of given shape of given dtype. Available dtypes can be 'int' and 'double'.

- ```sum(list)``` returns the sum of all tensor elements.

- ```prod(list)``` returns the product of all tensor elements.

- ```compareOfVariable(list, operator, element)``` returns the tensor of boolean values after performing condition operation with element on every value of the tensor. Available operators are '<', '>', '<=', '>=', '==', '!='.

- ```compareOfTensor(listA, operator, listB)``` returns the tensor of boolean values after performing condition operation between respective elements of listA and listB. Available operators are '<', '>', '<=', '>=', '==', '!='.

- ```concatenate(listA, listB, axis)``` returns the tensor after performing concatenation between listA and listB based on the provided axis value.

- ```sort(listA, desc)``` returns the tensor after sorting all the elements in the tensor. If desc is true then the tensor is sorted in decreasing order.

**Random Tensor Functions**

- ```random(shape, start, end, dtype)``` returns a tensor of given shape with random values between start and end of given dtype. Available dtypes can be 'int' and 'double'.

- ```rand(shape)``` returns a tensor of given shape with random values of uniform distribution.

- ```choice(shape, choice)``` return random value if the *choice = 1* and return a 1D Tensor if *choice = n*.

- ```shuffle(list)``` return a tensor with same shape with all the suffled values form input tensor.

**Mathematical Tensor Functions**

- ```sqrt(list)``` returns the tensor with square root value of respective tensor elements.

- ```sin(list)``` returns the tensor with sin value of respective tensor elements.

- ```cos(list)``` returns the tensor with cos value of respective tensor elements.

- ```tan(list)``` returns the tensor with tan value of respective tensor elements.

- ```asin(list)``` returns the tensor with arc sin value of respective tensor elements.

- ```acos(list)``` returns the tensor with arc cos value of respective tensor elements.

- ```atan(list)``` returns the tensor with arc tan value of respective tensor elements.

- ```abs(list)``` returns the tensor with absolute value of respective tensor elements.

- ```floor(list)``` returns the tensor with floor value of respective tensor elements.

- ```ceil(list)``` returns the tensor with ceil value of respective tensor elements.

- ```round(list)``` returns the tensor with round value of respective tensor elements.

- ```log(list)``` returns the tensor with natural log value of respective tensor elements.

- ```rad2deg(list)``` returns the tensor with degree converted randian value of respective tensor elements.

- ```deg2rad(list)``` returns the tensor with radian converted degree value of respective tensor elements.

- ```gcd(list)``` return the GCD of all values in a tensor.

- ```lcm(list)``` return the LCM of all values in a tensor.

- ```cumsum(list, dtype)``` return the cumulative sum of the elements in tensor

- ```cumprod(list, dtype)``` return the cumulative product of the elements in tensor

**Linear Algebra Tensor Functions**

- ```cvt2D(list, row, column)``` returns the 2D reshaped tensor of the give row and column.

- ```dot(listA, listB)``` returns the dot product of two tensors.

- ```transpose(list)``` return the transpose of a 2D tensor

- ```det(list)``` return the determinant of a 2D tensor

- ```adjoint(list)``` return the adjoint of a 2D tensor

- ```inverse(list)``` return the inverse of a 2D tensor

- ```trace(list)``` return the trace of a 2D tensor

## Installation

This package requires the latest version of [Dart](https://www.dartlang.org/). You can download the latest and greatest [here](https://www.dartlang.org/tools/sdk#install).

### 1. Depend on it

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
    dart_tensor: '^1.0.4'
```


### 2. Install it

You can install packages from the command line:

```bash
$ pub get
```

Alternatively, your editor might support pub. Check the docs for your editor to learn more.

### 3. Import it

Now in your Dart code, you can use:

```Dart
import 'package:dart_tensor/dart_tensor.dart';
```

## Example

### **Starter Code**

```dart
List dataList = List.generate(5, (j) => List.generate( 3,
    (i) => [ 3 * 3 * j + 3 * i + 0, 3 * 3 * j + 3 * i + 1,
            3 * 3 * j + 3 * i + 2 ],
    growable: false), growable: false);

// declaration of DartTensor class
DartTensor dt = DartTensor();
List data;
```

**Output**

```
[[[0, 1, 2], [3, 4, 5], [6, 7, 8]], [[9, 10, 11], [12, 13, 14], [15, 16, 17]], [[18, 19, 20], [21, 22, 23], [24, 25, 26]], [[27, 28, 29], [30, 31, 32], [33, 34, 35]], [[36, 37, 38], [39, 40, 41], [42, 43, 44]]]
```

### Change Datatype

```dart
data = dt.utils.changeDtype(dataList, 'double');
print(data);
```

**Output**
```
[[[0.0, 1.0, 2.0], [3.0, 4.0, 5.0], [6.0, 7.0, 8.0]], [[9.0, 10.0, 11.0], [12.0, 13.0, 14.0], [15.0, 16.0, 17.0]], [[18.0, 19.0, 20.0], [21.0, 22.0, 23.0], [24.0, 25.0, 26.0]], [[27.0, 28.0, 29.0], [30.0, 31.0, 32.0], [33.0, 34.0, 35.0]], [[36.0, 37.0, 38.0], [39.0, 40.0, 41.0], [42.0, 43.0, 44.0]]]
```

### Change Dimensions

```dart
data = dt.utils.changeDim(dataList, 4);
print(data);
```

**Output**
```
[[[[0, 1, 2], [3, 4, 5], [6, 7, 8]], [[9, 10, 11], [12, 13, 14], [15, 16, 17]], [[18, 19, 20], [21, 22, 23], [24, 25, 26]], [[27, 28, 29], [30, 31, 32], [33, 34, 35]], [[36, 37, 38], [39, 40, 41], [42, 43, 44]]]]
```

### Get number of dimensions

```dart
print(data.ndim);
```

**Output**
```
4
```

### Get shape of the tensor

```dart
print(data.shape);
```

**Output**
```
[1, 5, 3, 3]
```

### Flatten the tensor

```dart
print(data.flatten);
```

**Output**
```
[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44]
```

### Reshaping the tensor

```dart
data = dt.utils.reshape(dataList, [9, 5]);
print("Reshaped tensor: $data");
print("Reshaped shape: ${data.shape}");
```

**Output**
```
Reshaped tensor: [[0, 1, 2, 3, 4], [5, 6, 7, 8, 9], [10, 11, 12, 13, 14], [15, 16, 17, 18, 19], [20, 21, 22, 23, 24], [25, 26, 27, 28, 29], [30, 31, 32, 33, 34], [35, 36, 37, 38, 39], [40, 41, 42, 43, 44]]
Reshaped shape: [9, 5]
```

### Reshaping to 2D tensor

```dart
data = dt.utils.cvt2D(dataList, 9, 5);
print("Reshaped tensor: $data");
print("Reshaped shape: ${data.shape}");
```

**Output**
```
Reshaped tensor: [[0, 1, 2, 3, 4], [5, 6, 7, 8, 9], [10, 11, 12, 13, 14], [15, 16, 17, 18, 19], [20, 21, 22, 23, 24], [25, 26, 27, 28, 29], [30, 31, 32, 33, 34], [35, 36, 37, 38, 39], [40, 41, 42, 43, 44]]
Reshaped shape: [9, 5]
```

### Addition

```dart
data = dt.utils.add(dataList, tensor: dataList);
print("Added tensor data: $data");
```

**Output**
```
Added tensor data: [[[0, 2, 4], [6, 8, 10], [12, 14, 16]], [[18, 20, 22], [24, 26, 28], [30, 32, 34]], [[36, 38, 40], [42, 44, 46], [48, 50, 52]], [[54, 56, 58], [60, 62, 64], [66, 68, 70]], [[72, 74, 76], [78, 80, 82], [84, 86, 88]]]
```

### Subtraction

```dart
data = dt.utils.sub(dataList, element: 20);
print("subtracted tensor data: $data");
```

**Output**
```
subtracted tensor data: [[[-20, -19, -18], [-17, -16, -15], [-14, -13, -12]], [[-11, -10, -9], [-8, -7, -6], [-5, -4, -3]], [[-2, -1, 0], [1, 2, 3], [4, 5, 6]], [[7, 8, 9], [10, 11, 12], [13, 14, 15]], [[16, 17, 18], [19, 20, 21], [22, 23, 24]]]
```

### Multiplication

```dart
data = dt.utils.mult(dataList, tensor: dataList);
print("multiplied tensor data: $data");
```

**Output**
```
multiplied tensor data: [[[0, 1, 4], [9, 16, 25], [36, 49, 64]], [[81, 100, 121], [144, 169, 196], [225, 256, 289]], [[324, 361, 400], [441, 484, 529], [576, 625, 676]], [[729, 784, 841], [900, 961, 1024], [1089, 1156, 1225]], [[1296, 1369, 1444], [1521, 1600, 1681], [1764, 1849, 1936]]]
```

### Division

```dart
data = dt.utils.div(dataList, element: 7);
print("divided tensor data: $data");
```

**Output**
```
divided tensor data: [[[0.0, 0.14285714285714285, 0.2857142857142857], [0.42857142857142855, 0.5714285714285714, 0.7142857142857143], [0.8571428571428571, 1.0, 
1.1428571428571428]], [[1.2857142857142858, 1.4285714285714286, 1.5714285714285714], [1.7142857142857142, 1.8571428571428572, 2.0], [2.142857142857143, 2.2857142857142856, 2.4285714285714284]], [[2.5714285714285716, 2.7142857142857144, 2.857142857142857], [3.0, 3.142857142857143, 3.2857142857142856], [3.4285714285714284, 3.5714285714285716, 3.7142857142857144]], [[3.857142857142857, 4.0, 4.142857142857143], [4.285714285714286, 4.428571428571429, 4.571428571428571], [4.714285714285714, 4.857142857142857, 5.0]], [[5.142857142857143, 5.285714285714286, 5.428571428571429], [5.571428571428571, 5.714285714285714, 5.857142857142857], [6.0, 6.142857142857143, 6.285714285714286]]]
```

### Modulo

```dart
data = dt.utils.modulo(dataList, element: 8);
print("modulated tensor data: $data");
```

**Output**
```
modulated tensor data: [[[0, 1, 2], [3, 4, 5], [6, 7, 0]], [[1, 2, 3], [4, 5, 6], [7, 0, 1]], [[2, 3, 4], [5, 6, 7], [0, 1, 2]], [[3, 4, 5], [6, 7, 0], [1, 2, 3]], [[4, 5, 6], [7, 0, 1], [2, 3, 4]]]
```

### Power

```dart
data = dt.utils.power(dataList, element: 2);
print("powered tensor data: $data");
```

**Output**
```
powered tensor data: [[[0, 1, 4], [9, 16, 25], [36, 49, 64]], [[81, 100, 121], [144, 169, 196], [225, 256, 289]], [[324, 361, 400], [441, 484, 529], [576, 625, 
676]], [[729, 784, 841], [900, 961, 1024], [1089, 1156, 1225]], [[1296, 1369, 1444], [1521, 1600, 1681], [1764, 1849, 1936]]]
```

### Dot Product

```dart
data = dt.utils.dot(dataList,dataList);
print("dot product data: $data");
```

**Output**
```
Exception: Dot product is not applicable for more than 2 dimmensions and both tensors need to be of same shape. Got shapes: (5,3,3),(5,3,3).
```

### Maximum element from all tensor values

```dart
print(dataList.max);
```

**Output**
```
44
```

### Minimum element from all tensor values

```dart
print(dataList.min);
```

**Output**
```
0
```

### Random Value Tensor

```dart
data = dt.random.random([2, 5, 3, 5], start: 10, end: 50, dtype: 'int');
print("Tensor of Random Data: $data");
```

**Output**
```
Tensor of Random Data: [[[[20, 27, 30, 17, 20], [19, 26, 20, 28, 11], [32, 14, 37, 16, 31]], [[11, 31, 28, 38, 14], [11, 22, 32, 27, 18], [20, 33, 27, 26, 23]], [[27, 25, 30, 33, 32], [32, 18, 28, 14, 23], [26, 21, 12, 13, 18]], [[28, 29, 16, 18, 14], [26, 10, 17, 12, 10], [32, 37, 22, 20, 10]], [[18, 12, 11, 24, 20], 
[27, 21, 21, 32, 12], [13, 38, 12, 13, 11]]], [[[16, 18, 15, 16, 17], [19, 18, 34, 18, 20], [26, 25, 12, 14, 29]], [[22, 34, 23, 12, 39], [17, 32, 18, 23, 17], 
[11, 10, 16, 38, 19]], [[18, 30, 16, 20, 21], [22, 22, 13, 11, 24], [28, 18, 10, 24, 22]], [[31, 13, 20, 18, 12], [22, 14, 10, 26, 11], [17, 28, 29, 32, 20]], [[24, 19, 26, 18, 33], [25, 19, 15, 11, 38], [16, 14, 38, 16, 33]]]]
```

### Uniform Distibution Random Value Tensor

```dart
data = dt.random.rand([3,2]);
print("Tensor of Uniform Distibution values: $data");
```

**Output**
```
Tensor of Uniform Distibution values: [[ 0.14022471,  0.96360618], [ 0.37601032,  0.25528411], [ 0.49313049,  0.94909878]]
```

### Zero Tensor

```dart
data = dt.zeros([2, 5, 3], dtype: 'int');
print("Zeros Tensor: $data");
```

**Output**
```
Zeros Tensor: [[[0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0]], [[0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0]]]
```

### Ones Tensor

```dart
data = dt.ones([2, 5, 3], dtype: 'double');
print("Ones Tensor: $data");
```

**Output**
```
Ones Tensor: [[[1.0, 1.0, 1.0], [1.0, 1.0, 1.0], [1.0, 1.0, 1.0], [1.0, 1.0, 1.0], [1.0, 1.0, 1.0]], [[1.0, 1.0, 1.0], [1.0, 1.0, 1.0], [1.0, 1.0, 1.0], [1.0, 1.0, 1.0], [1.0, 1.0, 1.0]]]
```

### Sum of all elements in Tensor

```dart
print(dataList.sum);
```

**Output**
```
990
```

### Product of all elements in Tensor

```dart
print(dataList.prod);
```

**Output**
```
0
```

### Degree to Radian of all elements in Tensor

```dart
print(dataList.deg2rad);
```

**Output**
```
[[[0.         0.01745329 0.03490659]
  [0.05235988 0.06981317 0.08726646]
  [0.10471976 0.12217305 0.13962634]]

 [[0.15707963 0.17453293 0.19198622]
  [0.20943951 0.2268928  0.2443461 ]
  [0.26179939 0.27925268 0.29670597]]

 [[0.31415927 0.33161256 0.34906585]
  [0.36651914 0.38397244 0.40142573]
  [0.41887902 0.43633231 0.45378561]]

 [[0.4712389  0.48869219 0.50614548]
  [0.52359878 0.54105207 0.55850536]
  [0.57595865 0.59341195 0.61086524]]

 [[0.62831853 0.64577182 0.66322512]
  [0.68067841 0.6981317  0.71558499]
  [0.73303829 0.75049158 0.76794487]]]
```

### Radian to Degree of all elements in Tensor

```dart
print(dataList.rad2deg);
```

**Output**
```
[[[   0.           57.29577951  114.59155903]
  [ 171.88733854  229.18311805  286.47889757]
  [ 343.77467708  401.07045659  458.3662361 ]]

 [[ 515.66201562  572.95779513  630.25357464]
  [ 687.54935416  744.84513367  802.14091318]
  [ 859.4366927   916.73247221  974.02825172]]

 [[1031.32403124 1088.61981075 1145.91559026]
  [1203.21136977 1260.50714929 1317.8029288 ]
  [1375.09870831 1432.39448783 1489.69026734]]

 [[1546.98604685 1604.28182637 1661.57760588]
  [1718.87338539 1776.16916491 1833.46494442]
  [1890.76072393 1948.05650344 2005.35228296]]

 [[2062.64806247 2119.94384198 2177.2396215 ]
  [2234.53540101 2291.83118052 2349.12696004]
  [2406.42273955 2463.71851906 2521.01429858]]]
```

### Comparision of tensor with an element

```dart
data = dt.compareOfVariable(dataList, ">=", 12);
print("Compared Data: $data");
```

**Output**
```
Compared Data: [[[false, false, false], [false, false, false], [false, false, false]], [[false, false, false], [true, true, true], [true, true, true]], [[true, true, true], [true, true, true], [true, true, true]], [[true, true, true], [true, true, true], [true, true, true]], [[true, true, true], [true, true, true], [true, true, true]]]
```

### Comparision of tensor with a tensor

```dart
data = dt.compareOfTensor(dataList, "==", dataList);
print("Compared Data: $data");
```

**Output**
```
Compared Data: [[[true, true, true], [true, true, true], [true, true, true]], [[true, true, true], [true, true, true], [true, true, true]], [[true, true, true], [true, true, true], [true, true, true]], [[true, true, true], [true, true, true], [true, true, true]], [[true, true, true], [true, true, true], [true, true, true]]]
```

### Concatenation of tensor with a tensor

```dart
data = dt.concatenate(dataList, dataList, axis: 2);
print("Concatenated Data: $data");
```

**Output**
```
Concatenated Data: [[[0, 1, 2, 0, 1, 2], [3, 4, 5, 3, 4, 5], [6, 7, 8, 6, 7, 8]], [[9, 10, 11, 9, 10, 11], [12, 13, 14, 12, 13, 14], [15, 16, 17, 15, 16, 17]], [[18, 19, 20, 18, 19, 20], [21, 22, 23, 21, 22, 23], [24, 25, 26, 24, 25, 26]], [[27, 28, 29, 27, 28, 29], [30, 31, 32, 30, 31, 32], [33, 34, 35, 33, 34, 35]], [[36, 37, 38, 36, 37, 38], [39, 40, 41, 39, 40, 41], [42, 43, 44, 42, 43, 44]]]
```

### Sorting elements of a tensor

```dart
data = dt.sort(dataList, desc: true);
print("Sorted Data: $data");
```

**Output**
```
Sorted Data: [[[44, 43, 42], [41, 40, 39], [38, 37, 36]], [[35, 34, 33], [32, 31, 30], [29, 28, 27]], [[26, 25, 24], [23, 22, 21], [20, 19, 18]], [[17, 16, 15], [14, 13, 12], [11, 10, 9]], [[8, 7, 6], [5, 4, 3], [2, 1, 0]]]
```

## Author

😀 Utkarsh Mishra &nbsp;&nbsp;&nbsp;&nbsp; [![Linkedin](https://img.shields.io/badge/linkedin-%230077B5.svg?&style=plastic&logo=LinkedIn&logoColor=white&link=https://www.linkedin.com/in/um07/)](https://www.linkedin.com/in/um07/) &nbsp;&nbsp;&nbsp;&nbsp; [![GitHub Utkarsh](https://img.shields.io/github/followers/utkarsh0702?label=follow&style=social)](https://github.com/utkarsh0702) &nbsp;&nbsp;&nbsp;&nbsp; ![Gmail Utkarsh](https://img.shields.io/badge/Email%20Id-utkarsh.um07%40gmail.com-red?style=plastic&logo=gmail&logoColor=red)

## Contribution

Happy 😍 to recieve contributions on this package.

## Issues or Bugs

Please report issue/ bug or request for any feature in the [issue section](https://github.com/utkarsh0702/dart_tensor/issues).
