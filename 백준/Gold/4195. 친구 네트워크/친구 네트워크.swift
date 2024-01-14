import Foundation

let caseCnt = Int(readLine()!)!
var network: [[Int]] = []
for _ in 0..<caseCnt {
    let relationshipCnt = Int(readLine()!)!
    var parents = [String: String]()
    var count = [String: Int]()
    
    for _ in 0..<relationshipCnt {
        var names = readLine()!.split(separator: " ").map { String($0) }
        let ln = names[0]
        let rn = names[1]
        
        input(name: ln)
        input(name: rn)
        union(ln, rn)
        print(count[find(ln)]!)
    }
    
    func input(name: String) {
        if !parents.keys.contains(name) {
            parents[name] = name
            count[name] = 1
        }
    }

    func find(_ name: String) -> String {
        if name == parents[name]! { // 자식X
            return name
        } else {
            let parent = find(parents[name]!) // 자식O -> 재귀로 부모찾기
            parents[name] = parent
            return parents[name]!
        }
    }

    func union(_ ln: String, _ rn: String) {
        let parentLn = find(ln)
        let parentRn = find(rn)
        if parentLn != parentRn {
            parents[parentRn] = parentLn // 왼쪽을 무조건 루트로
            count[parentLn]! += count[parentRn]! // 개수도 왼쪽에 몰빵
        }
    }
}