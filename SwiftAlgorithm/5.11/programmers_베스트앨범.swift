//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2023/05/13.
//

import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {

    var dictionary = [String: [(play: Int, index: Int)]]()
    var answer = [Int]()

    for i in 0 ..< genres.count {
        dictionary[genres[i], default: []].append( (plays[i], i) )
    }

    var tuple = dictionary.sorted {
        $0.value.reduce(0, { $0 + $1.play }) > $1.value.reduce(0, { $0 + $1.play })
    }

    for g in tuple {

        if g.value.count == 1 {
            answer.append(g.value.first!.index)
        } else {
            // Play 높은 순으로 정렬하되, play가 같다면 index 낮은 순으로 정렬
            let p = g.value.sorted(by: { $0.play > $1.play || $0.index < $1.index})[0...1]
            p.forEach { answer.append($0.index) }
        }
    }

    return answer
}

//print(solution(["classic", "pop", "classic", "classic", "pop"], [500, 600, 150, 800, 2500]))
