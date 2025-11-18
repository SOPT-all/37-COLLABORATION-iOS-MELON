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
    compView.collectionView.cellRegister(PersonalizedItemCell.self)
    compView.collectionView.cellRegister(PopularItemCell.self)
    
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
    case .personalized: return PersonalizedService.mockData.count
    case .popular: return PopularSongService.mockData.count
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
    case .personalized:
      let cell = collectionView.dequeueReusableCell(PersonalizedItemCell.self, for: indexPath)
      cell.configure(data: PersonalizedService.mockData[indexPath.row])
      return cell
    case .popular:
      let cell = collectionView.dequeueReusableCell(PopularItemCell.self, for: indexPath)
      cell.configure(PopularSongService.mockData[indexPath.row]) { [weak self] in
        let toast = ToastMessage()
          self?.compView.addSubview(toast)
          toast.configure(action: {
            print("toast message action button tapped")
          })
          toast.show()
      }
      
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

class PopularItemCell: BaseUICollectionViewCell, ReuseIdentifiable {
  
  // MARK: - Properties
  private var action: (() -> Void)?
  
  // MARK: - UI Components
  
  private lazy var imageView = UIImageView().then {
    $0.contentMode = .scaleAspectFill
    $0.clipsToBounds = true
    $0.backgroundColor = .background2
    $0.layer.cornerRadius = 4
    $0.image = .imgMixup4
  }
  
  private lazy var infoStackView = UIStackView().then {
    $0.axis = .vertical
    $0.spacing = 4
  }
  
  private lazy var sourceLabel = UILabel().then {
    $0.font = UIFont.pretendard(.caption_r_12)
    $0.textColor = .gray200
  }
  
  private lazy var titleLabel = UILabel().then {
    $0.font = UIFont.pretendard(.body_r_14)
    $0.textColor = .white
  }
  
  private lazy var artistLabel = UILabel().then {
    $0.font = UIFont.pretendard(.caption_r_12)
    $0.textColor = .gray200
  }
  
  private lazy var mixUpButton = UIButton().then {
    $0.setImage(.icMixup36, for: .normal)
    $0.addTarget(self, action: #selector(mixUpButtonTapped), for: .touchUpInside)
  }
  
  // MARK: - Setup Methods
  
  override func setUI() {
    addSubviews(imageView, infoStackView, mixUpButton)
    infoStackView.addArrangedSubviews(sourceLabel, titleLabel, artistLabel)
  }
  
  override func setLayout() {
    imageView.snp.makeConstraints {
      $0.leading.verticalEdges.equalToSuperview()
      $0.width.equalTo(imageView.snp.height)
    }
    
    infoStackView.snp.makeConstraints {
      $0.leading.equalTo(imageView.snp.trailing).offset(12)
      $0.centerY.equalToSuperview()
    }
    
    mixUpButton.snp.makeConstraints {
      $0.size.equalTo(36)
      $0.trailing.equalToSuperview().inset(-12)
      $0.centerY.equalToSuperview()
    }
  }
  
  func configure(_ data: PopularSongDTO, action: (() -> Void)? = nil) {
    sourceLabel.text = data.source
    titleLabel.text = data.title
    artistLabel.text = data.artist
    imageView.image = data.image
    self.action = action
  }
  
  @objc func mixUpButtonTapped() {
    action!()
  }
  
}

final class PopularSongService { }

extension PopularSongService {
  static let mockData: [PopularSongDTO] = [
    PopularSongDTO(title: "XOXZ", artist: "IVE (아이브)", source: "멜론DJ's Pick", image: .imgHome1),
    PopularSongDTO(title: "Blue Valentine", artist: "NMIXX", source: "검색 트렌드", image: .imgHome2),
    PopularSongDTO(title: "FOCUS", artist: "Hearts2Hearts(하츠투하츠)", source: "HOT100 7위", image: .imgHome3),
    PopularSongDTO(title: "XOXZ", artist: "IVE (아이브)", source: "멜론DJ's Pick", image: .imgHome4),
    PopularSongDTO(title: "Blue Valentine", artist: "NMIXX", source: "검색 트렌드", image: .imgHome5),
    PopularSongDTO(title: "FOCUS", artist: "Hearts2Hearts(하츠투하츠)", source: "HOT100 7위", image: .imgHome6),
  ]
}

struct PopularSongDTO {
  let title: String
  let artist: String
  let source: String
  let image: UIImage
}

#Preview {
  HomeViewController()
}
