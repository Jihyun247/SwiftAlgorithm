//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2022/08/25.
//

import Foundation

// 성격 유형 검사하기
// (choices - 1)가 문항의 index -> choices 1 ~ 3 은 전자 / 5 ~ 7 은 후자

func solution(_ survey:[String], _ choices:[Int]) -> String {

    var result: [Character : Int] = [
        "R" : 0, "T" : 0,
        "C" : 0, "F" : 0,
        "J" : 0, "M" : 0,
        "A" : 0, "N" : 0
    ]
    let score: [Int] = [3, 2, 1, 0, 1, 2, 3]

    for element in zip(survey, choices) {
        let firstCategory = element.0.first!
        let secondCategory = element.0.last!

        if element.1 < 4 {
            result[firstCategory] = (result[firstCategory] ?? 0) + score[element.1 - 1]
        } else {
            result[secondCategory] = (result[secondCategory] ?? 0) + score[element.1 - 1]
        }
    }

    let RT = result["R"]! >= result["T"]! ? "R" : "T"
    let CF = result["C"]! >= result["F"]! ? "C" : "F"
    let JM = result["J"]! >= result["M"]! ? "J" : "M"
    let AN = result["A"]! >= result["N"]! ? "A" : "N"

    return RT + CF + JM + AN
}

print(solution(["AN", "CF", "MJ", "RT", "NA"], [5, 3, 2, 7, 5]))
// TCMA
