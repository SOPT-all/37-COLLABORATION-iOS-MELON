//
//  BannerService.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/19/25.
//

import Foundation

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
