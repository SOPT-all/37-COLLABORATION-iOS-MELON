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
    
    static func pretendard(_ style: PretendardStyle, text: String) -> NSAttributedString {
        let font = UIFont(name: style.fontName, size: style.size)
        ?? .systemFont(ofSize: style.size)
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.minimumLineHeight = style.lineHeight
        paragraph.maximumLineHeight = style.lineHeight
        
        let attributed = NSMutableAttributedString(string: text)
        attributed.addAttributes([
            .font: font,
            .kern: style.letterSpacing,
            .paragraphStyle: paragraph
        ], range: NSMakeRange(0, attributed.length))
        
        return attributed
    }
}

extension UIFont.PretendardStyle {
    
    var size: CGFloat {
        switch self {
        case .title_b_24: return 24
        case .heading_b_20: return 20
        case .body_sb_16: return 16
        case .body_b_14: return 14
        case .body_m_14: return 14
        case .body_r_14: return 14
        case .caption_r_12: return 12
        case .caption_m_10: return 10
        case .caption_sb_8: return 8
        }
    }
    
    var fontName: String {
        switch self {
        case .title_b_24, .heading_b_20, .body_b_14:
            return "Pretendard-Bold"
        case .body_sb_16, .caption_sb_8:
            return "Pretendard-SemiBold"
        case .body_m_14, .caption_m_10:
            return "Pretendard-Medium"
        case .body_r_14, .caption_r_12:
            return "Pretendard-Regular"
        }
    }
    
    var letterSpacing: CGFloat {
        return size * -0.01
    }
    
    var lineHeight: CGFloat {
        return size * 1.5
    }
}

