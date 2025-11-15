//
//  UILabel+.swift
//  Melon_iOS
//
//  Created by mandoo on 11/16/25.
//

import UIKit

extension UILabel {
    
    func setTypeScale() {
        
        guard let text = self.text, let font = self.font else { return }

        let letterSpacing = font.pointSize * -0.01
        let totalLineHeight = font.pointSize * 1.5
        
        let lineSpacing = totalLineHeight - font.lineHeight
        
        let attributedStr = NSMutableAttributedString(string: text)
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = lineSpacing
        
        attributedStr.addAttribute(.paragraphStyle, value: style, range: NSMakeRange(0, attributedStr.length))
        attributedStr.addAttribute(.kern, value: letterSpacing, range: NSMakeRange(0, attributedStr.length))
        
        self.attributedText = attributedStr
    }
}
