# Dart Tensor
<!--Image here-->

## Description
Dart Tensor is light weight dart plugin to help deal with multi-dimensional lists (or tensors). The project is the dart language edition of the NumPy package in python.

## Operations
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

- ```random(shape,start, end,dtype)``` returns a tensor of given shape with random values between start and end of given dtype. Available dtypes can be 'int' and 'double'.

- ```zeros(shape,dtype)``` returns a tensor of zeros of given shape of given dtype. Available dtypes can be 'int' and 'double'.

- ```ones(shape,dtype)``` returns a tensor of ones of given shape of given dtype. Available dtypes can be 'int' and 'double'.

- ```sum(list)``` returns the sum of all tensor elements.

- ```prod(list)``` returns the product of all tensor elements.

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

- ```compareOfVariable(list, operator, element)``` returns the tensor of boolean values after performing condition operation with element on every value of the tensor. Available operators are '<', '>', '<=', '>=', '==', '!='.

- ```compareOfTensor(listA, operator, listB)``` returns the tensor of boolean values after performing condition operation between respective elements of listA and listB. Available operators are '<', '>', '<=', '>=', '==', '!='.

- ```concatenate(listA, listB, axis)``` returns the tensor after performing concatenation between listA and listB based on the provided axis value.

- ```sort(listA, desc)``` returns the tensor after sorting all the elements in the tensor. If desc is true then the tensor is sorted in decreasing order.

## Example

**Starter Code**

```dart
List dataList = List.generate(5, (j) => List.generate( 3,
    (i) => [ 3 * 3 * j + 3 * i + 0, 3 * 3 * j + 3 * i + 1,
            3 * 3 * j + 3 * i + 2 ],
    growable: false), growable: false);
DartTensor dt = DartTensor();
List data;
```

### Change Datatype

```dart
data = dt.changeDtype(dataList, 'double');
print(data);
```

**Output**
```
[[[0.0, 1.0, 2.0], [3.0, 4.0, 5.0], [6.0, 7.0, 8.0]], [[9.0, 10.0, 11.0], [12.0, 13.0, 14.0], [15.0, 16.0, 17.0]], [[18.0, 19.0, 20.0], [21.0, 22.0, 23.0], [24.0, 25.0, 26.0]], [[27.0, 28.0, 29.0], [30.0, 31.0, 32.0], [33.0, 34.0, 35.0]], [[36.0, 37.0, 38.0], [39.0, 40.0, 41.0], [42.0, 43.0, 44.0]]]
```
