//
//  ButtonConfiguration.swift
//  New Language
//
//  Created by Kirill Guselnikov on 14.01.2023.
//

import UIKit

class ButtonConfiguaration: UIButton {
    
    static func setupButton(title: String, subtitle: String, titleFontSize: CGFloat, leading: CGFloat) -> UIButton.Configuration {
        var config: UIButton.Configuration = .filled()
        config.baseBackgroundColor = UIColor(red: 218/255, green: 179/255, blue: 116/255, alpha: 0.45)
        config.baseForegroundColor = .black
        config.title = title
        config.subtitle = subtitle
        config.titleAlignment = .leading
        config.contentInsets.leading = leading
        config.cornerStyle = .small
        config.attributedTitle = AttributedString(
            title,
            attributes: AttributeContainer(
                [NSAttributedString.Key.font:
                    UIFont.systemFont(ofSize: titleFontSize, weight: .medium)]
            )
        )
        config.attributedSubtitle = AttributedString(
            subtitle,
            attributes: AttributeContainer(
                [NSAttributedString.Key.font:
                    
                    UIFont.systemFont(ofSize: 17, weight: .regular)]
            )
        )
        return config
    }
}
