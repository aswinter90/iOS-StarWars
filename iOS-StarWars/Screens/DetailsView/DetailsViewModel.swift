//
//  DetailsViewModel.swift
//  iOS-StarWars
//
//  Created by Arne-Sebastian Winter on 07.03.25.
//

import Foundation

struct ListField {
    let key: String
    let value: ListFieldValue
}
enum ListFieldValue {
    case string(String)
    case urls([URL])
}

enum DetailsState {
    case loadingFields
    case loaded
    case error(Error)
}

class DetailsViewModel: ObservableObject {
    let state = DetailsState.loadingFields
    let factProvider: FactProviding

    private let model: any PresentableModel

    var navigationTitle: String {
        model.name
    }

    lazy var listFields: [ListField] = {
        model.fields.map { element in
            let (key, value) = element

            return if let value = value as? [URL] {
                .init(key: key, value: ListFieldValue.urls(value))
            } else if let value = value as? String {
                .init(key: key, value: ListFieldValue.string(value))
            } else if let value = value as? Date {
                .init(
                    key: key,
                    value: ListFieldValue.string(Formatters.dayMonthYearFormatter.string(from: value))
                )
            } else {
                .init(key: key, value: ListFieldValue.string("\(value)"))
            }
        }
    }()

    init(model: any PresentableModel, factProvider: FactProviding) {
        self.model = model
        self.factProvider = factProvider

        prepareFields()
    }

    func prepareFields() {
        
    }
}
