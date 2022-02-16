//
//  ApiBall.swift
//  URL
//
//  Created by Олександр Літвінчук on 02.02.2022.
//  Copyright © 2022 Олександр Літвінчук. All rights reserved.
//
import Foundation
enum ApiBall {
  
  case ball
  
  
  var baseURL: URL {
  return URL(string: "https://8ball.delegator.com/magic/JSON/" )!
}

    var path: String {
      switch self {
      case .ball: return "login"
      
      
    }
    }
    var request: URLRequest {
      let url = URL(string: path, relativeTo: baseURL)!
      var request = URLRequest(url: url)
      
      switch self {
        case .ball:
        request.httpMethod = "GET"
        return request
      }
    }

}
enum ObtainJsonResult{
case succes(json:Structer )
case failer(eror: Error)
}
class ApiManagerBall {
    static let shared = ApiManagerBall()
    func getJson(completion: @escaping (ObtainJsonResult) -> Void) {
        let request = ApiBall.ball.request
        var timeoutInterval: TimeInterval{2}
        
        let configuration = URLSessionConfiguration.default
       // configuration.timeoutIntervalForRequest(2)
       

        let  task = URLSession.shared.dataTask(with: request){
            data, responce, eror in
            if let data = data{
                guard let ball = try? JSONDecoder().decode(Structer.self, from: data)
                else{
                    completion(.failer(eror: eror!))
                    return}
                
                DispatchQueue.main.async{
                completion(.succes(json: ball))
                print(ball)
                }
            }
            else{completion(.failer(eror: eror!))}
        }
        task.resume()
        
    }
}

