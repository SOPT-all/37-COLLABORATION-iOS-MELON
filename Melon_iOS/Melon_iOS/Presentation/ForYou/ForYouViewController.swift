//
//  ForYouViewController.swift
//  Melon_iOS
//
//  Created by 조영서 on 11/15/25.
//

import UIKit

import SnapKit
import Then

final class ForYouViewController: BaseViewController, UICollectionViewDelegate {
    
    // MARK: - Properties
    
    private let forYouView = ForYouView()
    private let service = ForYouService()
    
    var basedTasteItems = RecommendationItem.basedTaste
    var basedSituationItems = RecommendationItem.basedSituation
    
    var customSongs: [CustomSongDTO] = []
    var latestAlbum: AlbumDTO?
    var albumTracks: [AlbumTrackDTO] = []
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegateAndDataSource()
        setLatestAlbumView()
        
        loadData()
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
    
    private func setDelegateAndDataSource() {
        let rv = forYouView.recommendView
        let cv = forYouView.customSongView.collectionView
        let tv = forYouView.latestAlbumView.tableView
        
        [rv.tasteCollectionView, rv.situationCollectionView, cv].forEach { collectionView in
            collectionView.delegate = self
            collectionView.dataSource = self
        }
        
        tv.dataSource = self
        tv.delegate = self
        
        forYouView.latestAlbumView.delegate = self
        forYouView.cardView.delegate = self
    }
    
    private func setLatestAlbumView() {
        if let data = latestAlbum {
            forYouView.latestAlbumView.configure(
                title: data.title,
                coverUrl: data.coverImageUrl,
                albumUrl: data.imageUrl
            )
        }
    }
    
    // MARK: - API Calls
    
    private func loadData() {
        Task {
            do {
                let fetchCustomSongs = try await service.fetchCustomSongs()
                self.customSongs = fetchCustomSongs
                self.forYouView.customSongView.collectionView.reloadData()
            } catch {
                print("❌ Custom Songs API 응답 오류:", error)
            }
            
            do {
                let fetchAlbum = try await service.fetchAlbumSongs(albumId: 1)
                self.latestAlbum = fetchAlbum
                self.albumTracks = fetchAlbum.musicList
                self.setLatestAlbumView()
                self.forYouView.latestAlbumView.tableView.reloadData()
                
            } catch {
                print("❌ Album Songs API 응답 오류:", error)
            }
        }
    }
    
    // MARK: - Private Methods
    
    private func presentToast() {
        let toast = ToastMessage()
        self.view.addSubview(toast)
        
        toast.configure(action: { [weak self] in
            guard let self = self else { return }
            let mixUpVC = MixUpViewController()
            
            let transition = CATransition().then {
                $0.duration = 0.3
                $0.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
                $0.type = .moveIn
                $0.subtype = .fromTop
            }
            self.navigationController?.view.layer.add(transition, forKey: nil)
            self.navigationController?.pushViewController(mixUpVC, animated: false)
            
            toast.removeFromSuperview()
        })
        toast.show()
    }
}

// MARK: - Extension

extension ForYouViewController: MallangCardViewDelegate {
    func listenButtonTapped() {
        presentToast()
    }
}

extension ForYouViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == forYouView.customSongView.collectionView {
            return customSongs.count / 3
        }
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let rv = forYouView.recommendView
        let cv = forYouView.customSongView.collectionView
        
        if collectionView == rv.tasteCollectionView {
            return basedTasteItems.count
        } else if collectionView == rv.situationCollectionView {
            return basedSituationItems.count
        }
        else if collectionView == cv {
            return 3
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cv = forYouView.customSongView.collectionView
        
        if collectionView == cv {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CustomSongViewCell.reuseIdentifier,
                for: indexPath
            ) as? CustomSongViewCell else {
                return UICollectionViewCell()
            }
            
            cell.delegate = self
            
            let index = indexPath.section * 3 + indexPath.item
            let item = customSongs[index]
            
            cell.configure(
                title: item.title,
                artist: item.artistName,
                imageUrl: item.imageUrl,
                itemIndex: indexPath.item
            )
            return cell
        }
        
        else {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RecommendViewCell.reuseIdentifier,
                for: indexPath
            ) as? RecommendViewCell else {
                return UICollectionViewCell()
            }
            
            let recommendView = forYouView.recommendView
            let item: RecommendationItem
            
            if collectionView == recommendView.tasteCollectionView {
                item = basedTasteItems[indexPath.item]
            } else if collectionView == recommendView.situationCollectionView {
                item = basedSituationItems[indexPath.item]
            } else {
                return UICollectionViewCell()
            }
            
            cell.delegate = self
            
            cell.configure(
                content: item.content,
                hasImage: item.hasImage,
                isSelected: item.isSelected
            )
            return cell
        }
    }
}

extension ForYouViewController: RecommendViewCellDelegate {
    func chipTapped(in cell: RecommendViewCell) {
        let rv = forYouView.recommendView
        
        if let indexPath = rv.tasteCollectionView.indexPath(for: cell) {
            var item = basedTasteItems[indexPath.item]
            item.isSelected.toggle()
            basedTasteItems[indexPath.item] = item
            rv.tasteCollectionView.reloadItems(at: [indexPath])
        }
        else if let indexPath = rv.situationCollectionView.indexPath(for: cell) {
            var item = basedSituationItems[indexPath.item]
            item.isSelected.toggle()
            basedSituationItems[indexPath.item] = item
            rv.situationCollectionView.reloadItems(at: [indexPath])
        }
    }
}

extension ForYouViewController: CustomSongViewCellDelegate {
    func mixUpButtonTapped(in cell: CustomSongViewCell) {
        presentToast()
    }
}

extension ForYouViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumTracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: LatestAlbumViewCell.identifier,
            for: indexPath
        ) as? LatestAlbumViewCell else {
            return UITableViewCell()
        }
        
        let track = albumTracks[indexPath.row]
        let isTitleTrack = (indexPath.row == 0)
        
        cell.configure(
            title: track.title,
            artistName: track.artistName,
            imageUrl: track.imageUrl,
            isTitleTrack: isTitleTrack
        )
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 41
    }
}

extension ForYouViewController: LatestAlbumViewDelegate {
    func mixUpButtonTapped() {
        presentToast()
    }
}

struct RecommendationItem {
    let content: String
    let hasImage: Bool
    var isSelected: Bool = false
    
    static let basedTaste: [RecommendationItem] = [
        RecommendationItem(content: "감성보컬", hasImage: false),
        RecommendationItem(content: "pH-1", hasImage: true),
        RecommendationItem(content: "그르부있는비트", hasImage: false)
    ]
    
    static let basedSituation: [RecommendationItem] = [
        RecommendationItem(content: "드라이브", hasImage: false),
        RecommendationItem(content: "집중할 때", hasImage: false),
        RecommendationItem(content: "조용한 밤", hasImage: false)
    ]
}
