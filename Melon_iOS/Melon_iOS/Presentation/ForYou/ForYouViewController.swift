//
//  ForYouViewController.swift
//  Melon_iOS
//
//  Created by 조영서 on 11/15/25.
//

import UIKit

import SnapKit
import Then

final class ForYouViewController: BaseViewController {
    
    // MARK: - Properties
    
    private let forYouView = ForYouView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setMallangListenButtonAction()
    }
    
    // MARK: - Setup Methods
    
    override func setUI() {
        view.addSubview(forYouView)
    }
    
    override func setLayout() {
        forYouView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Private Methods
    
    private func setMallangListenButtonAction () {
        forYouView.cardView.mallangListenButtonAction = { [weak self] in
            let toast = ToastMessage()
            self?.view.addSubview(toast)
            toast.configure(action: {
                print("toast message action button tapped")
            })
            toast.show()
        }
    }
}
