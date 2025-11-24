//
//  MockHomeService.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/21/25.
//

final class MockPopularService {}

extension MockPopularService {
  static let mockData: [PopularSongDTO] = [
    PopularSongDTO(
      title: "XOXZ",
      artistName: "IVE (아이브)",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/41260/4126044.jpg",),
    PopularSongDTO(
      title: "Blue Valentine",
      artistName: "NMIXX",
      imageUrl: "https://image.bugsm.co.kr/album/images/130/41299/4129960.jpg?version=20251108012458",),
    PopularSongDTO(
      title: "FOCUS",
      artistName: "Hearts2Hearts(하츠투하츠)",
      imageUrl: "https://image.bugsm.co.kr/album/images/130/41289/4128980.jpg?version=20251022002830",),
    PopularSongDTO(
      title: "XOXZ",
      artistName: "IVE (아이브)",
      imageUrl: "https://image.bugsm.co.kr/artist/images/1000/201589/20158908.jpg?version=335304&d=20251021140549",),
    PopularSongDTO(
      title: "Blue Valentine",
      artistName: "NMIXX",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/5297/529710.jpg",),
    PopularSongDTO(
      title: "FOCUS",
      artistName: "Hearts2Hearts(하츠투하츠)",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/41305/4130508.jpg",),
  ]
}

final class MockLatestService { }

extension MockLatestService {
  static let mockData: [NewestSongDTO] = [
    NewestSongDTO(
      title: "Back to Life",
      artistName: "&TEAM",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/41316/4131671.jpg"),
    NewestSongDTO(
      title: "마지막 약속",
      artistName: "김나영",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/41317/4131700.jpg"),
    NewestSongDTO(
      title: "Reno (Feat. Colde)",
      artistName: "미연 (MIYEON)",
      imageUrl: "https://www.chosun.com/resizer/v2/ZDICNHHWZ6OAGZNCJGH3TBU6XY.jpg?auth=7373a524c2b6bec81926515e9315ce2f4d2c6b4ae27f2b268b7b28abb2adb7aa&width=464"),
    NewestSongDTO(
      title: "X",
      artistName: "키코 (Kiko5o)",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/41317/4131733.jpg"),
    NewestSongDTO(
      title: "Omnibus",
      artistName: "장한음",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/41317/4131704.jpg"),
    NewestSongDTO(
      title: "CAPPUCCINO",
      artistName: "규빈 (GYUBIN)",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/41316/4131679.jpg"),
    NewestSongDTO(
      title:"Milk Choco Quik",
      artistName: "리오 (RIO)",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/207634/20763487.jpg"),
    NewestSongDTO(
      title: "Last Dance",
      artistName: "몽니",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/207647/20764770.jpg"),
  ]
}

final class MockChartService { }

extension MockChartService {
  static let mockData: [ChartSongDTO] = [
    ChartSongDTO(
      title: "Blue Valentine",
      artistName: "NMIXX",
      imageUrl: "https://image.bugsm.co.kr/album/images/130/41299/4129960.jpg?version=20251108012458"),
    ChartSongDTO(
      title: "타임캡슐",
      artistName: "다비치",
      imageUrl: "https://image.bugsm.co.kr/album/images/200/41306/4130608.jpg?version=20251017015619"),
    ChartSongDTO(
      title: "Golden",
      artistName: "HUNTR/X, EJAE, AUDREY NUNA, REI AMI",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/381763/38176338.jpg?version=20250927005933"),
    ChartSongDTO(
      title: "Good Goodbye",
      artistName: "화사 (HWASA)",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/41305/4130508.jpg"),
    ChartSongDTO(
      title: "Drowning",
      artistName: "WOODZ",
      imageUrl: "https://image.bugsm.co.kr/album/images/200/40839/4083984.jpg?version=20250315015832"),
    ChartSongDTO(
      title: "뛰어(JUMP)",
      artistName: "BLACKPINK",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/41229/4122947.jpg"),
    ChartSongDTO(
      title: "Good Goodbye",
      artistName: "화사 (HWASA)",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/41305/4130508.jpg"),
    ChartSongDTO(
      title: "어제보다 슬픈 오늘",
      artistName: "우디 (Woody)",
      imageUrl: "https://image.bugsm.co.kr/album/images/200/41171/4117180.jpg?version=20250710002336"),
  ]
}

final class MockBannerService { }

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

final class MockPersonalizedService { }

extension MockPersonalizedService {
  static let mockData: [PersonalizedDTO] = [
    PersonalizedDTO(title: "내가 아끼는 최애곡 모음", image: .imgRecommend1),
    PersonalizedDTO(title: "요즘 듣던 노래 이어듣기", image: .imgRecommend2),
    PersonalizedDTO(title: "매일 찾아듣는 음악", image: .imgRecommend3),
  ]
}
