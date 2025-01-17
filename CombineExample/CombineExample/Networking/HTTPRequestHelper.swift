//
//  HTTPRequestHelper.swift
//  CombineExample
//
//  Created by Nitin Bhatt on 17/01/25.
//

import Foundation
import Combine

class HTTPRequestHelper{
    enum NetworkingError: LocalizedError {
        case badURLResponse(url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badURLResponse(url: let url): return "Invalid response from URL: \(url)"
            case .unknown: return "Unknown error occured"
            }
        }
    }
    
    static func request(url: URL) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap({ try handleURLResponse(output: $0, url: url) })
            .eraseToAnyPublisher()
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              200..<300 ~= response.statusCode else {
            throw NetworkingError.badURLResponse(url: url)
        }
        
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>){
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
