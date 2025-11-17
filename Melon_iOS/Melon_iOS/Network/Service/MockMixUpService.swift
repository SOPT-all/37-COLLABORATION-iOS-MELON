//
//  MockMixUpService.swift
//  Melon_iOS
//
//  Created by 조영서 on 11/17/25.
//

import Foundation

final class MockMixUpService {
    func fetchSongs() async throws -> [MixUpSongResponseDTO] {
        return Self.mockData
    }
}

extension MockMixUpService {
    static let mockData: [MixUpSongResponseDTO] = [
        MixUpSongResponseDTO(
            title: "Ditto",
            artist: "NewJeans",
            imageUrl: "https://image.bugsm.co.kr/album/images/500/40824/4082425.jpg"
        ),
        MixUpSongResponseDTO(
            title: "Love Dive",
            artist: "IVE",
            imageUrl: "https://image.bugsm.co.kr/album/images/500/40737/4073710.jpg"
        ),
        MixUpSongResponseDTO(
            title: "Seven",
            artist: "정국",
            imageUrl: "https://image.bugsm.co.kr/album/images/350/40889/4088913.jpg"
        ),
        MixUpSongResponseDTO(
            title: "Hype Boy",
            artist: "NewJeans",
            imageUrl: "https://image.bugsm.co.kr/album/images/500/40780/4078016.jpg"
        ),
        MixUpSongResponseDTO(
            title: "Super Shy",
            artist: "NewJeans",
            imageUrl: "https://image.bugsm.co.kr/album/images/500/40885/4088574.jpg"
        ),
        MixUpSongResponseDTO(
            title: "I AM",
            artist: "IVE",
            imageUrl: "https://image.bugsm.co.kr/album/images/500/40849/4084947.jpg"
        ),
        MixUpSongResponseDTO(
            title: "ANTIFRAGILE",
            artist: "LE SSERAFIM",
            imageUrl: "https://image.bugsm.co.kr/album/images/500/40807/4080706.jpg"
        )
    ]
}
