//
//  ViewController.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 06/07/21.
//

import UIKit

class ConversionController: UIViewController {
    let viewModel  = CurrenciesListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setQuotes()
        // Do any additional setup after loading the view.
    }


}

