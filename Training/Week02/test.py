def solution(s):
    answer = 0
    
    for i in range(len(s)//2+1):
        compressed_string = ""
        for j in range(len(s)//(i+1) + 1):
            compare_string = s[j:j+i]
            print(compare_string)
    
    if answer == 0 or compressed_string < answer:
        answer = compressed_string
        

    return answer

solution("aabbaccc")