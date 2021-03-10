//
//  SampleModel.swift
//  Pryaniky.com
//
//  Created by Akmaral on 3/7/21.
//

import Foundation

struct SampleModel: Decodable {
    let data: [DataResult]
    let view: [String]

    enum CodingKeys: CodingKey {
        case data, view
    }
}

struct DataResult: Decodable {
    let name: String
    let data: NameData


    enum CodingKeys: String, CodingKey {
        case name
        case data
    }
}

struct NameData: Decodable {
    let text: String?
    let url: String?
    let selectedId: Int?
    let variants: [Variants]?
    
    enum CodingKeys: String, CodingKey {
        case text
        case url
        case selectedId
        case variants
    }
    
}
struct Variants: Decodable {
    let variantText: String
    let id: Int
    
    enum CodingKeys: String, CodingKey {
        case variantText = "text"
        case id
    }
    
}
