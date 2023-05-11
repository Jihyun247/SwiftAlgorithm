//
//  프로그래머스_영어끝말잇기.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2023/04/28.
//

import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    // 몇번째 차례에 탈락하는지 -> round = 1 부터 시작
    var round = 1
    // 사람 수 memberTurn = 1 -> round 한바퀴 돌면 ++1
    var memberTurn = 1
    // 마지막 문자와 첫글자 비교해야함
    var lastChar = ""
    var usedWords: [String] = []

    for word in words {

        // 이미 나온 문자라면 Return
        if usedWords.contains(word) {
            return [memberTurn, round]
        }

        // 마지막글자와 첫글자가 같지 않다면 Return
        if lastChar != "" && lastChar != word.prefix(1) {
            return [memberTurn, round]
        }
        // 문자열 마지막 문자 GET 하는 방법 ****
        let lastIndex = word.index(before: word.endIndex)
        lastChar = String(word[lastIndex])
        //lastChar = word[word.endIndex - 1]

        usedWords.append(word)

        if memberTurn == n {
            memberTurn = 1
            round += 1
        } else {
            memberTurn += 1
        }
    }

    return [0,0]
}


//import Foundation
//
//func solution(_ n:Int, _ words:[String]) -> [Int] {
//
//    var round = 0
//    var turn = 0
//    var lastChar = ""
//    var usedWords = [String: Int]()
//
//    for (idx, word) in words.enumerated() {
//        if (idx + 1) % n == 1 {
//            round += 1
//            turn = 1
//        }
//
//        if word.count == 1 { return [turn, round] }
//
//        if usedWords[word] != nil { return [turn, round] }
//
//        if lastChar != "" && lastChar != String(word.first!) {
//            return [turn, round]
//        }
//
//        usedWords[word] = 1
//        lastChar = String(word.last!)
//        turn += 1
//    }
//
//    return [0,0]
//}
