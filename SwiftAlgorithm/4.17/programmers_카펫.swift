//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2023/04/17.
//

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var whArray: [Int] = []
    var oneSideSum = (brown - 4) / 2
    for i in 1...oneSideSum/2 {
        whArray = [i, oneSideSum - i]
        if whArray[0] * whArray[1] == yellow {
            break
        }
    }


    return whArray.map { $0 + 2 }.sorted(by: >=)
}

//print(solution(24, 24))
