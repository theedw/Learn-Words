//
//  Languages.swift
//  New Language
//
//  Created by Kirill Guselnikov on 27.01.2023.
//

import Foundation

struct WordList: Codable {
    var english: [String]
    var turkish: [String]
    var german: [String]
    var spanish: [String]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.english = try container.decode([String].self, forKey: .english)
        self.turkish = try container.decode([String].self, forKey: .turkish)
        self.german = try container.decode([String].self, forKey: .german)
        self.spanish = try container.decode([String].self, forKey: .spanish)
    }
}



