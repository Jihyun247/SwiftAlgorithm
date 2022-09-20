//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2022/09/18.
//

import Foundation

func solution(_ numbers:String) -> Int {
    let numArr = numbers.map { String($0) }
    var result: [Int] = []

    for i in 1...numbers.count {
        let primeNums = permutation(numArr, i)
        result += primeNums
    }

    return result.count
}

func permutation(_ array: [String], _ targetNum: Int) -> [Int] {
    var result: [Int] = []
    var visited: [Bool] = Array(repeating: false, count: array.count)

    func permute(_ now: String) {
        if now.count == targetNum {
            let number = Int(now)!
            if !now.hasPrefix("0") && !result.contains(number) && isPrime(number) {
                result.append(number)
            }
            return
        }
        for i in 0..<array.count {
            if visited[i] { continue }
            visited[i] = true
            permute(now + array[i])
            visited[i] = false
        }
    }
    permute("")
    return result
}

func isPrime(_ num: Int) -> Bool {
    if(num < 4) { return num < 2 ? false : true }
    for i in 2...Int(sqrt(Double(num))) {
        if(num % i == 0) { return false }
    }
    return true
}
