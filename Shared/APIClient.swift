//
//  APIClient.swift
//  Rick
//
//  Created by Ezequiel Becerra on 23/01/2022.
//

import Combine
import Foundation

enum APIClientError: Error {
    case unknown
}

class APIClient {
    let baseURL = URL(string: "https://rickandmortyapi.com/api/")!

    var urlSession = URLSession.shared

    func characters(page: Int) -> AnyPublisher<[Character], Error> {
        let url = baseURL.appendingPathComponent("character")
        var components = URLComponents(string: url.absoluteString)
        components?.query = "page=\(page)"

        guard let pagedURL = components?.url else {
            return Fail(error: APIClientError.unknown).eraseToAnyPublisher()
        }

        return urlSession.dataTaskPublisher(for: pagedURL)
            .map(\.data)
            .decode(type: CharacterResponse.self, decoder: JSONDecoderHelper.decoder)
            .map(\.results)
            .eraseToAnyPublisher()
    }
}
