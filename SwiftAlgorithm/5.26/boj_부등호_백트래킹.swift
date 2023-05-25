//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2023/05/26.
//

import Foundation

let n = Int(readLine()!)!
let ops = readLine()!.components(separatedBy: " ")
var nums = [Int](0...9)
var visited = Array(repeating: false, count: nums.count)
var max = String(Int.min)
var min = String(Int.max)


func track(_ now: [Int]) {

    if now.count == n + 1 {
        let s = now.map { String($0) }.joined(separator: "")
        if Int(max)! < Int(s)! { max = s }
        if Int(min)! > Int(s)! { min = s }
        return
    }

    for i in 0 ..< nums.count {
        if !visited[i] {
            visited[i] = true
            if now.count == 0 {
                track([nums[i]])
            } else {

                switch ops[now.count - 1] {
                case "<":
                    if now.last! < nums[i] { track(now + [nums[i]]) }
                case ">":
                    if now.last! > nums[i] { track(now + [nums[i]]) }
                default:
                    break
                }
            }
            visited[i] = false
        }
    }
}

//track([])
//
//print(max)
//print(min)

// 백트래킹 -> DFS를 이용하며 모든 경우의 수를 돌지 않고 재귀를 시작하기 전 조건을 두어 조건에 만족할 경우에만 depth를 들어간다
