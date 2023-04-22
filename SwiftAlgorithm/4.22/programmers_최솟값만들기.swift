//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2023/04/22.
//

import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int
{
    var ans = 0

    if A.count == 0 { return ans }
    zip(A, B)
    let a = A.sorted()
    let b = B.sorted(by: >)

    for i in 0 ..< A.count {
        ans += a[i] * b[i]
    }

    return ans
}

/*
 for 문을 zip으로 돌렸더니 효율성에서 깎였음 zip은 한번더 n이 생기나보다

 a,b 를 변수로 지정해주지 않고 zip 내부에서 sorting 해주었더니 case16에서 런타임 에러가 났다.
 */
