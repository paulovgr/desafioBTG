//
//  CurrenciesTableView.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 08/07/21.
//

import UIKit
import  CoreData
class CurrenciesTableView: UIView {
    let viewModel  = CurrenciesListViewModel()
    var currencies  =  [CurrencieModel]()

    // MARK: - Views
    lazy var currenciesTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemPink
        tableView.register(CurrenciesTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        setupViews()
        viewModel.delegate =  self
        loadCoreData()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func loadCoreData (){
         
         // limpando o array para que nao de erro caso essa funcao seja chamada mais de uma vez
         
         // buscando o context
         let appDelegate = UIApplication.shared.delegate as! AppDelegate
         let context = appDelegate.persistentContainer.viewContext
         
         // criando uma requisicao e buscando os dados
         let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Currencie")
      //   let sortDescriptor = NSSortDescriptor(key: "id", ascending: true)
         
     //    fetchRequest.sortDescriptors = [sortDescriptor]
         
         do {
             let result = try context.fetch(fetchRequest)
             for data in result as! [NSManagedObject]{
                 // adicionando o nome da imagem ao array
                self.currencies.append(CurrencieModel(data.value(forKey: "value") as! String, data.value(forKey: "key") as! String))

             }
         } catch {
             print(error.localizedDescription)
         }
     }
}

extension CurrenciesTableView: UITableViewDelegate{

}

extension CurrenciesTableView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.capacity
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CurrenciesTableViewCell
        let currencie = currencies[indexPath.row]
        cell.setupViews()
        
        cell.backgroundColor = .green
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
extension CurrenciesTableView: CurrencyDelegate{
    func PassCurrencies(currencie: [CurrencieModel]) {
        currencies = currencie
    }
}
