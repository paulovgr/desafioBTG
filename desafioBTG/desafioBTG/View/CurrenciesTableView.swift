//
//  CurrenciesTableView.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 08/07/21.
//

import UIKit
import  CoreData
class CurrenciesTableView: UIView {
    weak var delegate: QuoteDelegate?

    let currencyViewModel  = CurrenciesListViewModel()
    var currencies  =  [CurrencyModel]()
    let quotesViewModel  = QuotesViewModel()

    // MARK: - Views
    lazy var currenciesTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CurrenciesTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        setupViews()
        currencyViewModel.loadCoreData()
        self.currencies = currencyViewModel.currencies
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension CurrenciesTableView: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        quotesViewModel.setQuotes(initials: currencies[indexPath.item].key)
        DispatchQueue.main.async {
            print(self.quotesViewModel.selectedCurrencies)

        }
    }
}

extension CurrenciesTableView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.count
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CurrenciesTableViewCell
        cell.setupViews()

        let currencie = currencies[indexPath.item]
        cell.currenciesLabel.text = "\(currencie.key)  = \(currencie.value)"
        return cell
    }
}

extension CurrenciesTableView: ViewCode {
    func setupViewHierarchy() {
        addSubview(currenciesTableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
        currenciesTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        currenciesTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        currenciesTableView.topAnchor.constraint(equalTo: self.topAnchor),
        currenciesTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    
}
