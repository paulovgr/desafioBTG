//
//  CurrenciesListViewModel.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 06/07/21.
//

import Foundation
import CoreData
import UIKit

protocol CurrencyDelegate: AnyObject {
    func PassCurrencies()
}

class CurrenciesListViewModel   {
    private var service = NetworkManager()
    weak var delegate: CurrencyDelegate?
    var currencies  =  [CurrencieModel]()
 
    var managedObjectContext: NSManagedObjectContext?

    func requestQuote(completion: @escaping (Result<CurrenciesListModel, Error>) -> Void) {
        service.request(endpoint: .list, completion: completion)
    }
    
    func setQuotes()  {
        requestQuote { [self] result in
            switch result {
            case .success(let data):

                    let datas = Array(data.currencies.map{$0})
                    for data in datas {
                        saveCurrenciesCoreData(CurrencieModel(data.value, data.key))
                    }
                    delegate?.PassCurrencies()
               
                
            case .failure(let anError):
                print(anError)

            }
        }
    }
    
    func saveCurrenciesCoreData(_ currenciesArray: CurrencieModel){
         
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        let context = appDelegate.persistentContainer.viewContext
         let userEntity = NSEntityDescription.entity(forEntityName: "Currencie", in: context)!
         let imagemN = NSManagedObject(entity: userEntity, insertInto: context)
        imagemN.setValue(currenciesArray.value, forKey: "value")
        imagemN.setValue(currenciesArray.key, forKey: "key")

         
         do{
             //persistindo as mudanças
             try context.save()
         }catch{
             //printando o erro caso nao consiga salvar
             print(error.localizedDescription)
         }
         
     }
    
    func loadCoreData (){
         let appDelegate = UIApplication.shared.delegate as! AppDelegate
         let context = appDelegate.persistentContainer.viewContext
         

         let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Currencie")

         
         do {
             let result = try context.fetch(fetchRequest)
             for data in result as! [NSManagedObject]{
                self.currencies.append(CurrencieModel(data.value(forKey: "value") as! String, data.value(forKey: "key") as! String))

             }
            
         } catch {
             print(error.localizedDescription)
         }
     }
}







