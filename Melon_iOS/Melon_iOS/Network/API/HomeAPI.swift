//
//  HomeAPI.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/24/25.
//

import Foundation
import Moya

enum HomeAPI {
    case fetchPopular, fetchChart, fetchNewest(NewestArea)
}

enum NewestArea: String {
    case all
    case kor = "KOR"
    case int = "INT"
}

extension HomeAPI: BaseTargetType {

    var path: String {
        switch self {
        case .fetchPopular:
            return "/api/v1/music/popular"
        case .fetchNewest:
            return "/api/v1/music/newest"
        case .fetchChart:
            return "/api/v1/music/chart"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        switch self {
            case .fetchPopular, .fetchChart:
            return .requestPlain
        case .fetchNewest(let area):
            if area == .all {
                return .requestPlain
            } else {
                return .requestParameters(
                    parameters: ["category": area.rawValue],
                    encoding: URLEncoding.default // 또는 queryString
                )
            }
        }
    }
}
