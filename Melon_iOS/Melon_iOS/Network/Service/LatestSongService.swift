//
//  LatestSongService.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/19/25.
//

final class LatestSongService {
  
  /// VC가 구독하는 데이터
  var data: [LatestSongResponseDTO] = []
  
  /// 임시저장 데이터
  private var all: [LatestSongResponseDTO] = []
  private var domestic: [LatestSongResponseDTO] = []
  private var overseas: [LatestSongResponseDTO] = []
  
  /// viewDidLoad
  /// API로 all 호출
  
  /// 전체 버튼 입력
  /// data = all 로 전환 / API 호출을 통해 응답 대기 / 응답이 완료 되면 data와 all에 저장
  ///
  
  /// API
  ///  GET
    /// data와 type에 해당하는 변수에 저장하는 역할
}

extension LatestSongService {
  
  static let mockData: [LatestSongResponseDTO] = [
    LatestSongResponseDTO(
      title: "Back to Life",
      artist: "&TEAM",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/41316/4131671.jpg"),
    LatestSongResponseDTO(
      title: "마지막 약속",
      artist: "김나영",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/41317/4131700.jpg"),
    LatestSongResponseDTO(
      title: "Reno (Feat. Colde)",
      artist: "미연 (MIYEON)",
      imageUrl: "https://image.genie.co.kr/Y/IMAGE/IMG_ALBUM/086/878/574/86878574_1761548805678_1_600x600.JPG"),
    LatestSongResponseDTO(
      title: "X",
      artist: "키코 (Kiko5o)",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/41317/4131733.jpg"),
    LatestSongResponseDTO(
      title: "Omnibus",
      artist: "장한음",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/41317/4131704.jpg"),
    LatestSongResponseDTO(
      title: "CAPPUCCINO",
      artist: "규빈 (GYUBIN)",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/41316/4131679.jpg"),
    LatestSongResponseDTO(
      title:"Milk Choco Quik",
      artist: "리오 (RIO)",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/207634/20763487.jpg"),
    LatestSongResponseDTO(
      title: "Last Dance",
      artist: "몽니",
      imageUrl: "https://image.bugsm.co.kr/album/images/170/207647/20764770.jpg"),
  ]
  
}
