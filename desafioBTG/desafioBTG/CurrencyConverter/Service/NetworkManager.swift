//
//  NetworkManager.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 06/07/21.
//

import Foundation
import UIKit
import Network

enum Endpoint: String {
    case live
    case list
}

public class NetworkManager: NetworkManagerProtocol {
    weak var delegateError: MessageDelegate?
    
    func request<T>(endpoint: Endpoint,  completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        
        checkInternetConnection()
        
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
                completion(.failure(NSError()))
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
    
    func parameters (urlComponents:URLComponents ) -> [URLQueryItem]? {
        var query = [URLQueryItem]()
        
        query.append(URLQueryItem(name: "access_key", value: "3bdda02ece03a789028d549bb36adadd"))
        return query
    }
    
}

extension NetworkManager {
    private func checkInternetConnection() {
        let monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "Monitor")
        
        monitor.pathUpdateHandler = { path in
            if path.status != .satisfied {
                self.delegateError?.showMessage()
            }
        }
        
        monitor.start(queue: queue)
    }
}
