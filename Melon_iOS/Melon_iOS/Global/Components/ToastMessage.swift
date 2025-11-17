//
//  ToastMessage.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/17/25.
//

import UIKit

import SnapKit
import Then

final class ToastMessage: UIView {
 
  // MARK: - Properties
  
  private var action: (() -> Void)?
  
  // MARK: - UI Components
  
  private lazy var messageLabel = UILabel().then {
    $0.text = "믹스업에 추가되었어요"
    $0.textColor = .white
    $0.font = UIFont.pretendard(.body_m_14)
  }
  
  private lazy var actionButton = UIButton().then {
    $0.setTitle("이동", for: .normal)
    $0.setTitleColor(.white, for: .normal)
    $0.titleLabel?.font = UIFont.pretendard(.body_m_14)
    $0.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
  }

  // MARK: - Lifecycle
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
    setLayout()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Setup Methods
  
  func setUI() {
    backgroundColor = .neonpink
    layer.cornerRadius = 8
    clipsToBounds = true
    
    addSubviews(messageLabel, actionButton)
  }
  
  func setLayout() {
    
    messageLabel.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalToSuperview().offset(16)
    }
    
    actionButton.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.trailing.equalToSuperview().inset(16)
      $0.width.equalTo(25)
      $0.height.equalTo(21)
    }
  }
  
  func show() {
    self.snp.makeConstraints {
      $0.height.equalTo(49)
      $0.horizontalEdges.equalToSuperview().inset(16)
      $0.bottom.equalToSuperview().inset(78)
    }
    dissmissToastMessage()
  }
  
  func configure(action: (() -> Void)? = nil) {
    self.action = action
  }

  // MARK: - Actions
  
  @objc func actionButtonTapped() {
    action?()
  }

  // MARK: - Private Methods
  
  private func dissmissToastMessage() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
      UIView.animate(withDuration: 0.3, animations: {
        self.alpha = 0
      }) { _ in
        self.removeFromSuperview()
      }
    }
  }
  
}
