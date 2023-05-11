//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2023/05/04.
//

import Foundation

func solution(_ n:Int) -> Int {

    var dp = [Int: Int]()

    func fb(_ n: Int) -> Int {

        if n == 0 { return 0 }
        else if n == 1 { return 1 }

        if let result = dp[n] { return result }

        dp[n] = (fb(n-1) + fb(n-2)) % 1234567

        return dp[n]!
    }

    return fb(n)
}
