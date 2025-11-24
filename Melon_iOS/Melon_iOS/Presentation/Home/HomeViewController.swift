//
//  HomeViewController.swift
//  Melon_iOS
//
//  Created by 조영서 on 11/15/25.
//

// 여기에쓰거라

import UIKit

final class HomeViewController: UIViewController, UICollectionViewDelegate {
    
    // MARK: - Properties
    
    private let homeView = HomeView()
    private let service = HomeService()
    private var popularSongList: [PopularSongDTO] = []
    private var newestSongList: [NewestSongDTO] = []
    private var chartSongList: [ChartSongDTO] = []
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .background
        self.view = homeView
        
        homeView.collectionView.delegate = self
        homeView.collectionView.dataSource = self
        
        // Collection Cell 등록
        homeView.collectionView.cellRegister(NavigationItemCell.self)
        homeView.collectionView.cellRegister(PreferenceItemCell.self)
        homeView.collectionView.cellRegister(PersonalizedItemCell.self)
        homeView.collectionView.cellRegister(PopularItemCell.self)
        homeView.collectionView.cellRegister(BannerItemCell.self)
        homeView.collectionView.cellRegister(LatestSongItemCell.self)
        homeView.collectionView.cellRegister(ChartItemCell.self)
        
        // Section Header & Footer 등록
        homeView.collectionView.headerRegister(BasicSectionHeader.self)
        homeView.collectionView.headerRegister(LatestSectionHeader.self)
        homeView.collectionView.headerRegister(ChartSectionHeader.self)
        homeView.collectionView.footerRegister(ButtonSectionFooter.self)
        
        Task {
            try await fetchData()
        }
    }
    
    // MARK: - Private Methods
    
    private func fetchData() async throws {
        Task {
            do {
                self.popularSongList = try await service.fetchPopularSongs()
                await MainActor.run {
                    self.homeView.collectionView.reloadData()
                }
            } catch {
                print("❌ Fetch Popular API 응답 오류:", error)
            }
        }
        
        Task {
            do {
                self.newestSongList = try await service.fetchNewestSongs()
                await MainActor.run {
                    self.homeView.collectionView.reloadData()
                }
            } catch {
                print("❌ Fetch Newest API 응답 오류:", error)
            }
        }
        
        Task {
            do {
                self.chartSongList = try await service.fetchChartSongs()
                await MainActor.run {
                    self.homeView.collectionView.reloadData()
                }
            } catch {
                print("❌ Fetch Chart API 응답 오류:", error)
            }
        }
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
        case .popular: return popularSongList.count
        case .banner: return MockBannerService.mockData.count
        case .latest: return newestSongList.count
        case .chart: return chartSongList.count
        }
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            guard let sectionType = SectionType(rawValue: indexPath.section) else {
                fatalError("Invalid section index")
            }

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
                cell.configure(popularSongList[indexPath.row], indexPath: indexPath)
                { [weak self] in
                    let toast = ToastMessage()
                    self?.homeView.addSubview(toast)
                    toast.configure(action: {
                        let mixUp = MixUpViewController()
                        self?.navigationController?.pushViewController(mixUp, animated: true)
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
                cell.configure(newestSongList[indexPath.row])
                return cell
            case .chart:
                let cell = collectionView.dequeueReusableCell(ChartItemCell.self, for: indexPath)
                cell.configure(chartSongList[indexPath.row], row: indexPath.row)
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
                        Task {
                            do {
                                self.newestSongList = try await self.service.fetchNewestSongs(area: type)
                                collectionView.reloadData()
                            } catch {
                                print("❌ Newest \(type.rawValue) API 응답 오류:", error)
                            }
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
                fatalError("No such Reusable View")
            }
            
            fatalError("Missing supplementary view logic for kind: \(kind)")
        }
}
