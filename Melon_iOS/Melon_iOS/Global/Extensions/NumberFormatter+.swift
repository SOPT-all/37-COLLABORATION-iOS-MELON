//
//  NumberFormatter+.swift
//  Melon_iOS
//
//  Created by 조영서 on 11/15/25.
//

import Foundation

extension NumberFormatter {
    static func formatNumber(_ value: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: value)) ?? "\(value)"
    }
}
