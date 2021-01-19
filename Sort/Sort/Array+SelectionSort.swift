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
        guard self.count > 1 else { return }
        
        for i in 0..<(self.count - 1) {
            var index = i
            for j in (i + 1)...(self.count - 1) {
                if areInIncreasingOrder(self[j], self[index]) {
                    index = j
                }
            }
            if index != i {
                swapAt(i, index)
            }
        }
    }
}
