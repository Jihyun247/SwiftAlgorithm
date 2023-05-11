//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2023/05/04.
//

import Foundation

func solution(_ s:String) -> Int{

    let array = Array(s).map { String($0) }
    var stack = [String]()

    if array.count == 0 { return 0 }
    stack.append(array.first!)

    for i in 1 ..< array.count {

        if !stack.isEmpty {

            let popped = stack.removeLast()
            if popped != array[i] {
                stack.append(popped)
                stack.append(array[i])
            }

        } else {
            stack.append(array[i])
        }
    }

    return stack.isEmpty ? 1 : 0
}

print(solution("bbbbb"))
