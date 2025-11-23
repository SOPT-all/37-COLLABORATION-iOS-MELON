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
    private let service = MixUpService()
    private var music: [MixUpDTO] = []

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

        cv.dragInteractionEnabled = false

        cv.isUserInteractionEnabled = true
        cv.isScrollEnabled = true

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
                print("❌ MixUp API 응답 오류:", error)
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
            artist: item.artistName,
            imageUrl: item.imageUrl
        )
        return cell
    }
}

extension MixUpViewController: MixUpViewDelegate {

    func didTapChevronDown() {
        let homeVC = TabBarController()

        navigationController?.pushViewController(homeVC, animated: false)

        guard let window = view.window else { return }
        window.addSubview(view)
        view.frame = window.bounds

        UIView.animate(withDuration: 0.3, animations: {
            self.view.transform = CGAffineTransform(
                translationX: 0,
                y: UIScreen.main.bounds.height
            )
        }, completion: { _ in
            self.view.removeFromSuperview()
        })
    }

    func didTapCheckbox(isSelected: Bool) {
        
        mixUpView.nowPlayingTrackView.setChecked(isSelected)
        
        for cell in mixUpView.mixUpListView.collectionView.visibleCells {
            if let cell = cell as? MixUpListViewCell {
                cell.setChecked(isSelected)
            }
        }
    }
}

extension MixUpViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        moveItemAt sourceIndexPath: IndexPath,
                        to destinationIndexPath: IndexPath) {

        let moved = music.remove(at: sourceIndexPath.item)
        music.insert(moved, at: destinationIndexPath.item)
    }
}
