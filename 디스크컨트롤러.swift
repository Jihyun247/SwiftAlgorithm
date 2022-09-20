//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2022/09/18.
//
import Foundation

func solution(_ jobs:[[Int]]) -> Int {

    var currentTime = 0 // 현재 시간
    var total = 0 // 모든 job의 총 대기 시간

    // 요청시간이 같다면 소요시간이 적은 것 순으로 정렬 , 요청시간이 다르다면, 요청시간이 작은 것 순으로 정렬
    var sortedJobs = jobs.sorted { $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] < $1[0] }
    // 소요시간 순으로 정렬되어 있는 배열을 다시 한번 요청 순으로 정렬
    sortedJobs = sortedJobs.sorted { $0[1] == $1[1] ? $0[0] < $1[0] : $0[1] < $1[1] }

    while sortedJobs.count > 0 {
        for i in 0..<sortedJobs.count {
            if sortedJobs[i][0] <= currentTime {
                currentTime += sortedJobs[i][1]
                total += currentTime - sortedJobs[i][0]
                sortedJobs.remove(at: i)
                print(sortedJobs.count)
                break
            }
            // 이 조건문 왜 들어가는지 이해 못함
            if i == sortedJobs.count - 1 {
                currentTime += 1}
        }
    }

    return total / jobs.count
}
