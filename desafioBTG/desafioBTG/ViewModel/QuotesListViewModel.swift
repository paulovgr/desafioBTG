//
//  QuotesViewModel.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 09/07/21.
//

import Foundation
import CoreData
import UIKit

class QuotesListViewModel   {
    private var service: NetworkManager
    var quotes = [QuoteModel]()
    
    
    required init(service: NetworkManager) {
        self.service = service
    }
    
    
    
    func requestQuote(completion: @escaping (Result<QuotesListModel, Error>) -> Void) {
        service.request(endpoint: .live , completion: completion)
    }
    
    func convertValue(from: Double, to: Double, value: Double) -> Double{
        if from == 1 {
            return to * value
        } else {
            return to/from * value
        }
    }
}

extension QuotesListViewModel {
    func setQuotes()  {
        requestQuote() { [self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    deleteData()
                    
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
    
    func saveQuotesCoreData(_ quotesArray: QuoteModel){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "Quote", in: context)!
        let data = NSManagedObject(entity: userEntity, insertInto: context)
        
        data.setValue(quotesArray.value, forKey: "value")
        data.setValue(quotesArray.key, forKey: "key")
        
        do{
            try context.save()
        }catch{
            print(error.localizedDescription)
        }
        
    }
    func deleteData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Quote")
        
        if  let result = try?  context.fetch(fetchRequest){
            for object in result {
                context.delete(object as! NSManagedObject)
            }
        }
        
        do{
            try context.save()
        }catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        
    }
    
    func loadCoreData (){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Quote")
        
        
        do {
            let result = try context.fetch(fetchRequest)
            for data in result as! [NSManagedObject]{
                self.quotes.append(QuoteModel(data.value(forKey: "value") as! Double
                                              , data.value(forKey: "key") as! String))
            }
            
            self.quotes.sort {
                $0.key < $1.key
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
