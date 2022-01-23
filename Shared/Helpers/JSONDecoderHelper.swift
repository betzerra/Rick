//
//  JSONDecoderHelper.swift
//  Rick
//
//  Created by Ezequiel Becerra on 23/01/2022.
//

import Foundation

class JSONDecoderHelper {
    static let formatter = ISO8601DateFormatter()

    static var decoder: JSONDecoder = {
        var decoder = JSONDecoder()

        decoder.dateDecodingStrategy = .custom({ decoder in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)

            formatter.formatOptions = [.withFractionalSeconds]
            if let date = formatter.date(from: dateString) {
                return date
            }

            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Cannot decode date string \(dateString)"
            )
        })

        return decoder
    }()
}
