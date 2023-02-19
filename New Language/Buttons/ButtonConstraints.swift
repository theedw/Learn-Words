//
//  ButtonConstraints.swift
//  New Language
//
//  Created by Kirill Guselnikov on 14.01.2023.
//

import UIKit

class ButtonConstrains {
    
    static func setupConstraints(button: UIButton, topConstant: CGFloat, view: UIView, topView: UIView ) {
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topView.topAnchor, constant: topConstant),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
}
