//
//  ForYouDTO.swift
//  Melon_iOS
//
//  Created by mandoo on 11/24/25.
//

import Foundation

struct CustomSongDTO: Decodable {
    let id: Int
    let title: String
    let artistName: String
    let playCount: Int
    let country: String
    let imageUrl: String?
}

struct AlbumTrackDTO: Decodable {
    let id: Int
    let title: String
    let artistName: String
    let playCount: Int
    let country: String
    let imageUrl: String?
}

struct AlbumDTO: Decodable {
    let id: Int
    let title: String
    let imageUrl: String?
    let artistName: String
    let coverImageUrl: String?
    let musicList: [AlbumTrackDTO]
}
