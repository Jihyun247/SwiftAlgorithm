let board = readLine()!.split(separator: " ").map { Int($0)! }
let N = board[0] // 세로
let M = board[1] // 가로
var answer: Int = 0

if N == 1 {
    answer = 1
} else if N == 2 {
    answer = min(4,(M-1)/2+1)
} else if M < 7 {
    answer = min(4,M)
} else {
    answer = M - 2
}
print(answer)