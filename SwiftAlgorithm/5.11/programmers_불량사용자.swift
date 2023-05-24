//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2023/05/13.
//

import Foundation

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {

    var possibleIds: [[String]] = Array(repeating: [], count: banned_id.count)

    for (idx, b) in banned_id.enumerated() {
        for u in user_id {
            
            if u.count == b.count {
                let ba = Array(b)
                let ua = Array(u)

                var possible = true
                for i in 0 ..< ba.count {
                    if ba[i] != "*" && ba[i] != ua[i] {
                        possible = false
                        break
                    }
                }

                if possible { possibleIds[idx].append(u) }
            }
        }
    }

    var sets = [Set<String>]()

    func dfs(_ start: Int, _ arr: [String]) {

        if arr.count == banned_id.count {
            if !sets.contains(Set(arr)) { sets.append(Set(arr)) }
            return
        }

        for i in possibleIds[start] {
            if !arr.contains(i) {
                var newArr = arr + [i]
                dfs(start + 1, newArr)
            }
        }
    }

    dfs(0, [])

    return sets.count
}

//print(solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["fr*d*", "*rodo", "******", "******"]))
