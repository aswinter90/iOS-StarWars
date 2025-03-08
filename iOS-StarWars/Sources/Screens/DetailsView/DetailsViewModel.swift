//
//  DetailsViewModel.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 07.03.25.
//

import Foundation

struct DetailsListField {
    enum Value {
        case string(String)
        case urls([URL])
    }

    let key: String
    let value: Value
}

protocol DetailsViewInteracting {
    var navigationTitle: String { get }
    var factProvider: FactProviding { get }
    var listFields: [DetailsListField] { get }
}

class DetailsViewModel: DetailsViewInteracting {
    private static let nameFieldKeys = ["name", "title"]

    var navigationTitle: String {
        model.name
    }

    private let model: any PresentableModel
    let factProvider: FactProviding

    lazy var listFields: [DetailsListField] = {
        model.properties.compactMap { element in
            let (key, value) = element

            return if let value = value as? [URL] {
                .init(key: key, value: .urls(value))
            } else if let value = value as? URL {
                .init(key: key, value: .urls([value]))
            } else if let value = value as? String {
                // Skip the name and title fields as they are already shown in the navigation title
                Self.nameFieldKeys.contains(key) ? nil : .init(key: key, value: .string(value))
            } else if let value = value as? Date {
                .init(
                    key: key,
                    value: .string(Formatters.listItemDateFormatter.string(from: value))
                )
            } else {
                .init(key: key, value: .string("\(value)"))
            }
        }
    }()

    init(model: any PresentableModel, factProvider: FactProviding) {
        self.model = model
        self.factProvider = factProvider
    }
}
