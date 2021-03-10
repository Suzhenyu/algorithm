//
//  Array+SelectionSort.swift
//  Demo
//
//  Created by yu on 2021/1/18.
//

extension Array where Element: Comparable {
  public mutating func bubbleSort() {
    bubbleSort(by: <)
  }
  
  public mutating func bubbleSort(by areInIncreasingOrder: (Element, Element) -> Bool) {
    guard self.count > 1 else { return }
    
    for i in 0..<self.count - 1 {
      var flag = false
      for j in 0..<self.count - 1 - i {
        if areInIncreasingOrder(self[j + 1], self[j]) {
          swapAt(j, j + 1)
          flag = true
        }
      }
      if !flag { break }
    }
  }
}

public func bubbleSort(nums: inout [Int]) {
  guard nums.count > 1 else { return }
  
  for i in 0..<nums.count - 1 {
    var flag = false  // 提前退出冒泡循环的标志位
    for j in 0..<nums.count - 1 - i {
      if nums[j] > nums[j + 1] {  // 交换
        nums.swapAt(j, j + 1)
        flag = true   // 表示有数据交换
      }
    }
    if !flag { break }  // 没有数据交换，提前退出
  }
}
