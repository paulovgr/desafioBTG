//
//  QuotesView.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 07/07/21.
//


import UIKit

class QuotesView: UIView {
    // MARK: - Views
    let buttonList : UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.backgroundColor = .black
        button.setTitle("$", for: .normal)
        button.layer.cornerRadius = 10
        return button
    } ()
    
    let buttonConvort : UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.backgroundColor = .black
        button.setTitle("Converter", for: .normal)
        button.layer.cornerRadius = 10
        return button
    } ()
    
    
    let textField:  UITextField = {
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
    }()
    
    let label: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text  =  "oi"
        label.textAlignment  =  .center
        label.textColor =  .black
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setupViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension QuotesView: ViewCode {
    func setupViewHierarchy() {
        addSubview(buttonList)
        addSubview(textField)
        addSubview(buttonConvort)
        addSubview(label)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            buttonList.widthAnchor.constraint(equalToConstant: 71),
            buttonList.heightAnchor.constraint(equalTo: textField.heightAnchor, multiplier: 1),
            buttonList.trailingAnchor.constraint(equalTo: self.trailingAnchor,  constant: -40),
            buttonList.topAnchor.constraint(equalTo: self.textField.topAnchor),
        ])
        
        NSLayoutConstraint.activate([
            textField.heightAnchor.constraint(equalToConstant: 52),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            textField.topAnchor.constraint(equalTo: self.topAnchor, constant: 280),
            textField.trailingAnchor.constraint(equalTo: self.buttonList.leadingAnchor, constant: -12),
        ])
        
        NSLayoutConstraint.activate([
            buttonConvort.heightAnchor.constraint(equalTo: buttonList.heightAnchor),
            buttonConvort.leadingAnchor.constraint(equalTo: self.textField.leadingAnchor),
            buttonConvort.topAnchor.constraint(equalTo: self.textField.bottomAnchor, constant: 16),
            buttonConvort.trailingAnchor.constraint(equalTo: self.buttonList.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            label.heightAnchor.constraint(equalTo: buttonConvort.heightAnchor),
            label.leadingAnchor.constraint(equalTo: self.buttonConvort.leadingAnchor),
            label.topAnchor.constraint(equalTo: self.buttonConvort.bottomAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: self.buttonConvort.trailingAnchor)
        ])
        
    }
    
    
}
