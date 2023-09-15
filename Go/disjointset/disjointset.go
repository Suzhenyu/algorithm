// 并查集

package disjointset

// type Node struct {
// 	element int
// 	parent  *Node
// }

// type DisjointSet struct {
// 	trees []*Node
// }

// // 合并
// func (set *DisjointSet) Union(a, b *Node) {
// 	if set.Find(a, b) {
// 		return
// 	}

// 	rootA, rootB := a.getRoot(), b.getRoot()
// 	rootA.parent = rootB
// 	deleteElement(set.trees, rootA)
// }

// // 查询
// func (set *DisjointSet) Find(a, b *Node) bool {
// 	return a.getRoot() == b.getRoot()
// }

// func (node *Node) getRoot() *Node {
// 	if node.parent == nil {
// 		return node
// 	} else {
// 		return node.parent.getRoot()
// 	}
// }

// func deleteElement(trees []*Node, node *Node) {
// 	index := -1
// 	for i, v := range trees {
// 		if v == node {
// 			index = i
// 			break
// 		}
// 	}
// 	if index == -1 {
// 		return
// 	}

// 	trees = append(trees[:index], trees[index+1:]...)
// }

// func (set *DisjointSet) test() {
// 	print(set.trees)
// }

type UnionFind struct {
	count  int
	parent []int
}

func (u *UnionFind) NewUnionFind(n int) {
	u.count = n
	for i := 0; i < n; i++ {
		u.parent = append(u.parent, i)
	}
}

func (u *UnionFind) Find(p int) int {
	for p != u.parent[p] {
		u.parent[p] = u.parent[u.parent[p]]
		p = u.parent[p]
	}
	return p
}

func (u *UnionFind) Union(p, q int) {
	rootP, rootQ := u.Find(p), u.Find(q)
	if rootP == rootQ {
		return
	}
	u.parent[rootP] = rootQ
	u.count--
}

// // Java
// class UnionFind {
// 	private int count = 0;
// 	private int[] parent;
// 	public UnionFind(int n) {
// 		count = n;
// 		parent = new int[n];
// 		for (int i = 0; i < n; i++) {
// 			parent[i] = i;
// 		}
// 	}

// 	public int find(int p) {
// 		while (p != parent[p]) {
// 			parent[p] = parent[parent[p]];
// 			p = parent[p];
// 		}
// 		return p;
// 	}

// 	public void union(int p, int q) {
// 		int rootP = find(p);
// 		int rootQ = find(q);
// 		if (rootP == rootQ) return;
// 		parent[rootP] = rootQ;
// 		count--;
// 	}

// }
