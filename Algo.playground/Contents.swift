//: Playground - noun: a place where people can play

import UIKit

func swap<T>( array: inout [T], index1: Int, index2: Int){
  let temp = array[index1]
  array[index1] = array[index2]
  array[index2] = temp
}

// MARK: 二分查找法
func binarySearch(array:[Int],target:Int, start: Int, end:Int) ->Int {
  guard end >= start else {
    return -1
  }
  let middleIndex = start + (end - start) / 2
  if target > array[middleIndex] {
    return binarySearch(array: array, target: target, start: middleIndex + 1, end: end)
  }
  else if target < array[middleIndex] {
    return binarySearch(array: array, target: target, start: start, end: middleIndex - 1)
  }
  else { // target == array[middleIndex]
    return array[middleIndex]
  }
}

let binaryArray = [1,2,3,4,5,6,7,8,11,13,15,17,18]
let binaryValue = binarySearch(array: binaryArray, target: 13, start: 0, end: binaryArray.count - 1)
print(binaryValue)


// MARK: 快速排序
extension Array {
  var decompose : (head: Element, tail: [Element])? {
    return (count > 0) ? (self[0], Array(self[1..<count])) : nil
  }
}

func qsortDemo(_ input: [Int]) -> [Int] {
  if let (pivot, rest) = input.decompose {
    let lesser = rest.filter { $0 < pivot }//这里是小于于pivot基数的分成一个数组
    let greater = rest.filter { $0 >= pivot }//这里是大于等于pivot基数的分成一个数组
    return qsortDemo(lesser) + Array([pivot]) + qsortDemo(greater)//递归 拼接数组
  } else {
    return []
  }
}

var qsortArray = [1,2,4,6,2,4,3,7,8]
let sortArray = qsortDemo(qsortArray)
print(sortArray)

// MARK: 冒泡排序
func bubbleSort(array: [Int]) -> [Int]{
  var mutableArray = array
  if mutableArray.count > 1 {
    for i in 0...(mutableArray.count - 2) { //n个数进行排序，只要进行（n - 1）轮操作
      for j in 0...(mutableArray.count - i - 2){ //开始一轮操作
        if mutableArray[j] < mutableArray[j + 1] {
          swap(array: &mutableArray, index1: j, index2: j + 1)
        }
      }
    }
  }
  return mutableArray
}

var bubbleArray = [1,20,100,10,2,4,6,2,4,3,7,8]
let bubbleSortArray = bubbleSort(array: bubbleArray)
print(bubbleSortArray)

// MARK: 经典排序
func classicSort(array: [Int]) -> [Int]{
  var mutableArray = array
  if mutableArray.count > 1 {
    for i in 0...(mutableArray.count - 2) { //n个数进行排序，只要进行（n - 1）轮操作
      for j in (i + 1)...(mutableArray.count - 1){ //开始一轮操作
        if mutableArray[i] < mutableArray[j] {
          swap(array: &mutableArray, index1: i, index2: j)
        }
      }
    }
  }
  return mutableArray
}
var classicArray = [1,200,1000,10,2,4,6,2,4,3,7,8]
let classicSortArray = classicSort(array: classicArray)
print(classicSortArray)
