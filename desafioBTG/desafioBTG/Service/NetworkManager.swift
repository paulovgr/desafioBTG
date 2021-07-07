//
//  NetworkManager.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 06/07/21.
//

import Foundation
import UIKit


enum NetworkError:  Error {
    case error(Error)
}

protocol Endpoint {
    var baseURLString: String { get }
    var path: String { get }
   // var body: [String: Any]? { get }
}
//enum EndpointCases: Endpoint {
//    case live
//    case list
//    case convert
//
//
//    var baseURLString: String {
//        return "https://pabloblan.co/api/"
//    }
//
//
//    var path: String {
//        switch self {
//        case .live:
//            return "live"
//        case .list:
//            return "list"
//        case .convert:
//            return "convert"
//        }
//
//    }
//
//}
//
//
//var body: [String : Any]?
//
//
//}

protocol NetworkManagerProtocol {
    func request<T: Decodable> (_ endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void)
}
public class NetworkManager: NetworkManagerProtocol {
    func request<T>(_ endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        let endpoint = "http://api.currencylayer.com/list?access_key=3bdda02ece03a789028d549bb36adadd"
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(NSError()))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
             guard let data = data else {
                 return
             }
            
            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(response))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(NSError()))
                }
            }
        }
        task.resume()

    }
    
    
    
}
