//
//  JSONLoader.swift
//  New Language
//
//  Created by Kirill Guselnikov on 10.02.2023.
//

import Foundation

class JSONLoader {
    
    func decode() -> WordList? {
        guard let url = Bundle.main.url(forResource: "Words", withExtension: "json") else { return nil }
        do {
            let data = try Data(contentsOf: url)
            let words = try JSONDecoder().decode(WordList.self, from: data)
            return words
            
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
