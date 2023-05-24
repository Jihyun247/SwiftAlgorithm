//
//  programmers_보석쇼핑.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2023/05/17.
//

import Foundation

//func solution(_ gems:[String]) -> [Int] {
//
//    var typeArray = Array(Set(gems))
//    var shortest: [Int] = []
//    var cnt: Int = 100000
//
//    func findArrange(_ startIdx: Int) {
//
//        var visited = Array(
//            repeating: false,
//            count: typeArray.count)
//        var endIdx: Int = 0
//
//        for i in startIdx ..< gems.count {
//            let idx = typeArray.firstIndex(of: gems[i])!
//            visited[idx] = true
//
//            if i - startIdx + 1 > cnt { break }
//
//            if !visited.contains(false) {
//                endIdx = i
//                let newCnt = endIdx - startIdx + 1
//
//                if cnt > newCnt || (cnt == newCnt && shortest[0] > startIdx) {
//                    shortest = [startIdx+1, endIdx+1]
//                    cnt = newCnt
//                }
//
//                break
//            }
//        }
//    }
//
//    for i in 0 ... gems.count - typeArray.count {
//        findArrange(i)
//        if cnt == typeArray.count { break }
//    }
//
//    return shortest
//}

func solution(_ gems:[String]) -> [Int] {
    var startNum = 0
    var endNum = gems.count
    var l = 0
    var r = -1
    var gemsSetCount = Set(gems).count
    var gemsDic:[String:Int] = [:]
    var count = 0

    while l < gems.count && r < gems.count {
        count = gemsDic.count

        if count == gemsSetCount { // 범위 안에 모든 보석 종류가 있다면

            if (endNum - startNum) > (r - l) { // 범위 갱신
                startNum = l
                endNum = r
            }

            if l == r { break } // 최선의 범위이므로 바로 break

            if let value = gemsDic[gems[l]] { // 충분한 범위이므로 l 증가
                if (value - 1) == 0 {
                    gemsDic.removeValue(forKey: gems[l])
                }
                else {
                    gemsDic[gems[l]] = value - 1
                }
            }

            l += 1
        }
        else { // 종류가 충분하지 않으면 r 증가시킴
            r += 1
            if r < gems.count {
                gemsDic[gems[r], default: 0] += 1
            }
        }
    }
    return [startNum+1, endNum+1]
}
