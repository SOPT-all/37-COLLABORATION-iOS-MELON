//
//  BaseUICollectionReusableView.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/18/25.
//

import UIKit

class BaseUICollectionReusableView: UICollectionReusableView {
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Methods
    
    private func setup() {
        setUI()
        setLayout()
        setAction()
    }
    
    func setUI() { }
    func setLayout() { }
    func setAction() { }
}
