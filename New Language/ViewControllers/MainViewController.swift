//
//  ViewController.swift
//  New Language
//
//  Created by Kirill Guselnikov on 03.01.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    let nameLabel = UILabel()
    let turkishButton = UIButton()
    let germanButton = UIButton()
    let spanishButton = UIButton()
    
    let languages = ["🇹🇷 Turkish", "🇩🇪 German", "🇪🇸 Spanish"]
    
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(
            red: 247/255,
            green: 224/255,
            blue: 183/255,
            alpha: 1
        )
        
        title = "Learn Words"
        
        name = StorageManager.shared.fetchName()
        if name.isEmpty {
            showEnterNameAlert()
        } else {
            setupNameLabel()
            setupButtons()
            animateSubviews()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        name = StorageManager.shared.fetchName()
        if !name.isEmpty {
            setupNameLabel()
            nameLabel.alpha = 1
        }
    }
    
    private func setupNameLabel() {
        view.addSubview(nameLabel)
        
        nameLabel.text = "Hello, \(name)!"
        nameLabel.font = .systemFont(ofSize: 30, weight: .light)
        nameLabel.alpha = 0
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 18)
        ])
    }
    
    private func setupButtons() {
        view.addSubview(turkishButton)
        view.addSubview(germanButton)
        view.addSubview(spanishButton)
        
        turkishButton.configuration = ButtonConfiguaration.setupButton(
            title: languages[0],
            subtitle: "",
            titleFontSize: 30,
            leading: 20
        )
        germanButton.configuration = ButtonConfiguaration.setupButton(
            title: languages[1],
            subtitle: "Soon be available",
            titleFontSize: 30,
            leading: 20
        )
        spanishButton.configuration = ButtonConfiguaration.setupButton(
            title: languages[2],
            subtitle: "Soon be available",
            titleFontSize: 30,
            leading: 20
        )
        
        turkishButton.alpha = 0
        germanButton.alpha = 0
        spanishButton.alpha = 0
        
//        germanButton.isEnabled = false
//        spanishButton.isEnabled = false
        
        turkishButton.contentHorizontalAlignment = .leading
        germanButton.contentHorizontalAlignment = .leading
        spanishButton.contentHorizontalAlignment = .leading
        
        turkishButton.tag = 1
        germanButton.tag = 2
        
        ButtonConstrains.setupConstraints(
            button: turkishButton,
            topConstant: 60,
            view: view,
            topView: nameLabel
        )
        ButtonConstrains.setupConstraints(
            button: germanButton,
            topConstant: 100,
            view: view,
            topView: turkishButton
        )
        ButtonConstrains.setupConstraints(
            button: spanishButton,
            topConstant: 100,
            view: view,
            topView: germanButton
        )
        
        turkishButton.addTarget(self, action: #selector(pushWordsVC), for: .touchUpInside)
        germanButton.addTarget(self, action: #selector(pushWordsVC), for: .touchUpInside)
        spanishButton.addTarget(self, action: #selector(pushWordsVC), for: .touchUpInside)
    }
    
    @objc private func pushWordsVC(sender: UIButton) {
        let wordsVC = WordsViewController()
        let tag = sender.tag
        switch tag {
        case 1:
            wordsVC.selectedLanguage = languages[0]
        case 2:
            wordsVC.selectedLanguage = languages[1]
        default:
            wordsVC.selectedLanguage = languages[2]
        }
        navigationController?.pushViewController(wordsVC, animated: true)
    }
 
    private func animateSubviews() {
        UIView.animate(withDuration: 0.5, delay: 0.3) {
            self.nameLabel.alpha = 1
        }
        UIView.animate(withDuration: 0.5, delay: 0.5) {
            self.turkishButton.alpha = 1
        }
        UIView.animate(withDuration: 0.5, delay: 0.6) {
            self.germanButton.alpha = 1
        }
        UIView.animate(withDuration: 0.5, delay: 0.7) {
            self.spanishButton.alpha = 1
        }
    }
    
    private func showEnterNameAlert() {
        let alert = UIAlertController(
            title: "Hello!",
            message: "Enter your name",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            guard let name = alert.textFields?.first?.text else { return }
            self.nameLabel.text? += name
            StorageManager.shared.saveName(user: name)
            
            self.name = StorageManager.shared.fetchName()
            self.setupNameLabel()
            self.setupButtons()
            self.animateSubviews()
        }
        
        okAction.setValue(
            UIColor(
                red: 80/255,
                green: 50/255,
                blue: 27/255,
                alpha: 1),
            forKey: "titleTextColor"
        )
        alert.addAction(okAction)
        alert.addTextField { textField in
            textField.clearButtonMode = .whileEditing
        }
        self.present(alert, animated: true)
    }
}
