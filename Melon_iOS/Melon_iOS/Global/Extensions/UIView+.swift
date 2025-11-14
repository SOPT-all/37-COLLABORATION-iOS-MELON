//
//  UIView+.swift
//  Melon_iOS
//
//  Created by 조영서 on 11/15/25.
//

import UIKit

extension UIView {

    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
