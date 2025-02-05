// 알고리즘 공부,,
// 입출력 예시
// user_id:   ["frodo", "fradi", "crodo", "abc123", "frodoc"]
// banned_id: ["fr*d*", "abc1**"]

// ---------> result: 2

import Foundation

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
  
  var dict: [Int: [String]] = [:]
  
  for i in 0..<banned_id.count {
    dict[i] = []
    for j in 0..<user_id.count {
      if isMatchingPattern(text: user_id[j], pattern: banned_id[i]) {
        dict[i]?.append(user_id[j])
      }
    }
  }
  
  print(dict)
  
  return 0
}

func isMatchingPattern(text: String, pattern: String) -> Bool {
  let textArr = Array(text)
  let patternArr = Array(pattern)
  
  guard textArr.count == patternArr.count else { return false }
  
  for i in 0..<textArr.count {
    if patternArr[i] == "*" { continue }
    if textArr[i] != patternArr[i] { return false }
  }
  
  return true
}

//func DFS(_ graph: [[String]]) {
//  var visitedQueue: [String] = []
//  var needVisitStack: [String] = [graph[0][0]]
//  
//  while needVisitStack.isEmpty {
//    
//  }
//  
//}

let resul = solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["*rodo", "*rodo", "******"])
print(resul)

// *rodo -> frodo, crodo
// *rodo -> frodo, crodo
// ****** -> abc123, frodoc

// frodo, corodo, abc123
// frodo, crodo, forodoc
// DFS

