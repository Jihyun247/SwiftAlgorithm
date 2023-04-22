//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2023/04/22.
//

import Foundation

func solution(_ s:String) -> Bool {

    var ans: Bool = false

    if s.count % 2 == 1 || s.count == 0 { return ans }
    if s.count > 0 { if s.first! == ")" { return ans } }

    var stack: [Character] = []
    var array: [Character] = Array(s)

    for i in 0 ..< s.count {

        if array[i] == "(" {

            stack.append(array[i])

        } else if array[i] == ")" {

            if !stack.isEmpty {

                let last = stack.removeLast()
                if last == "(" {
                    ans = true
                } else if last == ")" {
                    return false
                }

            } else {
                return false
            }

        }
    }

    if !stack.isEmpty { return false }

    return ans
}
