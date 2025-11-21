//
//  HomeView.swift
//  Melon_iOS
//
//  Created by 조영서 on 11/15/25.
//

// 여기에쓰거라

import UIKit

import SnapKit
import Then

final class HomeView: BaseUIView {
  
  private let backgroundView = UIView().then {
    $0.backgroundColor = .background
  }
  
  lazy var collectionView: UICollectionView = {
    let layout = createLayout()
    let col = UICollectionView(frame: .zero, collectionViewLayout: layout)
    col.backgroundColor = .background
    return col
  }()
  
  // MARK: - Setup Methods
  
  override func setUI() {
    addSubviews(backgroundView, collectionView)
  }
  
  override func setLayout() {
    backgroundView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    collectionView.snp.makeConstraints {
      $0.edges.equalTo(safeAreaLayoutGuide)
    }
  }
  
  // MARK: - Private Methods
  
  private func createLayout() -> UICollectionViewLayout {
    let layout = UICollectionViewCompositionalLayout {
      (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment)
      -> NSCollectionLayoutSection? in
      
      guard let sectionType = SectionType(rawValue: sectionIndex) else {
        return nil
      }
      
      return sectionType.section
    }
    return layout
  }
}
