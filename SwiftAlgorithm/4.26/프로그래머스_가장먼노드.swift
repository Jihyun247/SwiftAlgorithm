//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2023/04/27.
//

import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {

    var dictionary = [Int: [Int]]()
    for i in 1...n { dictionary[i] = [] }

    for e in edge {
        dictionary[e[0]]?.append(e[1])
        dictionary[e[1]]?.append(e[0])
    }

    var queue = [(Int, Int)]()
    var visited = Array(repeating: false, count: n+1)

    var maxCnt = 0
    var distanceArr = Array(repeating: [Int](), count: 50001)

    func BFS() {
        queue.append((1,0))
        visited[1] = true

        while !queue.isEmpty {

            let (node, cnt) = queue.removeFirst()
            distanceArr[cnt].append(node)
            maxCnt = max(maxCnt, cnt)

            for i in dictionary[node]! {

                if !visited[i] {
                    queue.append((i, cnt + 1))
                    visited[i] = true
                }
            }
        }
    }

    BFS()

    return distanceArr[maxCnt].count
}

print(solution( 6, [[3, 6], [4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]] ))
