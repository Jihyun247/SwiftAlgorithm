//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2023/04/25.
//

import Foundation

var testCaseCnt = Int(readLine()!)!

//for _ in 1...testCaseCnt {
//
//    var answerCnt = 0
//    let permuCnt = Int(readLine()!)!
//    let splited = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
//
//    var dictionary = [Int: Int]()
//    for i in 1...permuCnt {
//        dictionary[i] = splited[i-1]
//    }
//
//    var visited = Array(repeating: false, count: permuCnt)
//    var stack: [Int] = []
//
//
//    func DFS(_ key: Int) {
//        stack.append(key)
//        visited[key-1] = true
//        while !stack.isEmpty {
//            let curKey = stack.removeFirst()
//            if visited[dictionary[curKey]!-1] {
//                answerCnt += 1
//                return
//            }
//
//            stack.append(dictionary[curKey]!)
//            visited[dictionary[curKey]! - 1] = true
//        }
//    }
//    for i in 1...permuCnt {
//        if !visited.contains(false) { break }
//        if !visited[i - 1] { DFS(i) }
//    }
//
//    print(answerCnt)
//}

