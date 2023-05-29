//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2023/05/29.
//

import Foundation

let n = Int(readLine()!)!
var wines = [Int]()
wines.append(0)
for _ in 1 ... n {
    let wine = Int(readLine()!)!
    wines.append(wine)
}

var DP = Array(repeating: 0, count: 10001)

DP[1] = wines[1]
if n > 1 { DP[2] = wines[1] + wines[2] }

if n > 2 {

    for i in 3 ... n {

        DP[i] = max(
            DP[i-2] + wines[i], DP[i-3] + wines[i-1] + wines[i], DP[i-1]
        )
    }

}

print(DP[n])
