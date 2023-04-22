//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2023/04/23.
//

import Foundation

//func solution(_ s:String) -> [Int] {
//
//    var transCnt = 0
//    var removedZeroCnt = 0
//
//    var array = Array(s).map { Int(String($0))! }
//
//    func binaryTranslation(_ arr: inout [Int]) {
//        transCnt += 1
//
//        if arr.contains(0) {
//            let cnt = arr.count
//            arr = arr.filter { $0 == 1 }
//            removedZeroCnt += (cnt - arr.count)
//        }
//
//        if arr == [1] { return }
//
//        var oneCnt = arr.count
//        var newArr = [Int]()
//        while oneCnt != 0 {
//            newArr.append(oneCnt % 2)
//            oneCnt /= 2
//        }
//        newArr = newArr.reversed()
//
//        binaryTranslation(&newArr)
//    }
//
//    binaryTranslation(&array)
//
//    return [transCnt, removedZeroCnt]
//}

func solution(_ s:String) -> [Int] {

    var transCnt = 0
    var removedZeroCnt = 0
    var copiedS = s

    while copiedS != "1" {
        removedZeroCnt += copiedS.replacingOccurrences(of: "1", with: "").count
        copiedS = String(copiedS.replacingOccurrences(of: "0", with: "").count, radix: 2)
        transCnt += 1
    }

    return [transCnt, removedZeroCnt]
}

//print(solution("110010101001"))
