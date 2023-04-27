//
//  프로그래머스_다음큰숫자.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2023/04/28.
//

import Foundation

func solution(_ n:Int) -> Int
{

    let binary = String(n, radix: 2)
    let nCnt = Array(binary).filter { $0 == "1"}.count

    var answerCnt = 0
    var answer = n

    while answerCnt != nCnt {
        answer += 1
        let answerBinary = String(answer, radix: 2)
        answerCnt = Array(answerBinary).filter { $0 == "1"}.count
    }

    return answer
}
