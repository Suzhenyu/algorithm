package Java;

import java.util.ArrayList;
import java.util.List;

/**
 * 并查集的实现
 * 参考：《算法导论》21.3节
 * 2016-08-31
 */
public class DisjointSet<T> {
    public static void main(String[] args) {
        DisjointSet<String> disjointSet = new DisjointSet<String>();
        disjointSet.makeSet("cao");
        disjointSet.makeSet("yan");
        disjointSet.makeSet("feng");
        disjointSet.union("cao", "yan");
        disjointSet.union("cao", "feng");
        System.out.println(disjointSet.toString());
    }

    private List<Node> forests; // 所有节点
    private int setCounter; // 集合计数

    public DisjointSet() {
        forests = new ArrayList<Node>();
        setCounter = 0;
    }

    public int getSetCounter() {
        return setCounter;
    }

    // 向森林中添加节点
    public void makeSet(T t) {
        Node node = new Node(t);
        forests.add(node);
        setCounter++;
    }

    // 将包含 x 和包含 y 的两个集合进行合并
    public void union(T x, T y) {
        if (x.equals(y)) {
            throw new IllegalArgumentException("union 的两个元素不能相等！");
        }

        Node xNode = isContain(x);
        Node yNode = isContain(y);
        if (xNode != null && yNode != null) {
            link(findSet(xNode), findSet(yNode));
            setCounter--;
        }
    }

    // 查找到节点 node 的根节点
    public Node findSet(Node node) {
        // 这是原始版本
        // if (node != node.parent) {
        //     return findSet(node.parent);
        // } else {
        //     return node;
        // }

        if (node != node.parent) {
            // 路径压缩优化，参考《算法导论》插图 21.5
            node.parent = findSet(node.parent);
        }
        return node.parent;
    }

    // 查找到节点 node 的根节点
    public Node findSet(T t) {
        Node node = isContain(t);
        if (node == null) {
            throw new IllegalArgumentException("不包含该节点！");
        } else {
            return findSet(node);
        }
    }

    // 将两个根节点代表的集合进行连接
    private void link(Node xNode, Node yNode) {
        if (xNode.equals(yNode)) {
            return;
        }

        if (xNode.rank > yNode.rank) {
            yNode.parent = xNode;
        } else {
            xNode.parent = yNode;
            if (xNode.rank == yNode.rank) {
                yNode.rank += 1;
            }
        }
    }

    // 森林是否包含这个节点
    private Node isContain(T t) {
        for (Node node : forests) {
            if (node.t.equals(t)) {
                return node;
            }
        }
        return null;
    }

    @Override
    public String toString() {
        if (forests.size() == 0) {
            return "并查集为空！";
        }
        StringBuilder builder = new StringBuilder();
        for (Node node : forests) {
            Node root = findSet(node);
            builder.append(node.t).append("→").append(root.t);
            builder.append("\n");
        }

        return builder.toString();
    }

    /**
     * 内部类，并查集的 rooted node
     */
    private class Node {
        Node parent;
        int rank;
        T t;

        private Node(T t) {
            parent = this;
            rank = 0;
            this.t = t;
        }
    }
}