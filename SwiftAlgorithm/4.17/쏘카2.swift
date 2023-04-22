//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2023/04/18.
//

import Foundation

typealias rectangle = (leftDown: (x1: Int, y1: Int), rightUp: (x2: Int, y2: Int), idx: Int)

func sortToDown(_ rectangles: [rectangle]) -> [rectangle] {

    // 밑으로 내리기
    var sortedRectangles = rectangles.sorted(by: { $0.leftDown.y1 < $1.leftDown.y1 })

    //var maxXarray = Array(repeating: 0, count: ) 이거 필요할것같아 시간 남으면 하자
    for i in 0 ..< sortedRectangles.count {

        if sortedRectangles[i].leftDown.y1 != 0 {
            var now = sortedRectangles[i]

            // 밑에 있는 것 찾기
            var underRecs: [rectangle] = []

            for j in 0 ..< sortedRectangles.count {
                var comRec = sortedRectangles[sortedRectangles.count - j - 1] // y 큰 것 부터

                // now 보다 밑에있다면
                if ((comRec.leftDown.x1 <= now.leftDown.x1 && comRec.rightUp.x2 >= now.leftDown.x1) ||
                    comRec.leftDown.x1 >= now.leftDown.x1) &&
                    comRec.rightUp.y2 <= now.leftDown.y1 {

                    underRecs.append(comRec)
                }
            }

            if underRecs.isEmpty {

                sortedRectangles[i].rightUp.y2 -= sortedRectangles[i].leftDown.y1
                sortedRectangles[i].leftDown.y1 = 0

            } else {
                //print(sortedRectangles[i].idx, maxRec)
                let maxRec = underRecs.max(by: { $0.rightUp.y2 < $1.rightUp.y2 })?.rightUp.y2
                sortedRectangles[i].leftDown.y1 -= maxRec!
                sortedRectangles[i].rightUp.y2 -= maxRec!
            }
        }
    }

    return sortedRectangles
}

func sortToLeft(_ rectangles: [rectangle]) -> [rectangle] {

    // 왼쪽으로 붙이기
    var sortedRectangles = rectangles.sorted(by: { $0.leftDown.x1 < $1.leftDown.x1 })

    //var maxXarray = Array(repeating: 0, count: ) 이거 필요할것같아 시간 남으면 하자
    for i in 0 ..< sortedRectangles.count {

        if sortedRectangles[i].leftDown.x1 != 0 {
            var now = sortedRectangles[i]

            // 왼쪽에 있는 것 찾기
            var underRecs: [rectangle] = []

            for j in 0 ..< sortedRectangles.count {
                var comRec = sortedRectangles[sortedRectangles.count - j - 1] // x 큰 것 부터

                // now 보다 왼쪽에있다면
//                if comRec.leftDown.y1 <= now.leftDown.y1 &&
//                    comRec.rightUp.y2 >= now.rightUp.y2 &&
//                    comRec.rightUp.x2 < now.leftDown.x1 {
//                    //y가 x로 x가 y로
//                    underRecs.append(comRec)
//                }

                if ((comRec.leftDown.y1 <= now.leftDown.y1 && comRec.rightUp.y2 >= now.leftDown.y1) ||
                    comRec.leftDown.y1 >= now.leftDown.y1) &&
                    comRec.rightUp.x2 <= now.leftDown.x1 {

                    underRecs.append(comRec)
                }
            }

            if underRecs.isEmpty {

                sortedRectangles[i].rightUp.x2 -= sortedRectangles[i].leftDown.x1
                sortedRectangles[i].leftDown.x1 = 0

            } else {

                let maxRec = underRecs.max(by: { $0.rightUp.x2 < $1.rightUp.x2 })?.rightUp.x2
                sortedRectangles[i].leftDown.x1 -= maxRec!
                sortedRectangles[i].rightUp.x2 -= maxRec!
            }
        }
    }

    return sortedRectangles
}

func solution(_ rectangles: [[Int]]) -> [String] {

    var result: [String] = []
    var sortedRectangles: [rectangle] = []
    for (i, r) in rectangles.enumerated() {
        sortedRectangles.append(
            (
                leftDown: (x1: r[0], y1: r[1]),
                rightUp: (x2: r[2], y2: r[3]),
                idx: i
            )
        )
    }

    sortedRectangles = sortToDown(sortedRectangles)
    //sortedRectangles = sortToLeft(sortedRectangles)


    sortedRectangles = sortedRectangles.sorted(by: { $0.idx < $1.idx })
    for r in sortedRectangles {
        result.append(
            String(r.leftDown.x1) + " " + String(r.leftDown.y1) + " " +
            String(r.rightUp.x2) + " " + String(r.rightUp.y2)
        )
    }

    return result
}

//print(solution([[0,2,1,3], [1,2,2,5], [3,3,4,4], [4,1,6,3], [1,6,5,7], [5,5,7,6], [5,8,6,10]]))
// ["0 0 1 1", "1 0 2 3", "2 0 3 1", "3 0 5 2", "0 3 4 4", "2 2 4 3", "4 3 5 5"]
