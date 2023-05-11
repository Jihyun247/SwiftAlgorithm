//
//  프로그래머스_괄호회전하기.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2023/04/28.
//

import Foundation

func solution(_ s:String) -> Int {

    var copiedS = Array(s).map { String($0) }
    if copiedS.count == 0 { return 0 }

    var answerArray = Array(repeating: false, count: s.count)

    func isCorrect (_ chars: [String]) -> Bool {

        var stack = [String]()

        for char in chars {
            if char == "[" || char == "{" || char == "(" {
                stack.append(char)

            } else {

                if stack.isEmpty {
                    return false

                } else {

                    let before = stack.removeLast()
                    if  (before == "[" && char == "]") ||
                        (before == "{" && char == "}") ||
                        (before == "(" && char == ")") {
                            continue
                    } else {
                            return false
                    }
                }
            }
        }

        return stack.isEmpty ? true : false
    }

    // 하나씩 왼쪽으로 회전
    for i in 0 ..< s.count {
        answerArray[i] = isCorrect(copiedS)
        copiedS.append(copiedS.removeFirst())
    }
    return answerArray.filter { $0 == true }.count
}
