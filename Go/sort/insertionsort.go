package sort

func InsertionSort(array []int) {
	for i := 1; i < len(array); i++ {
		current := array[i]

		preIndex := i - 1
		for preIndex >= 0 && array[preIndex] > current {
			array[preIndex+1] = array[preIndex]
			preIndex--
		}
		array[preIndex+1] = current
	}
}
