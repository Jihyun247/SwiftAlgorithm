//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2022/09/12.
//

import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var wallets = [[Int]]()
    var width = 0
    var height = 0

    for size in sizes {
        size[0] > size[1] ? wallets.append(size.reversed()) : wallets.append(size)
    }

    for wallet in wallets {
        if wallet[0] > width { width = wallet[0] }
        if wallet[1] > height { height = wallet[1] }
    }

    return width * height
}

print(solution([[14, 4], [19, 6], [6, 16], [18, 7], [7, 11]]))
// 133
