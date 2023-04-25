//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2023/04/25.
//

import Foundation

var count = 0

let comCnt = Int(readLine()!)!
let networkCnt = Int(readLine()!)!
var network = [Int: [Int]]()
for i in 1...comCnt {
    network.updateValue([], forKey: i)
}
// Edges Lists -> Adjacency Lists 양방향 모두 저장
for _ in 1...networkCnt {
    let con = readLine()!.components(separatedBy: " ").compactMap { Int($0)! }
    network[con[0]]?.append(con[1])
    network[con[1]]?.append(con[0])
}

var visited = [Int]()

var stack: [Int] = []
func DFS(start: Int) {

    if visited.contains(start) { return }

    visited.append(start)
    for node in network[start]! {
        DFS(start: node)
    }
}

DFS(start: 1)

print(visited.count - 1)
