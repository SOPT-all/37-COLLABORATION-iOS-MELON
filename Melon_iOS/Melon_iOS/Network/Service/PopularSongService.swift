//
//  PopularSongService.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/18/25.
//

import Foundation

final class PopularSongService { }

extension PopularSongService {
  static let mockData: [PopularSongDTO] = [
    PopularSongDTO(title: "XOXZ", artist: "IVE (아이브)", source: "멜론DJ's Pick", image: .imgHome1),
    PopularSongDTO(title: "Blue Valentine", artist: "NMIXX", source: "검색 트렌드", image: .imgHome2),
    PopularSongDTO(title: "FOCUS", artist: "Hearts2Hearts(하츠투하츠)", source: "HOT100 7위", image: .imgHome3),
    PopularSongDTO(title: "XOXZ", artist: "IVE (아이브)", source: "멜론DJ's Pick", image: .imgHome4),
    PopularSongDTO(title: "Blue Valentine", artist: "NMIXX", source: "검색 트렌드", image: .imgHome5),
    PopularSongDTO(title: "FOCUS", artist: "Hearts2Hearts(하츠투하츠)", source: "HOT100 7위", image: .imgHome6),
  ]
}
