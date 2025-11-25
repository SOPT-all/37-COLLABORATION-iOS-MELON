//
//  ForYouAPI.swift
//  Melon_iOS
//
//  Created by mandoo on 11/25/25.
//

import Foundation
import Moya

enum ForYouAPI {
    case fetchCustom
    case fetchAlbum(albumId: Int)
}

extension ForYouAPI: BaseTargetType {
    
    var path: String {
        switch self {
        case .fetchCustom:
            return "/api/v1/music/custom-recommendation"
        case .fetchAlbum(let albumId):
            return "/api/v1/album/\(albumId)"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        return .requestPlain
    }
}
