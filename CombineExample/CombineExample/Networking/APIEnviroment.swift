//
//  APIEnviroment.swift
//  CombineExample
//
//  Created by Nitin Bhatt on 17/01/25.
//

enum APIEnvironment {
    case development
    case staging
    case production
    
    func baseURL () -> String {
        return "https://\(domain())\(route())"
    }
        
    func domain() -> String {
        switch self {
        case .development:
            return "gorest.co.in"
        case .staging:
            return "gorest.co.in"
        case .production:
            return "gorest.co.in"
        }
    }
    
    func subdomain() -> String {
        switch self {
        case .development, .production, .staging:
            return "api"
        }
    }
    
    func route() -> String {
        return "/public/v2"
    }
}
