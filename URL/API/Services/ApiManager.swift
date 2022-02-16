//
//  ApiManager.swift
//  URL
//
//  Created by Олександр Літвінчук on 02.02.2022.
//  Copyright © 2022 Олександр Літвінчук. All rights reserved.
//

import Foundation
enum ApiType {
  
  case login
  case getUsers
  case getPosts
  case getAlbums
  
  var baseURL: URL {
  return URL(string: "https://jsonplaceholder.typicode.com/" )!
}
var headers: [String: String]{
    switch self {
    case .login :
        return ["auth-token": "12345"]
        default: return [:]

    }
}
    var path: String {
      switch self {
      case .login: return "login"
      case .getUsers: return "users"
      case .getPosts: return "posts"
      case .getAlbums: return "albums"
      
    }
    }
    var request: URLRequest {
      let url = URL(string: path, relativeTo: baseURL)!
      var request = URLRequest(url: url)
      request.allHTTPHeaderFields = headers
      switch self {
        case .login:
        request.httpMethod = "GET"
        return request
        default:
        request.httpMethod = "GET"
        return request
      }
    }

}

class ApiManager {
    static let shared = ApiManager()
    func getUsers(completion: @escaping (Users) -> Void) {
        let request = ApiType.getUsers.request
        let  task = URLSession.shared.dataTask(with: request){
            data, responce, eror in
            if let data = data, let users = try? JSONDecoder().decode(Users.self, from: data){
                
                completion(users)
            }else {completion([])}
        }
        task.resume()
        
    }
}

