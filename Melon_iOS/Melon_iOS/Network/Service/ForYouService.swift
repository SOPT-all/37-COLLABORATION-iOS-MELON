//
//  ForYouService.swift
//  Melon_iOS
//
//  Created by mandoo on 11/25/25.
//

import Foundation

final class ForYouService {
    
    func fetchCustomSongs() async throws -> [CustomSongDTO] {
        return try await withUnsafeThrowingContinuation { continuation in
            
            NetworkProvider<ForYouAPI>.request(
                .fetchCustom,
                type: [CustomSongDTO].self
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
    
    func fetchAlbumSongs(albumId: Int) async throws -> AlbumDTO {
        return try await withUnsafeThrowingContinuation { continuation in
            
            NetworkProvider<ForYouAPI>.request(
                .fetchAlbum(albumId: albumId),
                type: AlbumDTO.self
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
