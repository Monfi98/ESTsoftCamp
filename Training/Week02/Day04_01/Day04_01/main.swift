import Foundation

func solution(_ s:String) -> Int {
  let arr = Array(s)
  
  
  var result = 0
  for i in 0..<arr.count/8 {
    var compressed: [String] = []
    
    for j in 0..<arr.count/i + 1 {
      var compareString: [String] = arr[j...j+i]
      
    }
    if result == 0 || result > compressed.count {
      result = compressed.count
    }
  }
  
  return result
}

solution("aabbaccc")

// "aabbaccc"  7
// 1개 단위로 자른다 a/a/b/b/ ...
// 2개 단위로 자른다 aa/bb/ac/cc
// 3개 단위로 자른다 aab/bac/cc
// 4개 단위로 자른다 aabb/accc
// 5개 단위로 자른다 -> 불가

// "ababcdc dabab cdcd"  9
// 2 -> ab / ab / cd ...
// 3 ->
// 4 ->
// 5 ->
// 6 ->
// 7 ->

// "abcabcdede"  8
// a, b, c
// ab, bc, ca, ab,

// "abcabcabcabcdededededede"  14
// "xababcdcdababcdcd"  17
