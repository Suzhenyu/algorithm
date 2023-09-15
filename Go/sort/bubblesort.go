package sort

func BubbleSort(array []int) {
	for i := 0; i < len(array)-1; i++ {
		flag := true
		for j := 0; j < len(array)-1-i; j++ {
			if array[j] > array[j+1] {
				array[j], array[j+1] = array[j+1], array[j]
				flag = false
			}
		}
		if flag {
			break
		}
	}
}
