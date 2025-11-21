//
//  HomeService.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/19/25.
//

final class MockMixUpService {
    func fetchSongs() async throws -> [MixUpResponseDTO] {
        return Self.mockData
    }
}

extension MockMixUpService {
    static let mockData: [MixUpResponseDTO] = [
        MixUpResponseDTO(
            title: "Ditto",
            artist: "NewJeans",
            imageUrl: "https://image.bugsm.co.kr/album/images/500/40824/4082425.jpg"
        ),
        MixUpResponseDTO(
            title: "Love Dive",
            artist: "IVE",
            imageUrl: "https://image.bugsm.co.kr/album/images/500/40737/4073710.jpg"
        ),
        MixUpResponseDTO(
            title: "Seven",
            artist: "정국",
            imageUrl: "https://image.bugsm.co.kr/album/images/350/40889/4088913.jpg"
        ),
        MixUpResponseDTO(
            title: "Hype Boy",
            artist: "NewJeans",
            imageUrl: "https://image.bugsm.co.kr/album/images/500/40780/4078016.jpg"
        ),
        MixUpResponseDTO(
            title: "Super Shy",
            artist: "NewJeans",
            imageUrl: "https://image.bugsm.co.kr/album/images/500/40885/4088574.jpg"
        ),
        MixUpResponseDTO(
            title: "I AM",
            artist: "IVE",
            imageUrl: "https://image.bugsm.co.kr/album/images/500/40849/4084947.jpg"
        ),
        MixUpResponseDTO(
            title: "ANTIFRAGILE",
            artist: "LE SSERAFIM",
            imageUrl: "https://image.bugsm.co.kr/album/images/500/40807/4080706.jpg"
        )
    ]
}
