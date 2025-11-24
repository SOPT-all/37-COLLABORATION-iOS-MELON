//
//  ForYouModel.swift
//  Melon_iOS
//
//  Created by 조영서 on 11/15/25.
//


struct RecommendationItem {
    let content: String
    let hasImage: Bool
    
    static let basedTaste: [RecommendationItem] = [
        RecommendationItem(content: "감성보컬", hasImage: false),
        RecommendationItem(content: "pH-1", hasImage: true),
        RecommendationItem(content: "그르부있는비트", hasImage: false)
    ]
    
    static let basedSituation: [RecommendationItem] = [
        RecommendationItem(content: "드라이브", hasImage: false),
        RecommendationItem(content: "집중할 때", hasImage: false),
        RecommendationItem(content: "조용한 밤", hasImage: false)
    ]
}
