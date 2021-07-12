//
//  Protocols.swift
//  desafioBTG
//
//  Created by Paulo Victor Guimaraes Rosa on 10/07/21.
//

protocol QuoteDelegate: AnyObject {
    func PassQuote(_ value: Any)
}

protocol MessageDelegate: AnyObject {
    func showMessage ()
}

protocol NetworkManagerProtocol {
    func request<T: Decodable> (endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void)
}
