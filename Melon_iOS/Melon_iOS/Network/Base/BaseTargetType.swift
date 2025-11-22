//
//  BaseTargetType.swift
//  Melon_iOS
//
//  Created by 조영서 on 11/17/25.
//

import Foundation
import Moya

protocol BaseTargetType: TargetType { }

extension BaseTargetType{

    var baseURL: URL {
        return URL(string:"https://melon.dhxxn.dev")!
    }

    var headers: [String : String]? {
        let header = [
            "Content-Type": "application/json"
        ]
        return header
    }

    var sampleData: Data {
        return Data()
    }
}
