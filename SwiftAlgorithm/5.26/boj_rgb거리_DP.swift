//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2023/05/26.
//

import Foundation

let n = Int(readLine()!)!
var house = [[Int]]()
for _ in 0 ..< n {
    let cost = readLine()!.components(separatedBy: " ").map { Int($0)! }
    house.append(cost)
}
house = [[0,0,0]] + house
var DP = Array(repeating: Array(repeating: 0, count: 3), count: n+1)

for i in 1 ..< n+1 {

    DP[i][0] = min(DP[i-1][1], DP[i-1][2]) + house[i][0]
    DP[i][1] = min(DP[i-1][0], DP[i-1][2]) + house[i][1]
    DP[i][2] = min(DP[i-1][0], DP[i-1][1]) + house[i][2]
}
print(DP[n].min()!)

// 1. 점화식
// 2. dp 배열
