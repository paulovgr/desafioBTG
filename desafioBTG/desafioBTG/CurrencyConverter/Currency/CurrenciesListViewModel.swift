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
    private var service: NetworkManager
    var delegateError: MessageDelegate?
    var currencies  =  [CurrencyModel]()
    
   
    
    required init(service: NetworkManager) {
        self.service = service
        self.service.delegateError = self

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
                    saveCurrenciesCoreData(CurrencyModel(data.value, data.key, false))
                }
                UserDefaults.standard.set(true, forKey: "loadData")
            case .failure(_):
                setCurrencies()
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
        data.setValue(currenciesArray.isFavorited, forKey: "isFavorited")

        
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
                                                     data.value(forKey: "key") as! String,
                                                     data.value(forKey: "isFavorited") as! Bool))
            }
            self.currencies.sort {
                $0.key < $1.key
            }
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteData(model: CurrencyModel) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Currency")
        
         if let result = try?  context.fetch(fetchRequest){
            for object in result as! [NSManagedObject]{
                if object.value(forKey: "key") as! String  == model.key  {
                    let userEntity = NSEntityDescription.entity(forEntityName: "Currency", in: context)!

                    let data = NSManagedObject(entity: userEntity, insertInto: context)
                    if !(object.value(forKey: "isFavorited") as! Bool) {
                        context.delete(object)
                        data.setValue(model.value, forKey: "value")
                        data.setValue(model.key, forKey: "key")
                        data.setValue(true, forKey: "isFavorited")
                    } else {
                        context.delete(object )
                        data.setValue(model.value, forKey: "value")
                        data.setValue(model.key, forKey: "key")
                        data.setValue(false, forKey: "isFavorited")
                    }

                }
            }
        }
        
        do{
            try context.save()
       }catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        
    }

}







