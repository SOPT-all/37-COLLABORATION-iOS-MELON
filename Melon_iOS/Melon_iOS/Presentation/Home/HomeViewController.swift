//
//  HomeViewController.swift
//  Melon_iOS
//
//  Created by 조영서 on 11/15/25.
//

// 여기에쓰거라

import UIKit

final class HomeViewController: UIViewController, UICollectionViewDelegate {
  
  let homeView = HomeView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .background
    self.view = homeView
    
    homeView.collectionView.delegate = self
    homeView.collectionView.dataSource = self
    
    // Collection Cell 등록
    homeView.collectionView.cellRegister(EmptyCollectionViewCell.self)
    homeView.collectionView.cellRegister(NavigationItemCell.self)
    homeView.collectionView.cellRegister(PreferenceItemCell.self)
    homeView.collectionView.cellRegister(PersonalizedItemCell.self)
    homeView.collectionView.cellRegister(PopularItemCell.self)
    homeView.collectionView.cellRegister(BannerItemCell.self)
    homeView.collectionView.cellRegister(LatestSongItemCell.self)
    homeView.collectionView.cellRegister(ChartItemCell.self)
    
    // Section Header 등록
    homeView.collectionView.headerRegister(EmptyReusableView.self)
    homeView.collectionView.headerRegister(BasicSectionHeader.self)
    homeView.collectionView.headerRegister(LatestSectionHeader.self)
    homeView.collectionView.headerRegister(ChartSectionHeader.self)
    
    // Section Footer 등록
    homeView.collectionView.footerRegister(ButtonSectionFooter.self)
  }
}

extension HomeViewController: UICollectionViewDataSource {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return SectionType.allCases.count
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int) -> Int {
    
    guard let sectionType = SectionType(rawValue: section) else {
      return 0
    }
    
    switch sectionType {
    case .navigation: return 1
    case .preference: return 1
    case .personalized: return MockPersonalizedService.mockData.count
    case .popular: return MockPopularService.mockData.count
    case .banner: return MockBannerService.mockData.count
    case .latest: return MockLatestService.mockData.count
    case .chart: return MockChartService.mockData.count
    }
  }
  
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
      cell.configure()
      return cell
    case .personalized:
      let cell = collectionView.dequeueReusableCell(PersonalizedItemCell.self, for: indexPath)
      cell.configure(data: MockPersonalizedService.mockData[indexPath.row])
      return cell
    case .popular:
      let cell = collectionView.dequeueReusableCell(PopularItemCell.self, for: indexPath)
      cell.configure(MockPopularService.mockData[indexPath.row]) { [weak self] in
        let toast = ToastMessage()
          self?.homeView.addSubview(toast)
          toast.configure(action: {
            print("toast message action button tapped")
          })
          toast.show()
      }
      return cell
    case .banner:
      let cell = collectionView.dequeueReusableCell(BannerItemCell.self, for: indexPath)
      cell.configure(MockBannerService.mockData[indexPath.row])
      return cell
    case .latest:
      let cell = collectionView.dequeueReusableCell(LatestSongItemCell.self, for: indexPath)
      cell.configure(MockLatestService.mockData[indexPath.row])
      return cell
    case .chart:
      let cell = collectionView.dequeueReusableCell(ChartItemCell.self, for: indexPath)
      cell.configure(MockChartService.mockData[indexPath.row], row: indexPath.row)
      return cell
    }
  }
  
  // 섹션 타입에 따라 Header와 Footer 등록
  func collectionView(
    _ collectionView: UICollectionView,
    viewForSupplementaryElementOfKind kind: String,
    at indexPath: IndexPath) -> UICollectionReusableView {
    
    guard let sectionType = SectionType(rawValue: indexPath.section) else {
      fatalError("Invalid section index")
    }
    
    switch sectionType {
    case .personalized:
      if kind == UICollectionView.elementKindSectionHeader {
        guard let header = collectionView.dequeueReusableSupplementaryView(
          ofKind: kind,
          withReuseIdentifier: BasicSectionHeader.reuseIdentifier,
          for: indexPath
        ) as? BasicSectionHeader else {
          fatalError("Cannot dequeue PersonalizedSectionHeader")
        }
        header.configure(title: "닉네임을 위한 추천")
        return header
      }
    case .popular:
      if kind == UICollectionView.elementKindSectionHeader {
        guard let header = collectionView.dequeueReusableSupplementaryView(
          ofKind: kind,
          withReuseIdentifier: BasicSectionHeader.reuseIdentifier,
          for: indexPath
        ) as? BasicSectionHeader else {
          fatalError("Cannot dequeue PopularSectionHeader")
        }
        header.configure(title: "인기 선곡")
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
