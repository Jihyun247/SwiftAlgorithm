//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2023/05/30.
//

import Foundation

typealias Product = (weight: Int, value: Int)

let firstLine = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = firstLine[0]
let maxW = firstLine[1]

var products = [Product]()
for _ in 0 ..< n {
    let line = readLine()!.components(separatedBy: " ").map { Int($0)! }
    products.append( Product(weight: line[0], value: line[1]) )
}

var DP = Array(repeating: Array(repeating: 0, count: maxW + 1), count: n)

for i in 0 ..< n { // 제품
    for j in 1 ... maxW { // 무게

        if i == 0 {
            if j >= products[i].weight { DP[i][j] = products[i].value }
        } else {
            if j < products[i].weight { DP[i][j] = DP[i-1][j] }
            else {
                DP[i][j] = max(DP[i-1][j], products[i].value + DP[i-1][j-products[i].weight])
            }
        }
    }
}

print(DP[n-1][maxW])
