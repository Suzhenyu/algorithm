//
//  MergeSort.swift
//  Sort
//
//  Created by Meng on 2021/1/19.
//

import Foundation

//实现方式1：自上而下的实施（递归法）
public func mergeSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }
    
    let middleIndex = array.count / 2
    
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    
    return merge(leftPile: leftArray, rightPile: rightArray)
}

private func merge(leftPile: [Int], rightPile: [Int]) -> [Int] {
    //1
    var leftIndex = 0
    var rightIndex = 0
    
    //2
    var orderedPile = [Int]()
    
    //3
    while leftIndex < leftPile.count && rightIndex < rightPile.count {
        if leftPile[leftIndex] < rightPile[rightIndex] {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
        }
        else if (leftPile[leftIndex] > rightPile[rightIndex]) {
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
        else {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
    }
    
    //4
    while leftIndex < leftPile.count {
        orderedPile.append(leftPile[leftIndex])
        leftIndex += 1
    }
    
    //5
    while rightIndex < rightPile.count {
        orderedPile.append(rightPile[rightIndex])
        rightIndex += 1
    }
    
    return orderedPile
}

//实现方式2：自下而上的实施（迭代）
func mergeSortBottomUp<T>(_ a: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
    let n = a.count
    
    var z = [a, a]      // 1
    var d = 0
    
    var width = 1
    while width < n {   // 2
        
        var i = 0
        while i < n {     // 3
            
            var j = i
            var l = i
            var r = i + width
            
            let lmax = min(l + width, n)
            let rmax = min(r + width, n)
            
            while l < lmax && r < rmax {                // 4
                if isOrderedBefore(z[d][l], z[d][r]) {
                    z[1 - d][j] = z[d][l]
                    l += 1
                } else {
                    z[1 - d][j] = z[d][r]
                    r += 1
                }
                j += 1
            }
            while l < lmax {
                z[1 - d][j] = z[d][l]
                j += 1
                l += 1
            }
            while r < rmax {
                z[1 - d][j] = z[d][r]
                j += 1
                r += 1
            }
            
            i += width*2
        }
        
        width *= 2
        d = 1 - d      // 5
    }
    return z[d]
}
