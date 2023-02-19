//
//  RandomWordsGenerator.swift
//  New Language
//
//  Created by Kirill Guselnikov on 14.02.2023.
//

import Foundation

class RandomWordsGenerator {
    
    var decoder = JSONLoader()
    
    func getRandomWord(title: String) -> String {
        let mainVC = MainViewController()
        var language = ""
        
        if mainVC.languages[0] == title {
            guard let turkishWord = decoder.decode()?.turkish.randomElement() else { return "" }
            language = turkishWord
        } else if mainVC.languages[1] == title {
            guard let germanWord = decoder.decode()?.german.randomElement() else { return ""}
            language = germanWord
        } else {
            guard let spanishWord = decoder.decode()?.spanish.randomElement() else { return ""}
            language = spanishWord
        }
        
        return language
    }
}
