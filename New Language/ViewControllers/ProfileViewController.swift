//
//  ProfileViewController.swift
//  New Language
//
//  Created by Kirill Guselnikov on 07.01.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let changeNameButton = UIButton()
    let nameLabel = UILabel()
    
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 247/255, green: 224/255, blue: 183/255, alpha: 1)
        title = "Profile"
        
        name = StorageManager.shared.fetchName()
        
        setupChangeNameButton()
    }
    
    private func setupChangeNameButton() {
        view.addSubview(changeNameButton)
        
        changeNameButton.addTarget(self, action: #selector(changeName), for: .touchUpInside)
        changeNameButton.configuration = ButtonConfiguaration.setupButton(
            title: "Change name",
            subtitle: name,
            titleFontSize: 25,
            leading: -130
        )
        
        ButtonConstrains.setupConstraints(button: changeNameButton, topConstant: 180, view: view, topView: view)
    }
    
    @objc private func changeName() {
        let alert = UIAlertController(title: "Change Name", message: "", preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        let saveButton = UIAlertAction(title: "Save", style: .default) { _ in
            let name = alert.textFields?.first
            guard let newName = name?.text else { return }
            StorageManager.shared.saveName(user: newName)
            self.viewDidLoad()
        }
        cancelButton.setValue(
            UIColor(
                red: 80/255,
                green: 50/255,
                blue: 27/255,
                alpha: 1),
            forKey: "titleTextColor"
        )
        saveButton.setValue(
            UIColor(
                red: 80/255,
                green: 50/255,
                blue: 27/255,
                alpha: 1),
            forKey: "titleTextColor"
        )
        alert.addAction(saveButton)
        alert.addAction(cancelButton)
        alert.addTextField { textField in
            textField.clearButtonMode = .whileEditing
        }
        self.present(alert, animated: true)
    }
}
