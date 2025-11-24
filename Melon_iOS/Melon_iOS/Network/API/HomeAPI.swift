//
//  HomeAPI.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/24/25.
//

import Foundation
import Moya

enum HomeAPI {
    case fetchPopular, fetchChart, fetchNewest(NewestArea?)
}

enum NewestArea: String {
    case kor = "KOR"
    case int = "INT"
}

extension HomeAPI: BaseTargetType {

    var path: String {
        switch self {
        case .fetchPopular:
            return "/api/v1/music/popular"
        case .fetchChart:
            return "/api/v1/chart/chart"
        case .fetchNewest(let area):
            guard let area else {
                return "/api/v1/music/newest"
            }
            return "/api/v1/music/newest?category=\(area.rawValue)"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        return .requestPlain
    }
}
