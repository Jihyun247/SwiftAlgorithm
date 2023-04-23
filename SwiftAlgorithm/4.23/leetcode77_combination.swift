//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2023/04/23.
//

import Foundation

class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var result = [[Int]]()
        let givenArray = Array<Int>(1...n)

        func combination(array: [Int], start: Int) {
            print(array)
            if array.count == k {
                result.append(array)
                return
            }

            for i in start ..< givenArray.count {
                combination(array: array + [givenArray[i]], start: i+1)
            }
        }

        combination(array: [], start: 0)

        return result
    }
}

//var s = Solution()
//s.combine(4, 2)

