package sort

func HeapSort(array []int) {
	buildHeap(array)

	for i := len(array) - 1; i > 0; i-- {
		array[0], array[i] = array[i], array[0]
		shiftDown0(array, 0, i-1)
	}
}

func buildHeap(array []int) {
	count := len(array)
	for i := (count - 1) / 2; i >= 0; i-- {
		shiftDown1(array, i, len(array)-1)
	}
}

func shiftDown0(array []int, start, end int) {
	left := start*2 + 1
	right := left + 1

	maxPos := start
	if left <= end && array[left] > array[maxPos] {
		maxPos = left
	}
	if right <= end && array[right] > array[maxPos] {
		maxPos = right
	}

	if maxPos == start {
		return
	}
	array[start], array[maxPos] = array[maxPos], array[start]
	shiftDown0(array, maxPos, end)
}

func shiftDown1(array []int, start, end int) {
	index := start
	for {
		left := index*2 + 1
		right := left + 1

		maxPos := index
		if left <= end && array[left] > array[maxPos] {
			maxPos = left
		}
		if right <= end && array[right] > array[maxPos] {
			maxPos = right
		}

		if maxPos == index {
			break
		}

		array[index], array[maxPos] = array[maxPos], array[index]
		index = maxPos
	}
}
