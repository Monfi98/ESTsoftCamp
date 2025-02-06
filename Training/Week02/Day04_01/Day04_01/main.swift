import Foundation

func solution(_ s:String) -> Int {
  let arr = Array(s)
  
  
  return 0
}

solution("aabbaccc")

// "aabbaccc"  7
// 1개 단위로 자른다 a/a/b/b/ ...
// 2개 단위로 자른다 aa/bb/ac/cc
// 3개 단위로 자른다 aab/bac/cc
// 4개 단위로 자른다 aabb/accc
// 5개 단위로 자른다 -> 불가

// "ababcdcdababcdcd"  9
// 2 -> 2ab2cd2ab2cd
// 3 -> aba, bab, bcd, cd


// "abcabcdede"  8
// a, b, c
// ab, bc, ca, ab,

// "abcabcabcabcdededededede"  14
// "xababcdcdababcdcd"  17
