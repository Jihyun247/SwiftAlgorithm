var text = Array(readLine()!)
var word = Array(readLine()!)

var startIdx = 0
let wordCount = word.count
var count = 0

while startIdx + wordCount <= text.count {
    
    if word.elementsEqual(text[startIdx..<startIdx + wordCount]) {
        
        count += 1
        // 같으면 시작점을 시작점 + word.count 으로변경
        startIdx += wordCount
        
    } else {
        
        // 안같으면 시작점을 시작점 + 1
        startIdx += 1
    }
}

print(count)