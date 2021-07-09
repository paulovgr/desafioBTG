//
//  CurrenciesTableViewCell.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 08/07/21.
//

import UIKit

class CurrenciesTableViewCell: UITableViewCell {
    var currenciesLabel = DesignSystem.setupLabel(nil, 20)
    
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
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            currenciesLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            currenciesLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            currenciesLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
    
    
}
