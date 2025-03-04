//
//  DataManager.swift
//  MovieReview
//
//  Created by 신승재 on 3/3/25.
//

import Foundation

final class DataManager {
  static let shared = DataManager()
  
  private init() {}
  
  func loadMovies() -> [Movie] {
    guard let url = Bundle.main.url(forResource: "MovieData", withExtension: "json") else {
      print("JSON 파일을 찾을 수 없습니다.")
      return []
    }
    
    do {
      let data = try Data(contentsOf: url)
      let decoder = JSONDecoder()
      let datas = try decoder.decode([Movie].self, from: data)
      print("데이터 로드 성공: \(datas.count)개")
      return datas
    } catch {
      print("JSON 디코딩 오류:", error)
      return []
    }
  }
}
