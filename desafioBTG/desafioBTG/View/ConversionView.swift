//
//  QuotesView.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 07/07/21.
//


import UIKit

class ConversionView: UIView {
    // MARK: - Views
     let originButton = DesignSystem.setupButton("$")
     let convertButton = DesignSystem.setupButton("Converter")
     let destinyButton = DesignSystem.setupButton("$")
    private let textField = DesignSystem.setupTextField()
    private let resultLabel = DesignSystem.setupLabel("Resultado", 30)
    private let arrowLabel = DesignSystem.setupLabel("→", 30)

    
    func setupLabel (_ text: String){
        resultLabel.text = text
    }
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    
  
  
}

extension ConversionView: ViewCode {
    func setupViewHierarchy() {
        addSubview(originButton)
        addSubview(textField)
        addSubview(convertButton)
        addSubview(resultLabel)
        addSubview(arrowLabel)
        addSubview(destinyButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            originButton.heightAnchor.constraint(equalTo: textField.heightAnchor, multiplier: 1),
            originButton.leadingAnchor.constraint(equalTo: self.textField.leadingAnchor),
            originButton.bottomAnchor.constraint(equalTo: self.textField.topAnchor, constant: -12),
            originButton.trailingAnchor.constraint(equalTo: self.arrowLabel.leadingAnchor, constant: -11),
            
        ])
        
        NSLayoutConstraint.activate([
            textField.heightAnchor.constraint(equalToConstant: 52),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            textField.topAnchor.constraint(equalTo: self.topAnchor, constant: 280),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
        ])
        
        NSLayoutConstraint.activate([
            convertButton.heightAnchor.constraint(equalTo: originButton.heightAnchor),
            convertButton.leadingAnchor.constraint(equalTo: self.textField.leadingAnchor),
            convertButton.topAnchor.constraint(equalTo: self.textField.bottomAnchor, constant: 16),
            convertButton.trailingAnchor.constraint(equalTo: self.textField.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            resultLabel.heightAnchor.constraint(equalTo: convertButton.heightAnchor),
            resultLabel.leadingAnchor.constraint(equalTo: self.convertButton.leadingAnchor),
            resultLabel.topAnchor.constraint(equalTo: self.convertButton.bottomAnchor, constant: 16),
            resultLabel.trailingAnchor.constraint(equalTo: self.convertButton.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            arrowLabel.heightAnchor.constraint(equalTo: convertButton.heightAnchor),
            arrowLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            arrowLabel.bottomAnchor.constraint(equalTo: self.textField.topAnchor, constant: -12),
        ])
        
        NSLayoutConstraint.activate([
            destinyButton.leadingAnchor.constraint(equalTo: self.arrowLabel.trailingAnchor, constant: 11),
            destinyButton.heightAnchor.constraint(equalTo: textField.heightAnchor, multiplier: 1),
            destinyButton.trailingAnchor.constraint(equalTo: self.textField.trailingAnchor),
            destinyButton.bottomAnchor.constraint(equalTo: self.textField.topAnchor, constant: -12),
        ])
        
    }
    

    
 
    
}
