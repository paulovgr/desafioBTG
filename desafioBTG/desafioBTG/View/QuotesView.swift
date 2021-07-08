//
//  QuotesView.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 07/07/21.
//


import UIKit

class QuotesView: UIView {
    // MARK: - Views
    //  fazer um botao generico
    private let startQuotesButton : UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.backgroundColor = .black
        button.setTitle("$", for: .normal)
        button.layer.cornerRadius = 10
        return button
    } ()
    
    private let convertButton : UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.backgroundColor = .black
        button.setTitle("Converter", for: .normal)
        button.layer.cornerRadius = 10
        return button
    } ()
    
    private let finalQuotesButton : UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.backgroundColor = .black
        button.setTitle("$", for: .normal)
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
    
    private let resultLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text  =  "oi"
        label.textAlignment  =  .center
        label.textColor =  .black
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }()
    
    private let arrowLabel: UILabel = {
        let labelConvort = UILabel(frame: .zero)
        labelConvort.translatesAutoresizingMaskIntoConstraints = false
        labelConvort.text  =  "→"
        labelConvort.textAlignment  =  .center
        labelConvort.textColor =  .black
        labelConvort.font = UIFont.systemFont(ofSize: 30)
        return labelConvort
    }()
    
    init() {
        super.init(frame: .zero)
        setupViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func convertButtonTapped() {
        print("1" )
    }
    
    @objc func finalQuotesButtonTapped() {
        print("2" )

    }
    
    @objc func listButtonTapped() {
        print("3" )

    }
}

extension QuotesView: ViewCode {
    func setupViewHierarchy() {
        addSubview(startQuotesButton)
        addSubview(textField)
        addSubview(convertButton)
        addSubview(resultLabel)
        addSubview(arrowLabel)
        addSubview(finalQuotesButton)
        

    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            startQuotesButton.heightAnchor.constraint(equalTo: textField.heightAnchor, multiplier: 1),
            startQuotesButton.leadingAnchor.constraint(equalTo: self.textField.leadingAnchor),
            startQuotesButton.bottomAnchor.constraint(equalTo: self.textField.topAnchor, constant: -12),
            startQuotesButton.trailingAnchor.constraint(equalTo: self.arrowLabel.leadingAnchor, constant: -11),

        ])
        
        NSLayoutConstraint.activate([
            textField.heightAnchor.constraint(equalToConstant: 52),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            textField.topAnchor.constraint(equalTo: self.topAnchor, constant: 280),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
        ])
        
        NSLayoutConstraint.activate([
            convertButton.heightAnchor.constraint(equalTo: startQuotesButton.heightAnchor),
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
            finalQuotesButton.leadingAnchor.constraint(equalTo: self.arrowLabel.trailingAnchor, constant: 11),
            finalQuotesButton.heightAnchor.constraint(equalTo: textField.heightAnchor, multiplier: 1),
            finalQuotesButton.trailingAnchor.constraint(equalTo: self.textField.trailingAnchor),
            finalQuotesButton.bottomAnchor.constraint(equalTo: self.textField.topAnchor, constant: -12),
        ])
        
    }
    
    func setupAditionalConfiguration() {
        convertButton.addTarget(self, action: #selector(convertButtonTapped), for: .touchUpInside)
        finalQuotesButton.addTarget(self, action: #selector(finalQuotesButtonTapped), for: .touchUpInside)
        startQuotesButton.addTarget(self, action: #selector(listButtonTapped), for: .touchUpInside)
    }
    
    
}
