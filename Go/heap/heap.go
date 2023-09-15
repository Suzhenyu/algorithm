package heap

type Heap struct {
	nodes []int
}

func (h *Heap) up(j int) {
	for {
		i := (j - 1) / 2
		if i == j || h.nodes[j] > h.nodes[i] {
			break
		}
		h.nodes[i], h.nodes[j] = h.nodes[j], h.nodes[i]
		j = i
	}
}
