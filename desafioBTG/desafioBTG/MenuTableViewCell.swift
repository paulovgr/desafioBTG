//
//  MenuTableViewCell.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 08/11/21.
//

import Foundation
import UIKit

class MenuTableViewCell: UITableViewCell {
    var pageName = DesignSystem.setupLabel("", 20)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "cell")
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension MenuTableViewCell: ViewCode {
    func setupViewHierarchy() {
        addSubview(pageName)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            pageName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            pageName.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    
}
