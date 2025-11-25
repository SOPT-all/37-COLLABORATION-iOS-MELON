//
//  MockForYouService.swift
//  Melon_iOS
//
//  Created by mandoo on 11/25/25.
//

import Foundation

final class MockCustomSongService {}

extension MockCustomSongService {
    static let mockData: [CustomSongDTO] = [
        CustomSongDTO(id: 1, title: "Ditto", artistName: "NewJeans", playCount: 1200000, country: "KR",
                      imageUrl: "https://image.bugsm.co.kr/album/images/500/40824/4082425.jpg"),
        CustomSongDTO(id: 2, title: "Love Dive", artistName: "IVE", playCount: 950000, country: "KR",
                      imageUrl: "https://image.bugsm.co.kr/album/images/500/40737/4073710.jpg"),
        CustomSongDTO(id: 3, title: "Seven", artistName: "정국", playCount: 1100000, country: "KR",
                      imageUrl: "https://image.bugsm.co.kr/album/images/350/40889/4088913.jpg"),
        CustomSongDTO(id: 4, title: "Hype Boy", artistName: "NewJeans", playCount: 2000000, country: "KR",
                      imageUrl: "https://image.bugsm.co.kr/album/images/500/40780/4078016.jpg"),
        CustomSongDTO(id: 5, title: "Super Shy", artistName: "NewJeans", playCount: 1300000, country: "KR",
                      imageUrl: "https://image.bugsm.co.kr/album/images/500/40885/4088574.jpg"),
        CustomSongDTO(id: 6, title: "I AM", artistName: "IVE", playCount: 1600000, country: "KR",
                      imageUrl: "https://image.bugsm.co.kr/album/images/500/40849/4084947.jpg"),
        CustomSongDTO(id: 7, title: "ANTIFRAGILE", artistName: "LE SSERAFIM", playCount: 1750000, country: "KR",
                      imageUrl: "https://image.bugsm.co.kr/album/images/500/40807/4080706.jpg"),
        CustomSongDTO(id: 8, title: "Ditto", artistName: "NewJeans", playCount: 1200000, country: "KR",
                      imageUrl: "https://image.bugsm.co.kr/album/images/500/40824/4082425.jpg"),
        CustomSongDTO(id: 9, title: "Love Dive", artistName: "IVE", playCount: 950000, country: "KR",
                      imageUrl: "https://image.bugsm.co.kr/album/images/500/40737/4073710.jpg"),
        CustomSongDTO(id: 10, title: "Seven", artistName: "정국", playCount: 1100000, country: "KR",
                      imageUrl: "https://image.bugsm.co.kr/album/images/350/40889/4088913.jpg"),
        CustomSongDTO(id: 11, title: "Hype Boy", artistName: "NewJeans", playCount: 2000000, country: "KR",
                      imageUrl: "https://image.bugsm.co.kr/album/images/500/40780/4078016.jpg"),
        CustomSongDTO(id: 12, title: "Super Shy", artistName: "NewJeans", playCount: 1300000, country: "KR",
                      imageUrl: "https://image.bugsm.co.kr/album/images/500/40885/4088574.jpg"),
    ]
}

private let mockAlbumTrack: [AlbumTrackDTO] = [
    AlbumTrackDTO(id: 101, title: "HOME.", artistName: "Armani White", playCount: 50000, country: "USA", imgUrl: "img_fan_2"),
    AlbumTrackDTO(id: 102, title: "GHOST.", artistName: "Armani White", playCount: 65000, country: "USA", imgUrl: "img_fan_2"),
    AlbumTrackDTO(id: 103, title: "CUT THE LIGHTS.", artistName: "Armani White", playCount: 72000, country: "USA", imgUrl: "img_fan_2"),
    AlbumTrackDTO(id: 104, title: "BIGGER PERSON.", artistName: "Armani White", playCount: 72000, country: "USA", imgUrl: "img_fan_2")
]

final class MockLatestAlbumService {}

extension MockLatestAlbumService {
    static let mockData: [LatestAlbumDTO] = [
        LatestAlbumDTO(
            id: 201,
            title: "THERE’S A GHOST IN MY HOUSE.",
            imgUrl: "img_fan_1",
            artistName: "Various Artists",
            coverImgUrl: "Img_album_background",
            albumTracks: mockAlbumTrack
        )
    ]
}
