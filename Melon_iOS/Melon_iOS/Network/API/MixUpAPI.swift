//
//  MixUpAPI.swift
//  Melon_iOS
//
//  Created by 조영서 on 11/22/25.
//

import Foundation
import Moya

enum MixUpAPI {
    case fetchMixUp
}

extension MixUpAPI: BaseTargetType {

    var path: String {
        switch self {
        case .fetchMixUp:
            return "/api/v1/music/mixup"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        return .requestPlain
    }
}
