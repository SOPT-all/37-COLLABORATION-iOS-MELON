//
//  GenericResponse.swift
//  Melon_iOS
//
//  Created by 조영서 on 11/17/25.
//

import Foundation

struct GenericResponse<T: Decodable>: Decodable {
    let isSuccess: Bool
    let code: String 
    let message: String
    let result: T
}
