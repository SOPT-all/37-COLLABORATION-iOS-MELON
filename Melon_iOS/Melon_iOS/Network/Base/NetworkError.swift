//
//  NetworkError.swift
//  Melon_iOS
//
//  Created by 조영서 on 11/17/25.
//

import Foundation

public enum NetworkError: Error {
    case decoding
    case unauthorized
    case forbidden
    case notFound
    case serverError(String)
    case networkFail
    case unknown
}
