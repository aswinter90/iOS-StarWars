//
//  Formatters.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 05.03.25.
//

import Foundation

enum Formatters {
    static let iso8601Formatter: DateFormatter = {
        // swiftlint:disable:next line_length
        // This could also be replaced with a dedicated `ISO8601DateFormatter`, but that would require more boilerplate on the side of the `JSONDecoder` when defining its `dateDecodingStrategy`.
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        return dateFormatter
    }()

    static let listItemDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("yyyy-MM-dd")
        return dateFormatter
    }()
}
