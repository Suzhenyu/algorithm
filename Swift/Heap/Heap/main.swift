let nums = [ 5, 13, 2, 25, 7, 17, 20, 8, 4 ]
var heap = Heap<Int>(array: nums, sort: <)
print(heap.sort())
print(heap.heapSort(nums, <))
