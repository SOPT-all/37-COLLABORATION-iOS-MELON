//
//  MixUpDTO.swift
//  Melon_iOS
//
//  Created by 조영서 on 11/17/25.
//

import UIKit

struct MixUpDTO: Decodable {
    let id: Int
    let title: String
    let artistName: String
    let playCount: Int
    let country: String
    let imageUrl: String
}
