//
//  ReuseIdentifiable.swift
//  Melon_iOS
//
//  Created by 조영서 on 11/15/25.
//

import Foundation

protocol ReuseIdentifiable {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifiable {
    static var reuseIdentifier: String {
        String(describing: Self.self)
    }
}
