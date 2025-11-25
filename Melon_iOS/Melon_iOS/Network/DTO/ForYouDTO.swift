//
//  ForYouDTO.swift
//  Melon_iOS
//
//  Created by mandoo on 11/24/25.
//

import Foundation

struct CustomSongDTO: Decodable {
    let title: String
    let artist: String
    let imageUrl: String?
    
    static let mockData: [CustomSongDTO] = [
        CustomSongDTO(title: "Blue Valentine", artist: "NMIXX", imageUrl: nil),
        CustomSongDTO(title: "XOXZ", artist: "IVE", imageUrl: nil),
        CustomSongDTO(title: "Show Must Go On", artist: "Bryan Chase,pH-1", imageUrl: nil),
        
        CustomSongDTO(title: "Super Shy", artist: "NewJeans", imageUrl: nil),
        CustomSongDTO(title: "I AM", artist: "IVE", imageUrl: nil),
        CustomSongDTO(title: "Spicy", artist: "aespa", imageUrl: nil),
        
        CustomSongDTO(title: "ETA", artist: "NewJeans", imageUrl: nil),
        CustomSongDTO(title: "Love Lee", artist: "AKMU (악뮤)", imageUrl: nil),
        CustomSongDTO(title: "Seven (feat. Latto)", artist: "정국", imageUrl: nil),
        
        CustomSongDTO(title: "Hype Boy", artist: "NewJeans", imageUrl: nil),
        CustomSongDTO(title: "Fast Forward", artist: "전소미", imageUrl: nil),
        CustomSongDTO(title: "Smoke (Prod. Dynamic Duo, Padi)", artist: "다이나믹 듀오", imageUrl: nil)
    ]
}
