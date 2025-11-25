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
    let imgUrl: String?
}

struct LatestAlbumDTO: Decodable {
    let id: Int
    let title: String
    let imgUrl: String?
    let artistName: String
    let coverImgUrl: String?
    let albumTracks: [AlbumTrackDTO]
}
