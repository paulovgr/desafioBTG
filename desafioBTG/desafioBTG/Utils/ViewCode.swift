//
//  ViewCode.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 07/07/21.
//

import Foundation

protocol ViewCode {
    func setupViews()
    func setupViewHierarchy()
    func setupConstraints()
    func setupAditionalConfiguration()
}

extension ViewCode {
    func setupViews() {
        setupViewHierarchy()
        setupConstraints()
        setupAditionalConfiguration()
    }
    
    func setupAditionalConfiguration() { }
}

