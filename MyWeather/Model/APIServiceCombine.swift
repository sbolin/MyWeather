//
//  APIServiceCombine.swift
//  Weather
//
//  Created by Scott Bolin on 3/9/21.
//

import Foundation
import Combine


class APIServiceCombine {
    static let shared = APIServiceCombine()
    var cancellables = Set<AnyCancellable>()
    
    enum APIError: Error {
        case error(_ errorString: String)
    }
    
    func getJSON<T: Decodable>(urlString: String, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .convertFromSnakeCase, completion: @escaping (Result<T, APIError>) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.error(NSLocalizedString("Invalid URL Error", comment: ""))))
            return
        }
        
        print(#function)
        
        let request = URLRequest(url: url)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = dateDecodingStrategy
        decoder.keyDecodingStrategy = keyDecodingStrategy
        
        URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .receive(on: RunLoop.main) // receive on main thread before passing to UI
            .sink { taskCompletion in
                switch taskCompletion {
                    case .finished:
                        return
                    case .failure(let decodingError):
                        completion(.failure(APIError.error("Decoding Error: \(decodingError.localizedDescription)")))
                }
            } receiveValue: { decodedData in
                completion(.success(decodedData))
            }
            .store(in: &cancellables) // & = inout keyword
    }
}
