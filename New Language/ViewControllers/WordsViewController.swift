//
//  SelectedLanguageVC.swift
//  New Language
//
//  Created by Kirill Guselnikov on 15.01.2023.
//

import UIKit

class WordsViewController: UIViewController {
    
    let mainWordLabel = UILabel()
    let transcriptionLabel = UILabel()
    let firstOptionButton = UIButton()
    let secondOptionButton = UIButton()
    let thirdOptionButton = UIButton()
    let fourthOptionButton = UIButton()
        
    var selectedLanguage = ""
    
    var questionWord = ""
    var firstOptionWord = "Option1"
    var secondOptionWord = "Option2"
    var thirdOptionWord = "Option3"
    var fourthOptionWord = "Option4"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(
            red: 247/255,
            green: 224/255,
            blue: 183/255,
            alpha: 1
        )
        navigationController?.navigationBar.tintColor = UIColor(
            red: 80/255,
            green: 50/255,
            blue: 27/255,
            alpha: 1
        )
        
        title = selectedLanguage
        
        setupRandomWord()
        setupLabels()
        setupOptionButtons()
        animateSubviews()
    }
    
    private func setupRandomWord() {
        let randomWord = RandomWordsGenerator()
        questionWord = randomWord.getRandomWord(title: selectedLanguage)
    }
    
    private func setupLabels() {
        view.addSubview(mainWordLabel)
        view.addSubview(transcriptionLabel)
        
        mainWordLabel.text = questionWord
        mainWordLabel.font = .systemFont(ofSize: 35)
        mainWordLabel.textColor = .black
        mainWordLabel.alpha = 0
        mainWordLabel.translatesAutoresizingMaskIntoConstraints = false
        
        transcriptionLabel.text = "[test wɜːd]"
        transcriptionLabel.font = .systemFont(ofSize: 20, weight: .light)
        transcriptionLabel.textColor = .black
        transcriptionLabel.alpha = 0
        transcriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainWordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainWordLabel.centerYAnchor.constraint(
                equalTo: view.centerYAnchor,
                constant: -70),
            
            transcriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            transcriptionLabel.topAnchor.constraint(
                equalTo: mainWordLabel.bottomAnchor,
                constant: 5)
        ])
    }
    
    private func setupOptionButtons() {
        view.addSubview(firstOptionButton)
        view.addSubview(secondOptionButton)
        view.addSubview(thirdOptionButton)
        view.addSubview(fourthOptionButton)
        
        firstOptionButton.configuration = ButtonConfiguaration.setupButton(
            title: firstOptionWord,
            subtitle: "",
            titleFontSize: 20,
            leading: 0
        )
        secondOptionButton.configuration = ButtonConfiguaration.setupButton(
            title: secondOptionWord,
            subtitle: "",
            titleFontSize: 20,
            leading: 0
        )
        thirdOptionButton.configuration = ButtonConfiguaration.setupButton(
            title: thirdOptionWord,
            subtitle: "",
            titleFontSize: 20,
            leading: 0
        )
        fourthOptionButton.configuration = ButtonConfiguaration.setupButton(
            title: fourthOptionWord,
            subtitle: "",
            titleFontSize: 20,
            leading: 0
        )
        
        firstOptionButton.alpha = 0
        secondOptionButton.alpha = 0
        thirdOptionButton.alpha = 0
        fourthOptionButton.alpha = 0
        
        firstOptionButton.translatesAutoresizingMaskIntoConstraints = false
        secondOptionButton.translatesAutoresizingMaskIntoConstraints = false
        thirdOptionButton.translatesAutoresizingMaskIntoConstraints = false
        fourthOptionButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            thirdOptionButton.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -15),
            thirdOptionButton.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20),
            thirdOptionButton.widthAnchor.constraint(
                equalTo: view.widthAnchor,
                multiplier: 1/2.3),
            thirdOptionButton.heightAnchor.constraint(equalToConstant: 80),
            
            fourthOptionButton.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -15),
            fourthOptionButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -20),
            fourthOptionButton.widthAnchor.constraint(
                equalTo: view.widthAnchor,
                multiplier: 1/2.3),
            fourthOptionButton.heightAnchor.constraint(
                equalToConstant: 80),
            
            firstOptionButton.bottomAnchor.constraint(
                equalTo: thirdOptionButton.topAnchor,
                constant: -10),
            firstOptionButton.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20),
            firstOptionButton.widthAnchor.constraint(
                equalTo: view.widthAnchor,
                multiplier: 1/2.3),
            firstOptionButton.heightAnchor.constraint(equalToConstant: 80),
            
            secondOptionButton.bottomAnchor.constraint(
                equalTo: fourthOptionButton.topAnchor,
                constant: -10),
            secondOptionButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -20),
            secondOptionButton.widthAnchor.constraint(
                equalTo: view.widthAnchor,
                multiplier: 1/2.3),
            secondOptionButton.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func animateSubviews() {
        UIView.animate(withDuration: 0.4, delay: 0.1) {
            self.mainWordLabel.alpha = 1
        }
        UIView.animate(withDuration: 0.4, delay: 0.2) {
            self.transcriptionLabel.alpha = 0 //скрыто временно!
        }
        UIView.animate(withDuration: 0.4, delay: 0.3) {
            self.firstOptionButton.alpha = 1
        }
        UIView.animate(withDuration: 0.4, delay: 0.4) {
            self.secondOptionButton.alpha = 1
        }
        UIView.animate(withDuration: 0.4, delay: 0.5) {
            self.thirdOptionButton.alpha = 1
        }
        UIView.animate(withDuration: 0.4, delay: 0.6) {
            self.fourthOptionButton.alpha = 1
        }
        
    }
}
