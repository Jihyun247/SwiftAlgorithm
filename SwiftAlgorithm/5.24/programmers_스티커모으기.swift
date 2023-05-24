//
//  programmers_스티커모으기.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2023/05/24.
//

import Foundation

func solution(_ sticker:[Int]) -> Int{

    let len = sticker.count

    if len <= 2 { return sticker.max()! }

    var dp1 = Array(repeating: 0, count: sticker.count)
    var dp2 = Array(repeating: 0, count: sticker.count)

    // 첫번째 스티커 뜯
    dp1[0] = sticker[0]
    dp1[1] = sticker[0]

    // 첫번째 스티커 뜻x
    dp2[0] = 0
    dp2[1] = sticker[1]

    for i in 2..<len {
        dp2[i] = max(dp2[i-2] + sticker[i], dp2[i-1])

        if i < len - 1 {
          dp1[i] = max(dp1[i-2] + sticker[i], dp1[i-1])
        }
    }

    return max(dp1.max()!, dp2.max()!)
}
