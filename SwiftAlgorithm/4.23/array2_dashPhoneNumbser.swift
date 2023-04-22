//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2023/04/23.
//

import Foundation

func solution(_ S: String) -> String {

    var copiedS = S.replacingOccurrences(of: " ", with: "")
    copiedS = copiedS.replacingOccurrences(of: "-", with: "")

    var result = ""
    var count = -2

    for c in copiedS {
        result.append(c)
        if count % 3 == 0 {
            result.append("-")
        }
        count += 1
    }

    if result.last == "-" {
        result = String(result.dropLast())
    }

    var chars = Array(result)
    let secondLastPtr = chars.count - 2
    if chars[secondLastPtr] == "-" {

        chars[secondLastPtr] = chars[secondLastPtr - 1]
        chars[secondLastPtr - 1] = "-"
    }

    return String(chars)
}

//print(solution("123456789"))
//print(solution("555372654"))
//print(solution("0 - 22 1985--324"))
//
//print(solution("01"))
//print(solution("012"))
//print(solution("0123"))
//print(solution("0123           444"))
//print(solution("--------0123         444"))

