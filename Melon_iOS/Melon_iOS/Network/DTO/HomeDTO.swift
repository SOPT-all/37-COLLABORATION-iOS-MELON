//
//  HomeDTO.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/19/25.
//

import Foundation

struct HomeDTO {
  
  let title: String?
  let artist: String?
  let imageUrl: String?
  let category: String?
  
  init(title: String, artist: String, imageUrl: String?, category: String) {
    self.title = title
    self.artist = artist
    self.imageUrl = imageUrl
    self.category = category
  }
  
  init(title: String, artist: String, imageUrl: String?) {
    self.title = title
    self.artist = artist
    self.imageUrl = imageUrl
    self.category = ""
  }
  
}
