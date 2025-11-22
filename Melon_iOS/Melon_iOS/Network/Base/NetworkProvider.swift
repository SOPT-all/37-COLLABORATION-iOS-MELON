//
//  NetworkProvider.swift
//  Melon_iOS
//

import Foundation
import Moya

final class NetworkProvider<API: TargetType> {

    // MARK: - API Calls
    
    static func request<T: Decodable>(
        _ target: API,
        type: T.Type,
        completion: @escaping (Result<T, NetworkError>) -> Void
    ) {
        let provider = MoyaProvider<API>(plugins: [NetworkLogger()])

        provider.request(target) { result in
            switch result {

            case .success(let response):

                switch response.statusCode {
                case 200...299:
                    break
                case 401:
                    completion(.failure(.unauthorized))
                    return
                case 403:
                    completion(.failure(.forbidden))
                    return
                case 404:
                    completion(.failure(.notFound))
                    return
                case 500...599:
                    let msg = String(data: response.data, encoding: .utf8) ?? "Server Error"
                    completion(.failure(.serverError(msg)))
                    return
                default:
                    completion(.failure(.unknown))
                    return
                }

                do {
                    let decoded = try JSONDecoder().decode(GenericResponse<T>.self, from: response.data)
                    completion(.success(decoded.result))
                } catch {
                    completion(.failure(.decoding))
                }

            case .failure:
                completion(.failure(.networkFail))
            }
        }
    }
}
