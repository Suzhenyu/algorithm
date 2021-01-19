//
//  Array+QuickSort.swift
//  Sort
//
//  Created by Meng on 2021/1/19.
//

import Foundation

/// 快排实现1：最简单的实现方式
/// 这个版本的快速排序不是很快，因为我们对相同的数组使用filter()三次。
public func quickSort<T: Comparable>(_ a: [T]) -> [T] {
    guard a.count > 1 else { return a }
    
    let pivot = a[a.count / 2]
    let less = a.filter{ $0 < pivot }
    let equal = a.filter{ $0 == pivot }
    let greater = a.filter{ $0 > pivot }
    
    return quickSort(less) + equal + quickSort(greater)
}

/// 快排实现2：Lomuto 分区方案
/// Lomuto算法的一个小缺点，如果存在大量重复元素，它会使快速排序变慢。
public func quickSortLomuto<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
    if low < high {
        let p = partitionLomuto(&a, low: low, high: high)
        quickSortLomuto(&a, low: low, high: p - 1)
        quickSortLomuto(&a, low: p + 1, high: high)
    }
}

private func partitionLomuto<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
    let pivot = a[high]
    
    var i = low
    for j in low..<high {
        if a[j] <= pivot {
            (a[i], a[j]) = (a[j], a[i])
            i += 1
        }
    }
    
    (a[i], a[high]) = (a[high], a[i])
    return i
}

///快排实现3：Hoare分区方案
public func quickSortHoare<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
    if low < high {
        let p = partitionHoare(&a, low: low, high: high)
        quickSortHoare(&a, low: low, high: p)
        quickSortHoare(&a, low: p + 1, high: high)
    }
}

private func partitionHoare<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
    let pivot = a[low]
    var i = low - 1
    var j = high + 1
    
    while true {
        repeat { j -= 1 } while a[j] > pivot
        repeat { i += 1 } while a[i] < pivot
        
        if i < j {
            a.swapAt(i, j)
        } else {
            return j
        }
    }
}

//快排实现4：随机选择基准
public func quickSortRandom<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
    if low < high {
        let pivotIndex = random(min: low, max: high)
        
        (a[pivotIndex], a[high]) = (a[high], a[pivotIndex])
        
        let p = partitionLomuto(&a, low: low, high: high)
        quickSortRandom(&a, low: low, high: p - 1)
        quickSortRandom(&a, low: p + 1, high: low)
    }
}

//快排实现5：荷兰国旗分区方案
public  func quickSortDutchFlag<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
    if low < high {
        let pivotIndex = random(min: low, max: high)
        let (p, q) = partitionDutchFlag(&a, low: low, high: high, pivotIndex: pivotIndex)
        quickSortDutchFlag(&a, low: low, high: p - 1)
        quickSortDutchFlag(&a, low: q + 1, high: high)
    }
}

private func partitionDutchFlag<T: Comparable>(_ a: inout [T], low: Int, high: Int, pivotIndex: Int) -> (Int, Int) {
    let pivot = a[pivotIndex]
    
    var smaller = low
    var equal = low
    var larger = high
    
    while equal <= larger {
        if a[equal] < pivot {
            swap(&a, smaller, equal)
            smaller += 1
            equal += 1
        }
        else if a[equal] == pivot {
            equal += 1
        }
        else {
            swap(&a, equal, larger)
            larger -= 1
        }
    }
    return (smaller, larger)
}

private func swap<T>(_ a: inout [T], _ i: Int, _ j: Int) {
    if i != j {
        a.swapAt(i, j)
    }
}

private func random(min: Int, max: Int) -> Int {
  assert(min < max)
  return min + Int(arc4random_uniform(UInt32(max - min + 1)))
}
