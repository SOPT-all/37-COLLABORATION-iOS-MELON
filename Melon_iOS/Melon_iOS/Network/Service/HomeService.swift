//
//  HomeService.swift
//  Melon_iOS
//
//  Created by 이승준 on 11/24/25.
//

import Foundation

final class HomeService {
    
    func fetchPopularSongs() async throws -> [PopularSongDTO] {
        return try await withCheckedThrowingContinuation { continuation in
            NetworkProvider<HomeAPI>.request(
                .fetchPopular,
                type: [PopularSongDTO].self
            ) { result in
                switch result {
                case .success(let data):
                   continuation.resume(returning: data)

                case .failure(let error):
                   continuation.resume(throwing: error)
                }
            }
        }
    }
    
    func fetchNewestSongs(area: NewestArea = .all) async throws -> [NewestSongDTO] {
        return try await withCheckedThrowingContinuation { continuation in
            NetworkProvider<HomeAPI>.request(
                .fetchNewest(area),
                type: [NewestSongDTO].self
            ) { result in
                switch result {
                case .success(let data):
                    continuation.resume(returning: data)
                case .failure(let error):
                   continuation.resume(throwing: error)
                }
            }
        }
    }
    
    func fetchChartSongs() async throws -> [ChartSongDTO] {
        return try await withCheckedThrowingContinuation { continuation in
            NetworkProvider<HomeAPI>.request(
                .fetchChart,
                type: [ChartSongDTO].self
            ) { result in
                switch result {
                case .success(let data):
                    continuation.resume(returning: data)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
