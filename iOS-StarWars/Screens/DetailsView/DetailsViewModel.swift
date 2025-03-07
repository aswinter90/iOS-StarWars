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

protocol DetailsViewInteracting: ObservableObject {
    var navigationTitle: String { get }
    var listFields: [DetailsListField] { get }
    var factProvider: FactProviding { get }
}

class DetailsViewModel: DetailsViewInteracting {
    private static let nameFieldKeys = ["name", "title"]

    let factProvider: FactProviding

    private let model: any PresentableModel

    var navigationTitle: String {
        model.name
    }

    lazy var listFields: [DetailsListField] = {
        model.fields.compactMap { element in
            let (key, value) = element

            return if let value = value as? [URL] {
                .init(key: key, value: .urls(value))
            } else if let value = value as? URL {
                .init(key: key, value: .urls([value]))
            } else if let value = value as? String {
                Self.nameFieldKeys.contains(key) ? nil : .init(key: key, value: .string(value))
            } else if let value = value as? Date {
                .init(
                    key: key,
                    value: .string(Formatters.commonDateFormatter.string(from: value))
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
