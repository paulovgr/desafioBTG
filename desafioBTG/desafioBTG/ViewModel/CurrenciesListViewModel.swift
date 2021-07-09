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
    func PassCurrencies(currencie: [CurrencieModel])
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
                    saveImageCoreData(CurrencieModel(data.value, data.key))

                }
                 loadCoreData()
            case .failure(let anError):
                print(anError)

            }
        }
    }
    
    func saveImageCoreData(_ isso: CurrencieModel){
         
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        let context = appDelegate.persistentContainer.viewContext
         let userEntity = NSEntityDescription.entity(forEntityName: "Currencie", in: context)!
         let imagemN = NSManagedObject(entity: userEntity, insertInto: context)
        imagemN.setValue(isso.value, forKey: "value")
        imagemN.setValue(isso.key, forKey: "key")

         
         do{
             //persistindo as mudanças
             try context.save()
         }catch{
             //printando o erro caso nao consiga salvar
             print(error.localizedDescription)
         }
         
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







