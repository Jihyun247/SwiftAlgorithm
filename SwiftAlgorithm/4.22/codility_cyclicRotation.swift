//
//  codility_cyclicRotation.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2023/04/22.
//

import Foundation

public func solution(_ A : inout [Int], _ K : Int) -> [Int] {

    func rotate(_ k: Int) {
        for _ in 0..<k {
            let popped = A.removeLast()
            A.insert(popped, at: 0)
        }
    }

    if A.count > K {
        rotate(K)
    } else if A.count == 0 {
        return A
    } else {
        rotate(K % A.count)
    }

    return A
}
