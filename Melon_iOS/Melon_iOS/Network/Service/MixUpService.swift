//
//  MixUpService.swift
//  Melon_iOS
//
//  Created by 조영서 on 11/22/25.
//

import Foundation

final class MixUpService {
    
    func fetchSongs() async throws -> [MixUpDTO] {
        return try await withCheckedThrowingContinuation { continuation in

            NetworkProvider<MixUpAPI>.request(
                .fetchMixUp,
                type: [MixUpDTO].self
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
