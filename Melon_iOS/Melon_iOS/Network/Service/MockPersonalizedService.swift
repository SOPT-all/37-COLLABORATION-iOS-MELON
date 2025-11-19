//
//  PersonalizedService.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/18/25.
//

final class MockPersonalizedService { }

extension MockPersonalizedService {
  static let mockData: [PersonalizedDTO] = [
    PersonalizedDTO(title: "내가 아끼는 최애곡 모음", image: .imgRecommend1),
    PersonalizedDTO(title: "요즘 듣던 노래 이어듣기", image: .imgRecommend2),
    PersonalizedDTO(title: "매일 찾아듣는 음악", image: .imgRecommend3),
  ]
}
