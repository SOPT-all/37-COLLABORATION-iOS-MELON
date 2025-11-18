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
    compView.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    
    compView.collectionView.delegate = self
    compView.collectionView.dataSource = self
    
    compView.collectionView.register(
      PersonalizedSectionHeader.self,
      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
      withReuseIdentifier: PersonalizedSectionHeader.reuseIdentifier())
    compView.collectionView.register(
      PopularSectionHeader.self,
      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
      withReuseIdentifier: PopularSectionHeader.reuseIdentifier())
    compView.collectionView.register(
      LatestSectionHeader.self,
      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
      withReuseIdentifier: LatestSectionHeader.reuseIdentifier())
    compView.collectionView.register(
      ChartSectionHeader.self,
      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
      withReuseIdentifier: ChartSectionHeader.reuseIdentifier())
    compView.collectionView.register(
      ButtonSectionFooter.self,
      forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
      withReuseIdentifier: ButtonSectionFooter.reuseIdentifier())
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
    case .header: return 1
    case .latest: return 10 // API 연동
    case .chart: return 12
    default : return 9
    }
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
    
    // 섹션별 테마 색상으로 배경색 설정
    if let sectionType = SectionType(rawValue: indexPath.section) {
        cell.backgroundColor = sectionType.backgroundColor
    } else {
        cell.backgroundColor = .lightGray
    }
    
    return cell
  }
  
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
            withReuseIdentifier: PersonalizedSectionHeader.reuseIdentifier(),
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
            withReuseIdentifier: PopularSectionHeader.reuseIdentifier(),
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
            withReuseIdentifier: LatestSectionHeader.reuseIdentifier(),
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
            withReuseIdentifier: ChartSectionHeader.reuseIdentifier(),
            for: indexPath
        ) as? ChartSectionHeader else {
            fatalError("Cannot dequeue ChartSectionHeader")
        }
        return header
      } else if kind == UICollectionView.elementKindSectionFooter {
        guard let footer = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: ButtonSectionFooter.reuseIdentifier(),
            for: indexPath
        ) as? ButtonSectionFooter else {
            fatalError("Cannot dequeue ChartSectionFooter")
        }
        footer.configure(title: "TOP 100 전체듣기")
        return footer
      }
    default:
      return UICollectionReusableView()
    }
    
    fatalError("Missing supplementary view logic for kind: \(kind)")
  }

}

#Preview {
  HomeViewController()
}
