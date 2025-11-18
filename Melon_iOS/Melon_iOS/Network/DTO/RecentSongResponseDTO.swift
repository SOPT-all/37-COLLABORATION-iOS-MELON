//
//  RecentSongDTO.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/18/25.
//

import UIKit

struct RecentSongResponseDTO: Decodable {
  let title: String
  let artist: String
  let imageUrl: String?
}
