package queue

import "math"

// 队列，FIFO
// 实现方法：切片或双端链表
type queue struct {
	container []int
}

func (q *queue) Enqueue(element int) {
	q.container = append(q.container, element)
}

func (q *queue) Dequeue() int {
	if len(q.container) == 0 {
		return math.MinInt
	}

	ans := q.container[0]
	q.container = q.container[1:]
	return ans
}

func (q *queue) len() int {
	return len(q.container)
}

//切片如何删除元素？底层是如何实现的？
