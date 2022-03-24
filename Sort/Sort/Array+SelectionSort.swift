//
//  Array+SelectionSort.swift
//  Demo
//
//  Created by yu on 2021/1/18.
//

extension Array where Element: Comparable {
    public mutating func selectionSort() {
        selectionSort(by: <)
    }
    
    public mutating func selectionSort(by areInIncreasingOrder: (Element, Element) -> Bool) {
        for i in 0..<self.count - 1 {
            var min = i
            for j in i + 1..<self.count {
                if areInIncreasingOrder(self[j], self[min]) {
                    min = j
                }
            }
            if min != i {
                swapAt(i, min)
            }
        }
    }
}

public func selectionSort(_ nums: inout [Int]) {
    for i in 0..<nums.count - 1 {
        var min = i
        for j in i + 1..<nums.count {
            if nums[j] < nums[min] {
                min = j
            }
        }
        if min != i {
            nums.swapAt(i, min)
        }
    }
}
