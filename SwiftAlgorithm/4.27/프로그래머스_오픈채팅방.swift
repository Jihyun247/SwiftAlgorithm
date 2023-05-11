//
//  프로그래머스_오픈채팅방.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2023/04/28.
//

import Foundation

func solution(_ record:[String]) -> [String] {

    var result = [String]()
    var nickname = [String: String]() // id nickname

    for r in record {
        let splited = r.components(separatedBy: " ")
        if splited[0] != "Leave" {
            nickname[splited[1]] = splited[2]
        }
    }

    for r in record {
        let splited = r.components(separatedBy: " ")
        if splited[0] == "Enter" {
            result.append("\(nickname[splited[1]]!)님이 들어왔습니다.")

        } else if splited[0] == "Leave" {
            result.append("\(nickname[splited[1]]!)님이 나갔습니다.")

        }
    }
    return result
}

//print(solution(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"]))

