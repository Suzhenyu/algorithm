//
//  main.swift
//  Sort
//
//  Created by yu on 2021/1/18.
//

import Foundation

let userExtension = true

let count = 1000
var array = [Int]()
for _ in 0..<count {
    let random = Int(arc4random()) % (count * 10)
    array.append(random)
}
print("当测试数组的数据量为 \(count) 时：")

var currentTime: CFAbsoluteTime

var array0 = array
currentTime = CFAbsoluteTimeGetCurrent()
if userExtension {
  array0.bubbleSort(by: <)
} else {
  bubbleSort(nums: &array0)
}
print("  * 冒泡排序所花的毫秒数为：", (CFAbsoluteTimeGetCurrent() - currentTime) * 1000)

var array1 = array
currentTime = CFAbsoluteTimeGetCurrent()
array1.selectionSort()
print("  * 选择排序所花的毫秒数为：", (CFAbsoluteTimeGetCurrent() - currentTime) * 1000)

var array2 = array
currentTime = CFAbsoluteTimeGetCurrent()
array2.insertionSort()
print("  * 插入排序所花的毫秒数为：", (CFAbsoluteTimeGetCurrent() - currentTime) * 1000)

var array3 = array
currentTime = CFAbsoluteTimeGetCurrent()
let sortedArray3 = quickSort(array3)
print("  * 快速排序（较慢）所花的毫秒数为：", (CFAbsoluteTimeGetCurrent() - currentTime) * 1000)

var array4 = array
currentTime = CFAbsoluteTimeGetCurrent()
quickSortRandom(&array4, low: 0, high: array4.count - 1)
print("  * 快速排序（较快）所花的毫秒数为：", (CFAbsoluteTimeGetCurrent() - currentTime) * 1000)

var array5 = array
currentTime = CFAbsoluteTimeGetCurrent()
let sortedArray5 = mergeSort(array5)
print("  * 归并排序所花的毫秒数为：", (CFAbsoluteTimeGetCurrent() - currentTime) * 1000)
