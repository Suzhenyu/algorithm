//
//  Array+InsertionSort.swift
//  Demo
//
//  Created by yu on 2021/1/18.
//

extension Array where Element: Comparable {
    public mutating func insertionSort() {
        insertionSort(by: <)
    }
    
    public mutating func insertionSort(by areInIncreasingOrder: (Element, Element) -> Bool) {
        guard self.count > 1 else { return }
        
        for i in 1...self.count - 1 {
            let current = self[i]
            var preIndex = i - 1
            while preIndex >= 0 && areInIncreasingOrder(current, self[preIndex]) {
                self[preIndex + 1] = self[preIndex]
                preIndex -= 1
            }
            self[preIndex + 1] = current
        }
    }
}

public func insertionSort(nums: inout [Int]) {
  guard nums.count > 1 else { return }
  
  for i in 1...nums.count - 1 {
    let current = nums[i]
    var preIndex = i - 1
    while preIndex >= 0 && current < nums[preIndex] {
      nums[preIndex + 1] = nums[preIndex]
      preIndex -= 1
    }
    nums[preIndex + 1] = current
  }
}
