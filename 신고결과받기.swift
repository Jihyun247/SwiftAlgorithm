//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2022/08/24.
//

import Foundation

// 이용자의 ID가 담긴 문자열 배열 id_list
// 각 이용자가 신고한 이용자의 ID 정보가 담긴 문자열 배열 report
// 정지 기준이 되는 신고 횟수 k

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {

  var reportUser = [String : [String]]()
  var reportedUser = [String : Int]()

  for content in Set(report) {
    let splitedContent = content.split(separator: " ").map { String($0) }
    reportUser[splitedContent[0]] = (reportUser[splitedContent[0]] ?? []) + [splitedContent[1]]
    reportedUser[splitedContent[1]] = (reportedUser[splitedContent[1]] ?? 0) + 1
  }

  return id_list.map { id in
    return (reportUser[id] ?? []).reduce(0) {
      $0 + ((reportedUser[$1] ?? 0) >= k ? 1 : 0)
    }
  }
}

print(solution(["muzi", "frodo", "apeach", "neo"], ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"], 2))




