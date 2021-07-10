//
//  QuotesViewModel.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 09/07/21.
//

import Foundation
import CoreData
import UIKit
protocol QuoteDelegate: AnyObject {
    func PassQuote(_ value: Double)
    
}

class QuotesViewModel   {
    private var service = NetworkManager()
    var selectedCurrencies  = Double()
    var quotes = [QuoteModel]()

    func requestQuote(completion: @escaping (Result<QuotesListModel, Error>) -> Void) {
        service.request(endpoint: .live , completion: completion)
    }
    
    func setQuotes()  {
        requestQuote() { [self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let datas = Array(data.quotes.map{$0})
                    for data in datas {
                        saveQuotesCoreData(QuoteModel(data.value, data.key))
                    }
                }
                                
            case .failure(_):
                setQuotes()

            }
        }
    }
    
    func convertValue(from: Double, to: Double) -> Double{
        return from/to
    }
    
    func saveQuotesCoreData(_ quotesArray: QuoteModel){
         
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        let context = appDelegate.persistentContainer.viewContext
         let userEntity = NSEntityDescription.entity(forEntityName: "Currency", in: context)!
         let dara = NSManagedObject(entity: userEntity, insertInto: context)
        dara.setValue(quotesArray.value, forKey: "value")
        dara.setValue(quotesArray.key, forKey: "key")

         do{
             try context.save()
         }catch{
             print(error.localizedDescription)
         }
         
     }
    func deleteData() {
             // data is entity name
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Currency")
            if  let result = try?  context.fetch(fetchRequest){
                for object in result {
                    context.delete(object as! NSManagedObject)
                }
            }
            do{
                try context.save()
                print("saved")
            }catch let error as NSError {
                print("Could not save \(error), \(error.userInfo)")
            }

        }
    
    func loadCoreData (){
         let appDelegate = UIApplication.shared.delegate as! AppDelegate
         let context = appDelegate.persistentContainer.viewContext
         

         let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Currency")

         
         do {
             let result = try context.fetch(fetchRequest)
             for data in result as! [NSManagedObject]{
                self.quotes.append(QuoteModel(data.value(forKey: "value") as! Double, data.value(forKey: "key") as! String))

             }
         
            
         } catch {
             print(error.localizedDescription)
         }
     }
}

