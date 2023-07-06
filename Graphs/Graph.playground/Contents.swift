import Foundation

/**
 
 Use Cases
    - Social networks.
    - Path finding algorithms in maps.
    - Nearest neighbors in the network or group games.
    - Google's mapping of web pages of the world wide web [www].
    -  Song recommendations in Spotify app.

 So it(Graph concept) is a very important subject for Senior Engineers.

 What Graphs?
 - A Graph G is an ordered pair of a set of vertices V and a set of edges E.
 - G = (V,E)
 
 Edges
    - Directed
    - Undirected
 Weighted Edges
  - Relative cost moving from one node to another.
 
 How can I represent Graphs in code?
  - 3 different ways
    - Edge lists
    - Adjacency matrices
    - Adjacency lists
 Searches
    - Breadth First Search
    - Depth First Search
 
 How do they work?
    - lets explore in code

 BFS Algorithm
    - uses QUEUE.
 */

struct Queue<T> {
    private var array: [T]
    
    init() {
        array = []
    }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    mutating func add(_ element: T) {
        array.append(element)
    }
    
    mutating func remove() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    func peak() -> T? {
        return array.first
    }
}

struct Stack<T> {
    private var array: [T] = []
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    mutating func push(_ element: T) {
        array.append(element)
    }
    
    mutating func pop() -> T? {
        return array.removeLast()
    }
    
    var top: T? {
        return array.first
    }
}

class Graph {
    var V = 0                    // number of vertices
    var adj = [[Int]]()          // adjacency list
    
    init(_ V: Int) {
        self.V = V
        for _ in 0..<V {
            adj.append([Int]())   // create empty array of adjacency list
        }
    }
    
    func addEdge(v: Int, w: Int) {
        adj[v].append(w)
    }
    
    // BFS traversal from a given source s
    func BFS(s: Int) -> [Int] {
        var result: [Int] = []
        
        // mark all vertices as not visited
        var visited: [Bool] = adj.map { _ in false }
        
        // Create BFS Queue
        var queue = Queue<Int>()
        
        // Mark first vertex as visited and enqueue
        visited[s] = true
        print("Starting at \(s)")
        queue.add(s)
        result.append(s)
        
        while queue.count > 0 {
            let current = queue.remove()!
            print("De-Queueing \(current)")
            
            // Get all the adjacent vertices of the current vertex
            // If adjacent has not being visited, mark visited and enqueue
            
            for n in adj[current] {
                if visited[n] == false {
                    visited[n] = true
                    print("Queueing \(n)")
                    queue.add(n)
                    result.append(n)
                }
            }
        }
                
        return result
    }
    
    
    // DFS traversal from a given source s
    func DFS(s: Int) -> [Int] {
        var result: [Int] = []
        
        // mark all vertices as not visited
        var visited: [Bool] = adj.map { _ in false }
        
        //create DFS Stack
        var stack = Stack<Int>()
        
        // Mark first vertex as visited and push
        print("Starting at \(s)")
        visited[s] = true
        stack.push(s)
        
        while stack.count > 0 {
            let current = stack.pop()!
            print("Popping \(current)")
            result.append(current)
            
            // Iterate over all neighbours adding to stack
            // and pushing deep as we go
            for n in adj[current] {
                if visited[n] == false {
                    visited[n] = true
                    print("Pushing - \(n)")
                    stack.push(n)
                }
            }
        }

        return result
    }
}

// Need to have as many vertices as you have edges
let g = Graph(8)
g.addEdge(v: 0, w: 1)
g.addEdge(v: 1, w: 0)
g.addEdge(v: 1, w: 4)
g.addEdge(v: 4, w: 1)
g.addEdge(v: 4, w: 6)
g.addEdge(v: 6, w: 4)
g.addEdge(v: 6, w: 0)
g.addEdge(v: 0, w: 6)
g.addEdge(v: 1, w: 5)
g.addEdge(v: 5, w: 1)
g.addEdge(v: 5, w: 3)
g.addEdge(v: 3, w: 5)
g.addEdge(v: 3, w: 0)
g.addEdge(v: 0, w: 3)
g.addEdge(v: 5, w: 2)
g.addEdge(v: 2, w: 5)
g.addEdge(v: 2, w: 7)
g.addEdge(v: 7, w: 2)

print(g.BFS(s: 0))

print("\n")
print("===============================")
print("\n")

print(g.DFS(s: 0))
