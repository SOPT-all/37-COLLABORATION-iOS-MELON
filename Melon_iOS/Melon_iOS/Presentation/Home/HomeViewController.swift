//
//  HomeViewController.swift
//  Melon_iOS
//
//  Created by 조영서 on 11/15/25.
//

// 여기에쓰거라

import UIKit

final class HomeViewController: UIViewController, UICollectionViewDelegate {
  let compView = HomeView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .background
    self.view = compView
    
    compView.collectionView.delegate = self
    compView.collectionView.dataSource = self
    
    // Collection Cell 등록
    compView.collectionView.cellRegister(EmptyCollectionViewCell.self)
    compView.collectionView.cellRegister(NavigationItemCell.self)
    compView.collectionView.cellRegister(PreferenceItemCell.self)
    
    // Section Header 등록
    compView.collectionView.headerRegister(EmptyReusableView.self)
    compView.collectionView.headerRegister(PersonalizedSectionHeader.self)
    compView.collectionView.headerRegister(PopularSectionHeader.self)
    compView.collectionView.headerRegister(LatestSectionHeader.self)
    compView.collectionView.headerRegister(ChartSectionHeader.self)
    
    // Section Footer 등록
    compView.collectionView.footerRegister(ButtonSectionFooter.self)
    
  }
  
}

extension HomeViewController: UICollectionViewDataSource {
  
  // 섹션 수
  func numberOfSections(in collectionView: UICollectionView) -> Int {
      return SectionType.allCases.count
  }
  
  // 섹션별 아이템 수
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int) -> Int {
    
    guard let sectionType = SectionType(rawValue: section) else {
      return 0
    }
    
    switch sectionType {
    case .navigation: return 1
    case .preference: return 1
    case .latest: return 10 // API 연동
    case .chart: return 12
    default : return 9
    }
  }
  
  // 커스텀 셀 등록
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          
    guard let sectionType = SectionType(rawValue: indexPath.section) else {
      fatalError("Invalid section index")
    }
    
    // 섹션 타입에 따라 다른 셀을 사용하도록 분기
    switch sectionType {
    case .navigation:
      return collectionView.dequeueReusableCell(NavigationItemCell.self, for: indexPath)
    case .preference:
      let cell = collectionView.dequeueReusableCell(PreferenceItemCell.self, for: indexPath)
      return cell
    default:
      let cell = collectionView.dequeueReusableCell(
        withReuseIdentifier: EmptyCollectionViewCell.reuseIdentifier,
        for: indexPath
      )
      cell.backgroundColor = sectionType.backgroundColor
      return cell
    }
  }
  
  // 섹션 타입에 따라 Header와 Footer 등록
  func collectionView(
    _ collectionView: UICollectionView,
    viewForSupplementaryElementOfKind kind: String,
    at indexPath: IndexPath) -> UICollectionReusableView {
    
    // indexPath의 section을 기반으로 SectionType을 알아낸다.
    guard let sectionType = SectionType(rawValue: indexPath.section) else {
        fatalError("Invalid section index")
    }
    
    switch sectionType {
    case .personalized:
      if kind == UICollectionView.elementKindSectionHeader {
        guard let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: PersonalizedSectionHeader.reuseIdentifier,
            for: indexPath
        ) as? PersonalizedSectionHeader else {
            fatalError("Cannot dequeue PersonalizedSectionHeader")
        }
        return header
      }
    case .popular:
      if kind == UICollectionView.elementKindSectionHeader {
        guard let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: PopularSectionHeader.reuseIdentifier,
            for: indexPath
        ) as? PopularSectionHeader else {
            fatalError("Cannot dequeue PopularSectionHeader")
        }
        return header
      }
    case .latest:
      if kind == UICollectionView.elementKindSectionHeader {
        guard let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: LatestSectionHeader.reuseIdentifier,
            for: indexPath
        ) as? LatestSectionHeader else {
            fatalError("Cannot dequeue LatestSectionHeader")
        }
        header.configure(action: { type in // API 호출 코드 작성
          switch type {
          case .all:
            print("모든 곡이 선택되었습니다.")
          case .domestic:
            print("국내 곡이 선택되었습니다.")
          case .overseas:
            print("해외 곡이 선택되었습니다.")
          }
        })
        return header
      }
    case .chart:
      if kind == UICollectionView.elementKindSectionHeader {
        guard let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: ChartSectionHeader.reuseIdentifier,
            for: indexPath
        ) as? ChartSectionHeader else {
            fatalError("Cannot dequeue ChartSectionHeader")
        }
        return header
      } else if kind == UICollectionView.elementKindSectionFooter {
        guard let footer = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: ButtonSectionFooter.reuseIdentifier,
            for: indexPath
        ) as? ButtonSectionFooter else {
            fatalError("Cannot dequeue ChartSectionFooter")
        }
        footer.configure(title: "TOP 100 전체듣기")
        return footer
      }
    default:
      return EmptyReusableView()
    }
    
    fatalError("Missing supplementary view logic for kind: \(kind)")
  }

}

#Preview {
  HomeViewController()
}
