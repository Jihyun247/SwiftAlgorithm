//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2023/04/17.
//

import Foundation

// MARK: - DONE

func solution(_ s:String) -> String {

    let letters = Array(s)
    var isBeforeBlank = true
    var result: String = ""

    for letter in letters {
        result += (isBeforeBlank ? letter.uppercased() : letter.lowercased())
        isBeforeBlank = (letter == " ")
    }

    return result
}

//print(solution("pe4ople   unFollowed me"))

// 알게된 점 -> split, allsatisfy, Array()변환 을 하면 각 원소가 Character로 변하게 된다
// 한 원소가 한문자가 아니라 여러문자여도 캐릭터일까? 아닐듯
