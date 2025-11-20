//
//  MixUpViewController.swift
//  Melon_iOS
//
//  Created by 조영서 on 11/15/25.
//

import UIKit

import SnapKit

final class MixUpViewController: BaseViewController, UICollectionViewDelegate {

    // MARK: - Properties
    
    private let mixUpView = MixUpView()
    private let service = MockMixUpService()
    private var music: [MixUpResponseDTO] = []

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        loadData()
    }

    // MARK: - Setup Methods
    
    override func setUI() {
        view.addSubview(mixUpView)
        mixUpView.delegate = self
    }

    override func setLayout() {
        mixUpView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    private func setupCollectionView() {
        let cv = mixUpView.mixUpListView.collectionView
        cv.dataSource = self
        cv.delegate = self
        cv.register(
            MixUpListViewCell.self,
            forCellWithReuseIdentifier: MixUpListViewCell.reuseIdentifier
        )
    }

    // MARK: - API Calls
    
    private func loadData() {
        Task {
            do {
                music = try await service.fetchSongs()
                mixUpView.mixUpListView.collectionView.reloadData()
            } catch {
                print("❌ Error fetching songs: \(error)")
            }
        }
    }
}

// MARK: - Extensions

extension MixUpViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return music.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MixUpListViewCell.reuseIdentifier,
            for: indexPath
        ) as? MixUpListViewCell else {
            return UICollectionViewCell()
        }

        let item = music[indexPath.item]
        cell.configure(
            title: item.title,
            artist: item.artist,
            imageUrl: item.imageUrl
        )
        return cell
    }
}

extension MixUpViewController: MixUpViewDelegate {
    func didTapChevronDown() {

        UIView.animate(withDuration: 0.3, animations: {
            self.view.transform = CGAffineTransform(
                translationX: 0,
                y: UIScreen.main.bounds.height
            )
        }, completion: { _ in
            let vc = ViewController() // TODO: 홈 VC로 교체
            self.navigationController?.pushViewController(vc, animated: false)
            
            self.view.transform = .identity
        })
    }
}
