//
//  main.swift
//  Sort
//
//  Created by yu on 2021/1/18.
//

import Foundation

let count = 50
var array = [Int]()
for _ in 0..<count {
    let random = Int(arc4random()) % (count * 10)
    array.append(random)
}
print("当测试数组的数据量为 \(count) 时：")

var currentTime: CFAbsoluteTime

var array0 = array
currentTime = CFAbsoluteTimeGetCurrent()
array0.bubbleSort()
print("  * 冒泡排序所花的毫秒数为：", (CFAbsoluteTimeGetCurrent() - currentTime) * 1000)


var array1 = array
currentTime = CFAbsoluteTimeGetCurrent()
array1.selectionSort()
print("  * 选择排序所花的毫秒数为：", (CFAbsoluteTimeGetCurrent() - currentTime) * 1000)

var array2 = array
currentTime = CFAbsoluteTimeGetCurrent()
array2.insertionSort()
print("  * 插入排序所花的毫秒数为：", (CFAbsoluteTimeGetCurrent() - currentTime) * 1000)
