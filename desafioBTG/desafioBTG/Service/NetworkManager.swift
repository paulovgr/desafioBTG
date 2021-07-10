//
//  NetworkManager.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 06/07/21.
//

import Foundation
import UIKit
import Network


enum NetworkError:  Error {
    case error(Error)
}

enum Endpoint: String {
    case live
    case list
}

protocol MessageDelegate: AnyObject {
    func showMessage ()
}
protocol NetworkManagerProtocol {
    func request<T: Decodable> (endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void)
}
public class NetworkManager: NetworkManagerProtocol {
    weak var delegateError: MessageDelegate?

    func parameters (urlComponents:URLComponents ) -> [URLQueryItem]? {
        var query = [URLQueryItem]()
        
        query.append(URLQueryItem(name: "access_key", value: "3bdda02ece03a789028d549bb36adadd"))
        return query
    }
    
    
    func request<T>(endpoint: Endpoint,  completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        
        let monitor = NWPathMonitor()
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                print("We're connected!")
            } else {
                self.delegateError?.showMessage()
            }

            print(path.isExpensive)
        }
        
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
        
        guard let url = makeURL( endpoint: endpoint) else {
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
    
    func makeURL( endpoint: Endpoint) -> URL? {
        var components = URLComponents()
        
        components.scheme = "http"
        components.host = "api.currencylayer.com"
        components.path = "/\(endpoint.rawValue)"
        components.queryItems = parameters(urlComponents: components)
        
        return components.url?.absoluteURL
    }
    
}
