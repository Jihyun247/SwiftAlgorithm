//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2023/05/29.
//

import Foundation

let n = Int(readLine()!)!
var cards = readLine()!.components(separatedBy: " ").map { Int($0)! }

var DP = Array(repeating: 0, count: n + 1)

for i in 1 ..< n + 1 {
    for j in 1 ..< i + 1 {
        DP[i] = max(DP[i], DP[i-j] + cards[j-1])
    }
}

print(DP[n])
// DP[4] = DP[4-1] + cards[1]
// DP[4] = DP[4-2] + cards[2]
