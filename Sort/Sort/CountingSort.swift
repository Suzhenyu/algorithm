//
//  CountingSort.swift
//  Sort
//
//  Created by Meng on 2022/3/23.
//

import Foundation


/// 计数排序
/// - Parameters:
///   - a: 待排序的数据（假设数组中存储的都是非负整数）
public func countingSort(_ elements: inout [Int]) {
    guard let max = elements.max() else { return } // 查找数组中数据的范围
    
    let n = elements.count
    // 申请一个计数数组c，下标大小为 [0, max]
    var counts = [Int](repeating: 0, count: max + 1)
    // 计算每个元素的个数，放入c中
    for i in 0..<n {
        counts[elements[i]] += 1
    }
    // 依次累加
    for i in 1...max {
        counts[i] += counts[i - 1]
    }
    // 临时数组r，存储排序之后的结果
    var r = [Int](repeating: 0, count: n)
    // 计算排序的关键步骤，有点难理解
    for i in stride(from: n - 1, through: 0, by: -1) {
        let index = counts[elements[i]] - 1
        r[index] = elements[i]
        counts[elements[i]] -= 1
    }
    // 将结果拷贝给a数组
    for i in 0..<n {
        elements[i] = r[i]
    }
}
