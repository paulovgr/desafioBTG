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
        setupTitle()
            self.navigationController?.present(CurrenciesViewController(), animated: true, completion: nil)        
        

    }

    override func loadView() {
        view = ConversionView()
    }

}

//fazer funcao
extension ConversionController {
    func setupTitle()  {
        self.navigationController?.navigationBar.topItem?.title = "Your Title"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}



