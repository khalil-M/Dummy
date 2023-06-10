//
//  NetworkManager.swift
//  Dummy
//
//  Created by Khalil on 6/10/23.
//

import Foundation
import Combine

final class NetworkManager<T: Codable> {
    static func fetch(from productUrl: String) -> AnyPublisher<T, NetworkError> {
        let url = URL(string: productUrl)!
        let publisher = URLSession.shared.dataTaskPublisher(for: url)
        return publisher
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                switch error {
                case is Swift.DecodingError:
                    print(error.localizedDescription)
                    return NetworkError.invalidResponse
                default:
                    return NetworkError.nilResponse
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

enum NetworkError: Error {
    case invalidResponse
    case nilResponse
}
