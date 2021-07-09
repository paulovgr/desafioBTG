//
//  DesignSystem.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 08/07/21.
//

import Foundation
import UIKit

class DesignSystem {
    
    static func setupButton(_ textLabel: String) -> UIButton{
        let button = UIButton(frame: .zero)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.backgroundColor = .black
        button.setTitle(textLabel, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }
    
    static func setupLabel(_ textLabel: String?, _ textSize: CGFloat) -> UILabel{
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = textLabel
        label.textAlignment  =  .center
        label.textColor =  .black
        label.font = UIFont.systemFont(ofSize: textSize)
        return label
    }
    static func setupTextField() -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.layer.borderColor =  UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius =  10
        textField.keyboardType  = .decimalPad
        textField.textAlignment = .right
        textField.font = UIFont.boldSystemFont(ofSize: 30)
        return textField
    }
}


