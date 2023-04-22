//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2023/04/17.
//

import Foundation

typealias bookInfo = (height: Int, width: Int)

// n개 조합
func toCombination(books: [bookInfo], n: Int) -> [[bookInfo]] {

    var result: [[bookInfo]] = []

    func dfs(idx: Int, combi: [(height: Int, width: Int)]) {

        if combi.count == n {
            result.append(combi)
            return
        }

        for i in idx ..< books.count {
            dfs(idx: i + 1, combi: combi + [books[i]])
        }
    }

    dfs(idx: 0, combi: [])

    return result
}

func solution(_ height: [Int], _ width: [Int]) -> Int64 {

    if height.count == 0 { return 0 }

    var books: [(height: Int, width: Int)] = []

    for (h, w) in zip(height, width) {
        books.append((height: h, width: w))
    }

    books = books.sorted(by: >)

    var combinations: [[bookInfo]] = []
    for i in 1...books.count {
        combinations += toCombination(books: books, n: i)
    }

    //let oneMax = books.map { Int64($0.width) * Int64($0.height) }.max()! // 한개짜리 max
    var oneArea: [Int64] = []
    for book in books {
        oneArea.append(Int64(book.width) * Int64(book.height))
    }
    var max = oneArea.max()!

    outer: for combination in combinations {
        var sumWidth = 0
        var minHeight = 400000//combination.min(by: {$0.height < $1.height})

        for b in combination {
            if b.height < minHeight { minHeight = b.height }
            sumWidth += b.width
        }

        if Int64(sumWidth) * Int64(minHeight) > max {
            max = Int64(sumWidth) * Int64(minHeight)
        }
    }

    return max
}

print(solution([], []))
// 288
