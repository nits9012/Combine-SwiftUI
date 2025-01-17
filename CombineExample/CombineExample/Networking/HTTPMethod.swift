//
//  HTTPMethod.swift
//  CombineExample
//
//  Created by Nitin Bhatt on 17/01/25.
//

public enum HTTPMethod: String {
    /// Represents an HTTP GET request, used to retrieve data.
    case get = "GET"
    
    /// Represents an HTTP PUT request, used to update a resource.
    case put = "PUT"
    
    /// Represents an HTTP POST request, used to create a resource.
    case post = "POST"
    
    /// Represents an HTTP DELETE request, used to delete a resource.
    case delete = "DELETE"
}
