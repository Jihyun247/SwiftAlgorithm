//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2023/04/17.
//

import Foundation

// MARK: - Done
// 차집합 Set

func solution(_ s:String) -> [Int] {
    var fixedString = s.replacingOccurrences(of: "{", with: "[")
    fixedString = fixedString.replacingOccurrences(of: "}", with: "]")

    var twoArray = fixedString.components(separatedBy: "],[")
    var onlyNumArray: [[Int]] = Array(repeating: [], count: twoArray.count)

    for (idx, array) in twoArray.enumerated() { //"{{4,2,3}"
        let splited = array.split(separator: ",")
        for subString in splited {
            var num = subString.filter { $0.isNumber }
            onlyNumArray[idx].append(Int(String(num))!)
        }
    }
    onlyNumArray = onlyNumArray.sorted(by: {$0.count < $1.count})

    var result: [Int] = []

    for nums in onlyNumArray {
        let sub = Set(nums).subtracting(result).first ?? 0
        result.append(sub)
    }

    return result
}

//print(solution("{{20,111},{111}}"))
