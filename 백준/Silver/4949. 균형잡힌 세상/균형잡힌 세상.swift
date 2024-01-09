import Foundation

while true {
    let str = readLine()!.map { String($0) }

    if str == ["."] {
        break
    } else {
        var onlyBracket = [String]()
        for i in str {
            if i == "[" || i == "]" || i == "(" || i == ")" { onlyBracket.append(i) }
        }

        if onlyBracket.count == 0 {
            print("yes")
        } else {
            var stack: [String] = [onlyBracket[0]]
            for i in 1..<onlyBracket.count {
                if stack.isEmpty {
                    stack.append(onlyBracket[i])
                } else {
                    let last = stack.last!
                    if onlyBracket[i] == "[" || onlyBracket[i] == "(" {
                        stack.append(onlyBracket[i])
                    } else if onlyBracket[i] == "]" {
                        if last == "[" { stack.popLast() } else { stack.append(onlyBracket[i]) }
                    } else if onlyBracket[i] == ")" {
                        if last == "(" { stack.popLast() } else { stack.append(onlyBracket[i]) }
                    }
                }
            }
            stack.isEmpty ? print("yes") : print("no")
        }
    }
}