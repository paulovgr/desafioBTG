//
//  CurrenciesTableView.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 08/07/21.
//

import UIKit
import  CoreData


class CurrenciesTableView: UIView {
    private let currenciesViewModel: CurrenciesListViewModel?
    private let quotesViewModel: QuotesListViewModel?
    private let service: NetworkManager
    weak var delegate: QuoteDelegate?
    var quote: QuoteModel?
    var currencies  =  [CurrencyModel]()

    lazy var currenciesTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CurrenciesTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    required init(service: NetworkManager) {
        self.service = service
        self.quotesViewModel = QuotesListViewModel(service: service)
        self.currenciesViewModel = CurrenciesListViewModel(service: service)
        super.init(frame: .zero)
        setupViews()
        setupDatas()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CurrenciesTableView {
    private func setupDatas() {
        currenciesViewModel?.loadCurrenciesCoreData()
        quotesViewModel?.loadCoreData()
        if let currencies = currenciesViewModel?.currencies {
            self.currencies = currencies
        }
    }
    
    @objc func buttonSelected(sender: UIButton) {
        let buttonNumber = sender.tag
        currenciesTableView.beginUpdates()
        currenciesTableView.reloadRows(at: [IndexPath(row: buttonNumber, section: 0)], with: .automatic)
        
        if !currencies[buttonNumber].isFavorited {
            currencies[buttonNumber].isFavorited = true
        } else {
            currencies[buttonNumber].isFavorited = false
        }
        
        currenciesViewModel?.deleteData(model: currencies[buttonNumber])
        currenciesViewModel?.currencies.removeAll()
        setupDatas()
        currenciesTableView.endUpdates()
    }
    
}
extension CurrenciesTableView: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        quote = quotesViewModel?.quotes[indexPath.row]
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
        cell.currenciesLabel.text = "\(currencie.key) - \(currencie.value)"

        if currencie.isFavorited {
            cell.favoriteButton.setTitle(DesignSystem.starOn, for: .normal)
        } else {
            cell.favoriteButton.setTitle(DesignSystem.starOff, for: .normal)
        }
    
        cell.favoriteButton.addTarget(self, action: #selector(buttonSelected), for: .touchUpInside)
        cell.favoriteButton.tag = indexPath.row
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
