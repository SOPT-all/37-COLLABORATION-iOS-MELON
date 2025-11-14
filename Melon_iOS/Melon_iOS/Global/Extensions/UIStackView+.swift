//
//  UIStackView+.swift
//  Melon_iOS
//
//  Created by 조영서 on 11/15/25.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
