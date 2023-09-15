//
//  BucketSort.swift
//  Sort
//
//  Created by Meng on 2022/3/23.
//

import Foundation

private func indexFor(_ a: Int, _ min: Int, _ step: Int) -> Int {
    return (a - min) / step
}

public func bucketSort(_ arr: inout [Int]) {
    guard let max = arr.max(), let min = arr.min() else { return }
    
    // 该值也可根据实际情况选择
    let bucketNum = max / 10 - min / 10 + 1
    var buckList = [[Int]]()
    // create bucket
    for _ in 1...bucketNum {
        buckList.append([Int]())
    }
    // push into the bucket
    for i in 0..<arr.count {
        let index = indexFor(arr[i], min, 10)
        buckList[index].append(arr[i])
    }
    var bucket = [Int]()
    var index = 0
    for i in 0..<bucketNum {
        bucket = buckList[i]
        insertSort(&bucket)
        for k in bucket {
            arr[index] = k
            index += 1
        }
    }
}
//public void bucketSort(int[] arr) {
//
//    int max = arr[0], min = arr[0];
//    for (int a : arr) {
//        if (max < a)
//            max = a;
//        if (min > a)
//            min = a;
//    }
//    // 該值也可根據實際情況選擇
//    int bucketNum = max / 10 - min / 10 + 1;
//    List buckList = new ArrayList<List<Integer>>();
//    // create bucket
//    for (int i = 1; i <= bucketNum; i++) {
//        buckList.add(new ArrayList<Integer>());
//    }
//    // push into the bucket
//    for (int i = 0; i < arr.length; i++) {
//        int index = indexFor(arr[i], min, 10);
//        ((ArrayList<Integer>) buckList.get(index)).add(arr[i]);
//    }
//    ArrayList<Integer> bucket = null;
//    int index = 0;
//    for (int i = 0; i < bucketNum; i++) {
//        bucket = (ArrayList<Integer>) buckList.get(i);
//        insertSort(bucket);
//        for (int k : bucket) {
//            arr[index++] = k;
//        }
//    }
//
//}

// 把桶內元素插入排序
private func insertSort(_ bucket: inout [Int]) {
    for i in 1..<bucket.count {
        let temp = bucket[i]
        var j = i - 1
        while j >= 0 && bucket[j] > temp {
            bucket[j + 1] = bucket[j]
            j -= 1
        }
        bucket[j + 1] = temp
    }
}
//private void insertSort(List<Integer> bucket) {
//    for (int i = 1; i < bucket.size(); i++) {
//        int temp = bucket.get(i);
//        int j = i - 1;
//        for (; j >= 0 && bucket.get(j) > temp; j--) {
//            bucket.set(j + 1, bucket.get(j));
//        }
//        bucket.set(j + 1, temp);
//    }
//}
