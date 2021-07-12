//
//  NetworkManagerMock.swift
//  desafioBTGTests
//
//  Created by Paulo Victor Guimaraes Rosa on 11/07/21.
//

import Foundation
@testable import desafioBTG

class NetworkManagerMock: NetworkManager {
    override func request<T>(endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        
        let urlTest = URL?(nil)
        guard let url =  urlTest else {
            completion(.failure(NSError()))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                return
            }
            
            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                completion(.success(response))
                
            } catch {
                completion(.failure(NSError()))
            }
        }
        
        task.resume()
    }
    
    override func makeURL( endpoint: Endpoint) -> URL? {
        var components = URLComponents()
        
        components.scheme = "http"
        components.host = "api.currencylayer.com"
        components.path = "/\(endpoint.rawValue)"
        components.queryItems = parameters(urlComponents: components)
        
        return components.url?.absoluteURL
    }
    
    override func parameters (urlComponents:URLComponents ) -> [URLQueryItem]? {
        var query = [URLQueryItem]()
        
        query.append(URLQueryItem(name: "", value: ""))
        return query
    }
    

}
