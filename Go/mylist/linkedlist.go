package mylist

type Element struct {
	next, prev *Element
	list       *List
	Value      any
}

func (e *Element) Next() *Element {
	if p := e.next; e.list != nil && p != &e.list.root {
		return p
	}
	return nil
}

func (e *Element) Prev() *Element {
	if p := e.prev; e.list != nil && p != &e.list.root {
		return p
	}
	return nil
}

// List 代表一个双向链表
// List 的零值是一个已经准备好的空链表
type List struct {
	root Element //哨兵节点
	len  int
}

func (l *List) Init() *List {
	l.root.next = &l.root
	l.root.prev = &l.root
	l.len = 0
	return l
}

func New() *List { return new(List).Init() }

// 链表长度
func (l *List) Len() int { return l.len }

// 链表的头结点
func (l *List) Front() *Element {
	if l.len == 0 {
		return nil
	}
	return l.root.next
}

// 链表的尾结点
func (l List) Back() *Element {
	if l.len == 0 {
		return nil
	}
	return l.root.prev
}

func (l *List) lazyInit() {
	if l.root.next == nil {
		l.Init()
	}
}

// 在 at 之后插入 e，长度增长，然后返回 e
func (l *List) insert(e, at *Element) *Element {
	e.prev = at
	e.next = at.next
	e.prev.next = e
	e.next.prev = e
	e.list = l
	l.len++
	return e
}

// 同上
func (l *List) insertValue(v any, at *Element) *Element {
	return l.insert(&Element{Value: v}, at)
}

//在 l 中删除 e
func (l *List) remove(e *Element) {
	//默认 e.list == l 成功
	e.prev.next = e.next
	e.next.prev = e.prev
	e.next = nil // 避免内存泄漏
	e.prev = nil // 避免内存泄漏
	e.list = nil
	l.len--
}

// 将 e 移到 at 后面
func (l *List) move(e, at *Element) {
	// 0. 判断 e 和 at 是否相同
	if e == at {
		return
	}

	// 1. 将 e 从旧位置中移除
	e.prev.next = e.next
	e.next.prev = e.prev

	// 2. 将 e 嵌到 at 后面
	e.prev = at
	e.next = at.next
	e.prev.next = e
	e.next.prev = e
}

// 从 l 中移除 e
func (l *List) Remove(e *Element) any {
	if e.list == l {
		l.remove(e)
	}
	return e.Value
}

// 将 v Push 到链表头部
func (l *List) PushFront(v any) *Element {
	l.lazyInit()
	return l.insertValue(v, &l.root)
}

// 将 v Push 到链表尾部
func (l *List) PushBack(v any) *Element {
	l.lazyInit()
	return l.insertValue(v, l.root.prev)
}

// 将 v 插入到 l 中的 make 之前
func (l *List) InsertBefore(v any, mark *Element) *Element {
	if mark.list != l {
		return nil
	}
	return l.insertValue(v, mark.prev)
}

// 将 v 插入到 l 中的 make 之后
func (l *List) InsertAfter(v any, mark *Element) *Element {
	if mark.list != l {
		return nil
	}
	return l.insertValue(v, mark)
}

// 将 e 移到 l 的头部
func (l *List) MoveToFront(e *Element) {
	if e.list != l || l.root.next == e {
		return
	}
	l.move(e, &l.root)
}

// 将 e 移到 l 的尾部
func (l *List) MoveToBack(e *Element) {
	if e.list != l || l.root.prev == e {
		return
	}
	l.move(e, l.root.prev)
}

// 将 e 移到 mark 之前
func (l *List) MoveBefore(e, mark *Element) {
	if e.list != l || e == mark || mark.list != l {
		return
	}
	l.move(e, mark.prev)
}

// MoveAfter 将元素 e 移到 mark 之后
func (l *List) MoveAfter(e, mark *Element) {
	if e.list != l || e == mark || mark.list != l {
		return
	}
	l.move(e, mark)
}

// 将链表 other 插入到链表 l 后面
func (l *List) PushBackList(other *List) {
	l.lazyInit()
	for i, e := other.Len(), other.Front(); i > 0; i, e = i-1, e.Next() {
		l.insertValue(e.Value, l.root.prev)
	}
}

// 将链表 other 插入到链表 l 前面
func (l *List) PushFrontList(other *List) {
	l.lazyInit()
	for i, e := other.Len(), other.Back(); i > 0; i, e = i-1, e.Prev() {
		l.insertValue(e.Value, &l.root)
	}
}
