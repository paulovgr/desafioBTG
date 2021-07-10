//
//  CurrenciesTableViewCell.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 08/07/21.
//

import UIKit

class CurrenciesTableViewCell: UITableViewCell {
    var currenciesLabel = DesignSystem.setupLabel(nil, 20)
    var favoriteButton = DesignSystem.setupButton("☆")
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension CurrenciesTableViewCell: ViewCode {
    func setupViewHierarchy() {
        addSubview(currenciesLabel)
        addSubview(favoriteButton)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            currenciesLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            currenciesLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            currenciesLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            currenciesLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
            
        ])
        
        NSLayoutConstraint.activate([
            favoriteButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            favoriteButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            favoriteButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            
        ])
    }
    
    func setupAditionalConfiguration() {
        self.favoriteButton.backgroundColor = .none
        self.favoriteButton.setTitleColor(.systemYellow, for: .normal)
        self.currenciesLabel.textAlignment = .left
        self.currenciesLabel.adjustsFontSizeToFitWidth = true
        
    }
    
    
}
