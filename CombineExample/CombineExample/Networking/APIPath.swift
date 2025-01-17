//
//  APIPath.swift
//  CombineExample
//
//  Created by Nitin Bhatt on 17/01/25.
//

#if DEBUG
let environment = APIEnvironment.development
#else
let environment = APIEnvironment.production
#endif

let baseURL = environment.baseURL()

struct APIPath {
    var users: String { return "\(baseURL)/users"}
}
