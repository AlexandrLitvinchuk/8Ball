
//  NewBall.swift
//  URL
//
//  Created by Олександр Літвінчук on 05.02.2022.
//  Copyright © 2022 Олександр Літвінчук. All rights reserved.


import Foundation


enum ObtainPostResult{
    case succes(json: [Structer])
    case failer(eror: Error)
}
class NetworkManager{
    let sessionConfiguration = URLSessionConfiguration.default
    let session = URLSession.shared
    let decoder = JSONDecoder()
        func obtainJson (complation : @escaping(ObtainPostResult) -> Void ){
            let url = URL(string: "https://8ball.delegator.com/magic/JSON/3" )
            let request  = URLRequest(url: url! )
//            guard let url = URL(string: "https://8ball.delegator.com/magic/JSON/3" ) else
//            {return
//            }
            session.dataTask(with: request) {[weak self] (data, responce, eror) in
                var result : ObtainPostResult
                defer{
                    DispatchQueue.main.async {
                        complation(result)
                    }
                }
                guard let strongSelf = self else{result = .failer(eror: eror!)
                    return
                     }
                if  let parsData = data, eror == nil {
                    guard let ball1 = try? strongSelf.decoder.decode([Structer].self,from: parsData)
                    
                        else{
                            result = .succes(json: [])
                        return
                    }
                    result = .succes(json: ball1)
                }
                else {result = .failer(eror: eror!)
                    
                }
            }.resume()
        }
    }

