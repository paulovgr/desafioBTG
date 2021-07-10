//
//  CurrenciesListViewModel.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 06/07/21.
//

import Foundation
import CoreData
import UIKit

class CurrenciesListViewModel {
    private var service = NetworkManager()
    weak var delegate: CurrencyDelegate?
    var delegateError: MessageDelegate?
    var currencies  =  [CurrencyModel]()
    
    init() {
        service.delegateError = self
    }
    
    func requestCurrencie(completion: @escaping (Result<CurrenciesListModel, Error>) -> Void) {
        service.request(endpoint: .list, completion: completion)
    }
    
    
}

extension CurrenciesListViewModel: MessageDelegate{
    func showMessage() {
        delegateError?.showMessage()
    }
}

extension CurrenciesListViewModel{
    func setCurrencies()  {
        requestCurrencie { [self] result in
            switch result {
            case .success(let data):
                let datas = Array(data.currencies.map{$0})
                for data in datas {
                    saveCurrenciesCoreData(CurrencyModel(data.value, data.key))
                }
                
                UserDefaults.standard.set(true, forKey: "loadData")
                delegate?.PassCurrencies()
            case .failure(let anError):
                print(anError)
            }
        }
    }
    
    func saveCurrenciesCoreData(_ currenciesArray: CurrencyModel){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "Currency", in: context)!
        let data = NSManagedObject(entity: userEntity, insertInto: context)
        
        data.setValue(currenciesArray.value, forKey: "value")
        data.setValue(currenciesArray.key, forKey: "key")
        
        do{
            try context.save()
        }catch{
            print(error.localizedDescription)
        }
        
    }
    
    func loadCurrenciesCoreData (){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Currency")
    
        do {
            let result = try context.fetch(fetchRequest)
            for data in result as! [NSManagedObject]{
                self.currencies.append(CurrencyModel(data.value(forKey: "value") as! String,
                                                     data.value(forKey: "key") as! String))
            }
            self.currencies.sort {
                $0.key < $1.key
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}







