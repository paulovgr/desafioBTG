//
//  MenuTableView.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 08/11/21.
//

import Foundation
import UIKit

protocol MenuDelegate {
    func goToPage (indexPath: Int)
}
class MenuTableView: UIView {
    private let pageNames = ["Conversor de moedas"]
    var delegate: MenuDelegate?
    lazy var pageNamesTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MenuTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.goToPage(indexPath: indexPath.row)
    }
}

extension MenuTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  pageNames.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuTableViewCell
        cell.pageName.text = pageNames[indexPath.row]
        
        return cell
    }
    
    
}

extension MenuTableView: ViewCode {
    func setupViewHierarchy() {
        addSubview(pageNamesTableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            pageNamesTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            pageNamesTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            pageNamesTableView.topAnchor.constraint(equalTo: self.topAnchor),
            pageNamesTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    
}
