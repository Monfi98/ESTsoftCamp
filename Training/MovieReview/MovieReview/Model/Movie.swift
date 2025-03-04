//
//  Movie.swift
//  MovieReview
//
//  Created by 신승재 on 3/3/25.
//

import Foundation


struct Movie: Codable {
  let id: String
  let type: String
  let title: String
  let rank: Int
  let releaseDate: String
  let imageName: String
  let comments: [Comment]
  
  enum CodingKeys: String, CodingKey {
    case id, type, title, comments, rank
    case releaseDate = "release_date"
    case imageName = "image_name"
  }
}

struct Comment: Codable {
  let date: String
  var content: String
}
