//
//  HomeService.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/19/25.
//

import Foundation

final class MockHomeService {
  
  /// VC가 구독하는 데이터
  var latestSongData: [HomeDTO] = []
  
  /// 임시저장 데이터
  private var latestAllSongs: [HomeDTO] = []
  private var latestDomesticSongs: [HomeDTO] = []
  private var latestOverseasSongs: [HomeDTO] = []
  
  /// viewDidLoad
  /// API로 all 호출
  
  /// 전체 버튼 입력
  /// data = all 로 전환 / API 호출을 통해 응답 대기 / 응답이 완료 되면 data와 all에 저장
  ///
  
  /// API
  ///  GET
    /// data와 type에 해당하는 변수에 저장하는 역할
  
}

extension MockHomeService {
  
  static let preferenceMockData: HomeDTO = HomeDTO(
    title: "The Day",
    artist: "DAY6(데이식스)",
    imageUrl: "https://image.bugsm.co.kr/album/images/170/5297/529710.jpg")
  
  static let popularMockData: [HomeDTO] = [
    HomeDTO(
      title: "XOXZ",
      artist: "IVE (아이브)",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/41260/4126044.jpg",
      category: "멜론DJ's Pick"),
    HomeDTO(
      title: "Blue Valentine",
      artist: "NMIXX",
      imageUrl: "https://image.bugsm.co.kr/album/images/130/41299/4129960.jpg?version=20251108012458",
      category: "검색 트렌드"),
    HomeDTO(
      title: "FOCUS",
      artist: "Hearts2Hearts(하츠투하츠)",
      imageUrl: "https://image.bugsm.co.kr/album/images/130/41289/4128980.jpg?version=20251022002830",
      category: "HOT100 7위"),
    HomeDTO(
      title: "XOXZ",
      artist: "IVE (아이브)",
      imageUrl: "https://image.bugsm.co.kr/artist/images/1000/201589/20158908.jpg?version=335304&d=20251021140549",
      category: "멜론DJ's Pick"),
    HomeDTO(
      title: "Blue Valentine",
      artist: "NMIXX",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/5297/529710.jpg",
      category: "검색 트렌드"),
    HomeDTO(
      title: "FOCUS",
      artist: "Hearts2Hearts(하츠투하츠)",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/41305/4130508.jpg",
      category: "HOT100 7위"),
  ]
  
  static let latestMockData: [HomeDTO] = [
    HomeDTO(
      title: "Back to Life",
      artist: "&TEAM",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/41316/4131671.jpg"),
    HomeDTO(
      title: "마지막 약속",
      artist: "김나영",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/41317/4131700.jpg"),
    HomeDTO(
      title: "Reno (Feat. Colde)",
      artist: "미연 (MIYEON)",
      imageUrl: "https://www.chosun.com/resizer/v2/ZDICNHHWZ6OAGZNCJGH3TBU6XY.jpg?auth=7373a524c2b6bec81926515e9315ce2f4d2c6b4ae27f2b268b7b28abb2adb7aa&width=464"),
    HomeDTO(
      title: "X",
      artist: "키코 (Kiko5o)",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/41317/4131733.jpg"),
    HomeDTO(
      title: "Omnibus",
      artist: "장한음",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/41317/4131704.jpg"),
    HomeDTO(
      title: "CAPPUCCINO",
      artist: "규빈 (GYUBIN)",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/41316/4131679.jpg"),
    HomeDTO(
      title:"Milk Choco Quik",
      artist: "리오 (RIO)",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/207634/20763487.jpg"),
    HomeDTO(
      title: "Last Dance",
      artist: "몽니",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/207647/20764770.jpg"),
  ]
  
  static let chartMockData: [HomeDTO] = [
    HomeDTO(
      title: "Blue Valentine",
      artist: "NMIXX",
      imageUrl: "https://image.bugsm.co.kr/album/images/130/41299/4129960.jpg?version=20251108012458"),
    HomeDTO(
      title: "타임캡슐",
      artist: "다비치",
      imageUrl: "https://image.bugsm.co.kr/album/images/200/41306/4130608.jpg?version=20251017015619"),
    HomeDTO(
      title: "Golden",
      artist: "HUNTR/X, EJAE, AUDREY NUNA, REI AMI",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/381763/38176338.jpg?version=20250927005933"),
    HomeDTO(
      title: "Good Goodbye",
      artist: "화사 (HWASA)",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/41305/4130508.jpg"),
    HomeDTO(
      title: "Drowning",
      artist: "WOODZ",
      imageUrl: "https://image.bugsm.co.kr/album/images/200/40839/4083984.jpg?version=20250315015832"),
    HomeDTO(
      title: "뛰어(JUMP)",
      artist: "BLACKPINK",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/41229/4122947.jpg"),
    HomeDTO(
      title: "Good Goodbye",
      artist: "화사 (HWASA)",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/41305/4130508.jpg"),
    HomeDTO(
      title: "어제보다 슬픈 오늘",
      artist: "우디 (Woody)",
      imageUrl: "https://image.bugsm.co.kr/album/images/200/41171/4117180.jpg?version=20250710002336"),
  ]
  
}
