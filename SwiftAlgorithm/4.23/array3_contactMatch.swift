//
//  array3_contactMatch.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2023/04/23.
//

import Foundation

public func solution(_ A : [String], _ B : [String], _ P : String) -> String {
    // do your work here

    var result = "NO CONTACT"

    var dict = [String: String]()
    for i in 0..<A.count {
        dict[A[i]] = B[i]
    }

    dict = dict.filter { $0.value.contains(P) }
    let sortedDict = dict.sorted { $0.key < $1.key }
    if !dict.isEmpty { result = sortedDict.first!.key }

    return result
}

//let A = ["pim", "pom"]
//let B = ["999999999", "777888999"]
//let P = "88999"
//
//solution(A, B, P)   // pom
//solution(["sander", "aaa", "ann"], ["12345", "23456", "123"], "1")  // ann
//solution(["ada,", "eva", "leo"], ["1212", "1111", "4444"], "112")   // NO CONTACT
//
//// edge cases
//solution([String](), [String](), "")
//solution(A, B, "")
