//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2023/04/17.
//

import Foundation

// MARK: - DONE

func solution(_ s:String) -> String {
        if s.count == 0 { return "" }

    var array = s.split(separator: " ").map { Int($0)! }

    var min = array.min()!
    var max = array.max()!
    return String(min) + " " + String(max)
}

//print(solution("-1 -2 -3 -4"))
