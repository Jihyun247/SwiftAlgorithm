//
//  프로그래머스_문자열압축.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2023/04/28.
//

import Foundation

func solution(_ s:String) -> Int {
    if s.count < 3 { return s.count }
    var result = s.count

    for sliceLength in 1...s.count/2 {
        let slicedString = sliceString(s, sliceLength)
        let compressedString = compressString(slicedString)
        let length = compressedString.count
        if length < result { result = length }
    }

    return result
}

func sliceString(_ string: String, _ sliceLength: Int) -> [String] {
    var result: [String] = []
    var temp = ""

    for s in string {
        temp += String(s)
        if temp.count == sliceLength {
            result.append(temp)
            temp = ""
        }
    }

    if temp != "" { result.append(temp) }

    return result
}

func compressString(_ sArray: [String]) -> String {
    var result: String = ""
    var temp: String = ""
    var count = 1

    for s in sArray {
        if temp == s {
            count += 1
        } else {
            if temp != "" {
                result += (count > 1) ? "\(count)\(temp)" : "\(temp)"
            }
            temp = s
            count = 1
        }
    }

    if temp != "" { result += (count > 1) ? "\(count)\(temp)" : "\(temp)" }

    return result
}
