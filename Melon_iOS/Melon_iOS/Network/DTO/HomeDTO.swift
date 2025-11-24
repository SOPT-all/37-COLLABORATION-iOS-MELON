//
//  HomeDTO.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/19/25.
//

import UIKit

struct PopularSongDTO: Decodable {
    let id: Int?
    let title: String?
    let artistName: String?
    let imageUrl: String?
    let country: String?
    
    init(id: Int = -1,
         title: String = "",
         artistName: String = "",
         imageUrl: String? = "",
         country: String? = "",
    ) {
        self.id = id
        self.title = title
        self.artistName = artistName
        self.imageUrl = imageUrl
        self.country = country
    }
}

struct NewestSongDTO: Decodable {
    let id: Int?
    let title: String?
    let artistName: String?
    let imageUrl: String?
    let country: String?
    
    init(id: Int = -1,
         title: String = "",
         artistName: String = "",
         imageUrl: String? = "",
         country: String? = "",
    ) {
        self.id = id
        self.title = title
        self.artistName = artistName
        self.imageUrl = imageUrl
        self.country = country
    }
}

struct ChartSongDTO: Decodable {
    let id: Int?
    let title: String?
    let artistName: String?
    let imageUrl: String?
    let country: String?
    
    init(id: Int = -1,
         title: String = "",
         artistName: String = "",
         imageUrl: String? = "",
         country: String? = "",
    ) {
        self.id = id
        self.title = title
        self.artistName = artistName
        self.imageUrl = imageUrl
        self.country = country
    }
}

struct PreferencedSongDTO {
    let title: String?
    let artist: String?
    let imageUrl: String?
    
    init(title: String? = "", artist: String? = "", imageUrl: String? = "") {
        self.title = title
        self.artist = artist
        self.imageUrl = imageUrl
    }
}

struct PersonalizedDTO {
    let title: String
    let image: UIImage
}

struct BannerDTO {
    let title: String
    let subtitle: String
    let promotion: String
    let capsuleTitle: String
    let image: UIImage?
    let backgroundColor: UIColor
}
