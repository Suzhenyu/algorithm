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
        
        for i in 0..<(self.count - 1) {
            for j in 0..<(self.count - 1 - i) {
                if areInIncreasingOrder(self[j + 1], self[j]) {
                    swapAt(j, j + 1)
                }
            }
        }
    }
}
