//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 김지현 on 2023/05/26.
//

import Foundation

let n = Int(readLine()!)!
var triangle = [[Int]]()
//for _ in 0 ..< n {
//    let node = readLine()!.components(separatedBy: " ").map { Int($0)! }
//    triangle.append(node)
//}
//
//for i in 1 ..< n {
//
//    for j in 0 ..< i + 1 {
//
//        if j == 0 {
//            triangle[i][j] += triangle[i-1][j]
//        } else if j == i {
//            triangle[i][j] += triangle[i-1][j-1]
//        } else {
//            triangle[i][j] += max(triangle[i-1][j], triangle[i-1][j-1])
//        }
//    }
//}
//
//print(triangle[n-1].max()!)
