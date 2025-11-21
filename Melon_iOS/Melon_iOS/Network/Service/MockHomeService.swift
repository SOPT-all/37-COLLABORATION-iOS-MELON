//
//  HomeService.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/19/25.
//

import Foundation

final class MockPreferenceService {
  
  
}

final class MockPopularService {}

extension MockPopularService {
  static let mockData: [PopularSongDTO] = [
    PopularSongDTO(
      title: "XOXZ",
      artist: "IVE (아이브)",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/41260/4126044.jpg",
      category: "멜론DJ's Pick"),
    PopularSongDTO(
      title: "Blue Valentine",
      artist: "NMIXX",
      imageUrl: "https://image.bugsm.co.kr/album/images/130/41299/4129960.jpg?version=20251108012458",
      category: "검색 트렌드"),
    PopularSongDTO(
      title: "FOCUS",
      artist: "Hearts2Hearts(하츠투하츠)",
      imageUrl: "https://image.bugsm.co.kr/album/images/130/41289/4128980.jpg?version=20251022002830",
      category: "HOT100 7위"),
    PopularSongDTO(
      title: "XOXZ",
      artist: "IVE (아이브)",
      imageUrl: "https://image.bugsm.co.kr/artist/images/1000/201589/20158908.jpg?version=335304&d=20251021140549",
      category: "멜론DJ's Pick"),
    PopularSongDTO(
      title: "Blue Valentine",
      artist: "NMIXX",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/5297/529710.jpg",
      category: "검색 트렌드"),
    PopularSongDTO(
      title: "FOCUS",
      artist: "Hearts2Hearts(하츠투하츠)",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/41305/4130508.jpg",
      category: "HOT100 7위"),
  ]
}

final class MockLatestService {
  
}

extension MockLatestService {
  static let mockData: [LatestSongDTO] = [
    LatestSongDTO(
      title: "Back to Life",
      artist: "&TEAM",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/41316/4131671.jpg"),
    LatestSongDTO(
      title: "마지막 약속",
      artist: "김나영",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/41317/4131700.jpg"),
    LatestSongDTO(
      title: "Reno (Feat. Colde)",
      artist: "미연 (MIYEON)",
      imageUrl: "https://www.chosun.com/resizer/v2/ZDICNHHWZ6OAGZNCJGH3TBU6XY.jpg?auth=7373a524c2b6bec81926515e9315ce2f4d2c6b4ae27f2b268b7b28abb2adb7aa&width=464"),
    LatestSongDTO(
      title: "X",
      artist: "키코 (Kiko5o)",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/41317/4131733.jpg"),
    LatestSongDTO(
      title: "Omnibus",
      artist: "장한음",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/41317/4131704.jpg"),
    LatestSongDTO(
      title: "CAPPUCCINO",
      artist: "규빈 (GYUBIN)",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/41316/4131679.jpg"),
    LatestSongDTO(
      title:"Milk Choco Quik",
      artist: "리오 (RIO)",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/207634/20763487.jpg"),
    LatestSongDTO(
      title: "Last Dance",
      artist: "몽니",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/207647/20764770.jpg"),
  ]
}

final class MockChartService {}

extension MockChartService {
  static let mockData: [ChartSongDTO] = [
    ChartSongDTO(
      title: "Blue Valentine",
      artist: "NMIXX",
      imageUrl: "https://image.bugsm.co.kr/album/images/130/41299/4129960.jpg?version=20251108012458"),
    ChartSongDTO(
      title: "타임캡슐",
      artist: "다비치",
      imageUrl: "https://image.bugsm.co.kr/album/images/200/41306/4130608.jpg?version=20251017015619"),
    ChartSongDTO(
      title: "Golden",
      artist: "HUNTR/X, EJAE, AUDREY NUNA, REI AMI",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/381763/38176338.jpg?version=20250927005933"),
    ChartSongDTO(
      title: "Good Goodbye",
      artist: "화사 (HWASA)",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/41305/4130508.jpg"),
    ChartSongDTO(
      title: "Drowning",
      artist: "WOODZ",
      imageUrl: "https://image.bugsm.co.kr/album/images/200/40839/4083984.jpg?version=20250315015832"),
    ChartSongDTO(
      title: "뛰어(JUMP)",
      artist: "BLACKPINK",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/41229/4122947.jpg"),
    ChartSongDTO(
      title: "Good Goodbye",
      artist: "화사 (HWASA)",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/41305/4130508.jpg"),
    ChartSongDTO(
      title: "어제보다 슬픈 오늘",
      artist: "우디 (Woody)",
      imageUrl: "https://image.bugsm.co.kr/album/images/200/41171/4117180.jpg?version=20250710002336"),
  ]
}

final class MockBannerService {
  
}

extension MockBannerService {
  static let mockData: [BannerDTO] = [
    BannerDTO(
      title: "우즈 CONCERT",
      subtitle: "멜론티켓에서 예매하기",
      promotion: "2025 WOODZ PREVIEW CONCERT",
      capsuleTitle: "Melon Ticket",
      image: .imgBanner1,
      backgroundColor: .bar6
    ),
    BannerDTO(
      title: "데이터랩 11월",
      subtitle: "2025년을 빛낸 데이터",
      promotion: "데이터랩 이벤트 참여하고 선물 받자",
      capsuleTitle: "Data Lab",
      image: .imgBanner2,
      backgroundColor: .blue
    ),
  ]
}

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
