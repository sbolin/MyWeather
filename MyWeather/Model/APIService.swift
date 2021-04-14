//
//  APIService.swift
//  Weather
//
//  Created by Scott Bolin on 3/8/21.
//

import Foundation

/*
class APIService {
    static let shared = APIService()
    
    enum APIError: Error {
        case error(_ errorString: String)
    }
    
    func getJSON<T: Decodable>(urlString: String,
                               dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
                               keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .convertFromSnakeCase,
                               completion: @escaping (Result<T, APIError>) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.error(NSLocalizedString("Invalid URL Error", comment: ""))))
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                completion(.failure(.error(NSLocalizedString("Error in dataTask:  \(error.localizedDescription)", comment: ""))))
                return
            }
            
            guard let data = data else {
                completion(.failure(.error(NSLocalizedString("Error: Data was corrupt", comment: ""))))
                return
            }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = dateDecodingStrategy
            decoder.keyDecodingStrategy = keyDecodingStrategy
            do {
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
                return
            } catch let decodingError {
                completion(.failure(APIError.error("Decoding Error: \(decodingError.localizedDescription)")))
                return
            }
        }.resume()
    }
}
*/
