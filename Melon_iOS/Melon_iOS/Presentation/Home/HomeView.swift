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

class HomeView: UIView {
  
  lazy var collectionView: UICollectionView = {
    let layout = createLayout()
    let col = UICollectionView(frame: .zero, collectionViewLayout: layout)
    col.backgroundColor = .background
    return col
  }()
  
  // MARK: - Lifecycle
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.addSubview(collectionView)
    collectionView.snp.makeConstraints { make in
      make.edges.equalTo(safeAreaLayoutGuide)
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
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
