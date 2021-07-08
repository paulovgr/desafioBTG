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

enum Endpoint: String {
    case live
    case list
}


protocol NetworkManagerProtocol {
    func request<T: Decodable> (completion: @escaping (Result<T, Error>) -> Void)
}
public class NetworkManager: NetworkManagerProtocol {
    
    func parameters (urlComponents:URLComponents, initials: String? ) -> [URLQueryItem]? {
        var query = [URLQueryItem]()
        
        if let initials = initials { // testar else
            query.append(URLQueryItem(name: "currencies" , value: initials))
        }
        
        query.append(URLQueryItem(name: "access_key", value: "3bdda02ece03a789028d549bb36adadd"))
        return query
    }
    
    func makeURL(initials: String? = nil, endpoint: Endpoint) -> URL? {
        var components = URLComponents()

        components.scheme = "http"
        components.host = "api.currencylayer.com"
        components.path = "/\(endpoint.rawValue)"
        components.queryItems = parameters(urlComponents: components, initials: initials)

        return components.url?.absoluteURL
    }
    
    func request<T>(completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {

        guard let url = makeURL( endpoint: .list) else {
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
