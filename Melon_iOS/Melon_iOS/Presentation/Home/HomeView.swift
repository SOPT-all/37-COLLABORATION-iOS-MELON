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
  
  private let playerView = ProgressBar(style: .normal)
  
  // MARK: - Setup Methods
  
  override func setUI() {
    addSubviews(backgroundView, collectionView, playerView)
  }
  
  override func setLayout() {
    backgroundView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    
    collectionView.snp.makeConstraints {
      $0.top.horizontalEdges.equalTo(safeAreaLayoutGuide)
      $0.bottom.equalTo(playerView.snp.top)
    }
    
    playerView.snp.makeConstraints {
      $0.bottom.horizontalEdges.equalTo(safeAreaLayoutGuide)
      $0.height.equalTo(60)
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
