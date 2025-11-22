//
//  MockMixUpService.swift
//  Melon_iOS
//
//  Created by 조영서 on 11/17/25.
//

import Foundation

final class MockMixUpService {
    func fetchSongs() async throws -> [MixUpDTO] {
        return Self.mockData
    }
}

extension MockMixUpService {
    static let mockData: [MixUpDTO] = [
        MixUpDTO(
            id: 1,
            title: "Ditto",
            artistName: "NewJeans",
            playCount: 1200000,
            country: "KR",
            imageUrl: "https://image.bugsm.co.kr/album/images/500/40824/4082425.jpg"
        ),
        MixUpDTO(
            id: 2,
            title: "Love Dive",
            artistName: "IVE",
            playCount: 950000,
            country: "KR",
            imageUrl: "https://image.bugsm.co.kr/album/images/500/40737/4073710.jpg"
        ),
        MixUpDTO(
            id: 3,
            title: "Seven",
            artistName: "정국",
            playCount: 1100000,
            country: "KR",
            imageUrl: "https://image.bugsm.co.kr/album/images/350/40889/4088913.jpg"
        ),
        MixUpDTO(
            id: 4,
            title: "Hype Boy",
            artistName: "NewJeans",
            playCount: 2000000,
            country: "KR",
            imageUrl: "https://image.bugsm.co.kr/album/images/500/40780/4078016.jpg"
        ),
        MixUpDTO(
            id: 5,
            title: "Super Shy",
            artistName: "NewJeans",
            playCount: 1300000,
            country: "KR",
            imageUrl: "https://image.bugsm.co.kr/album/images/500/40885/4088574.jpg"
        ),
        MixUpDTO(
            id: 6,
            title: "I AM",
            artistName: "IVE",
            playCount: 1600000,
            country: "KR",
            imageUrl: "https://image.bugsm.co.kr/album/images/500/40849/4084947.jpg"
        ),
        MixUpDTO(
            id: 7,
            title: "ANTIFRAGILE",
            artistName: "LE SSERAFIM",
            playCount: 1750000,
            country: "KR",
            imageUrl: "https://image.bugsm.co.kr/album/images/500/40807/4080706.jpg"
        )
    ]
}
