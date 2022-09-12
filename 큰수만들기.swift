//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2022/08/28.
//

import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var count = k
    let numberArray = Array(number).map { String($0) }
    var stack: [String] = []

    for i in 0..<numberArray.count {

        while count != 0 && !stack.isEmpty && stack.last! < numberArray[i] {
            stack.removeLast()
            count -= 1
        }

        if count == 0 {
            stack.append(contentsOf: numberArray[i...])
            break
        } else {
            stack.append(numberArray[i])
        }
    }

    return String(stack.joined().prefix(number.count - k))

}

print(solution("4177252841", 4))
