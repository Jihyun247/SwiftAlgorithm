//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2023/04/27.
//

import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {

    let sortedA = a.sorted(by: >)
    let sortedB = b.sorted(by: >)

    var cnt = 0
    var j = 0
    for i in 0 ..< a.count {
        if sortedA[i] < sortedB[j] {
            cnt += 1
            j += 1
        }
    }


    return cnt
}
