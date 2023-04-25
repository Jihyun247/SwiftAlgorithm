//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2023/04/24.
//

import Foundation

//func solution(A: Int, P: Int) -> Int {
//    var D: [Int] = [A]
//    var answer = 0
//    func DFS(newA: Int) {
//        if D.contains(newA) {
//            answer = D.firstIndex(of: newA) ?? 0
//            return
//        }
//        D.append(newA)
//        DFS(newA: calculate(num: newA))
//    }
//
//    func calculate(num: Int) -> Int {
//
//        var array = Array(String(num))
//        var IntArray: [Double] = []
//
//        IntArray = array.map { pow(Double(String($0))! , Double(P)) }
//        return Int(IntArray.reduce(0, +))
//    }
//
//    DFS(newA: calculate(num: A))
//
//    return answer
//}
//
//print(solution(A: 57, P: 2))


var splited = readLine()?.components(separatedBy: " ").compactMap { Int($0) }

var D: [Int] = [splited![0]]
let P = splited![1]
var answer = 0
func DFS(newA: Int) {
    if D.contains(newA) {
        answer = D.firstIndex(of: newA) ?? 0
        return
    }
    D.append(newA)
    DFS(newA: calculate(num: newA))
}

func calculate(num: Int) -> Int {

    let array = Array(String(num))
    var IntArray: [Double] = []

    IntArray = array.map { pow(Double(String($0))! , Double(P)) }
    return Int(IntArray.reduce(0, +))
}

//DFS(newA: calculate(num: splited![0]))

//print(answer)
