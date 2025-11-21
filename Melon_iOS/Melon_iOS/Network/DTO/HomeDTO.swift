//
//  HomeDTO.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/19/25.
//

import UIKit

struct PopularSongDTO {
  let title: String?
  let artist: String?
  let imageUrl: String?
  let category: String?
  
  init(title: String = "", artist: String = "", imageUrl: String? = "", category: String = "") {
    self.title = title
    self.artist = artist
    self.imageUrl = imageUrl
    self.category = category
  }
}

struct LatestSongDTO {
  let title: String?
  let artist: String?
  let imageUrl: String?
  
  init(title: String? = "", artist: String? = "", imageUrl: String? = "") {
    self.title = title
    self.artist = artist
    self.imageUrl = imageUrl
  }
}

struct ChartSongDTO {
  let title: String?
  let artist: String?
  let imageUrl: String?
  
  init(title: String = "", artist: String? = "", imageUrl: String? = "") {
    self.title = title
    self.artist = artist
    self.imageUrl = imageUrl
  }
}

struct PreferencedSongDTO {
  let title: String?
  let artist: String?
  let imageUrl: String?
  
  init(title: String? = "", artist: String? = "", imageUrl: String? = "") {
    self.title = title
    self.artist = artist
    self.imageUrl = imageUrl
  }
}

struct PersonalizedDTO {
  let title: String
  let image: UIImage
}

struct BannerDTO {
  let title: String
  let subtitle: String
  let promotion: String
  let capsuleTitle: String
  let image: UIImage?
  let backgroundColor: UIColor
}
