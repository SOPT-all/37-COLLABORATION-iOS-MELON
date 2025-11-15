//
//  UIFont+.swift
//  Melon_iOS
//
//  Created by 조영서 on 11/15/25.
//

import UIKit

extension UIFont {
    enum PretendardStyle {
        case title_b_24
        case heading_b_20
        case body_sb_16
        case body_b_14
        case body_m_14
        case body_r_14
        case caption_r_12
        case caption_m_10
        case caption_sb_8
    }

    static func pretendard(_ style: PretendardStyle) -> UIFont {
        switch style {
        case .title_b_24:
            return UIFont(name: "Pretendard-Bold", size: 24) ?? .systemFont(ofSize: 24, weight: .bold)
        case .heading_b_20:
            return UIFont(name: "Pretendard-Bold", size: 20) ?? .systemFont(ofSize: 20, weight: .bold)
        case .body_sb_16:
            return UIFont(name: "Pretendard-SemiBold", size: 16) ?? .systemFont(ofSize: 16, weight: .semibold)
        case .body_b_14:
            return UIFont(name: "Pretendard-Bold", size: 14) ?? .systemFont(ofSize: 14, weight: .bold)
        case .body_m_14:
            return UIFont(name: "Pretendard-Medium", size: 14) ?? .systemFont(ofSize: 14, weight: .medium)
        case .body_r_14:
            return UIFont(name: "Pretendard-Regular", size: 14) ?? .systemFont(ofSize: 14, weight: .regular)
        case .caption_r_12:
            return UIFont(name: "Pretendard-Regular", size: 12) ?? .systemFont(ofSize: 12, weight: .regular)
        case .caption_m_10:
            return UIFont(name: "Pretendard-Medium", size: 10) ?? .systemFont(ofSize: 10, weight: .medium)
        case .caption_sb_8:
            return UIFont(name: "Pretendard-SemiBold", size: 8) ?? .systemFont(ofSize: 8, weight: .semibold)
        }
    }
}
