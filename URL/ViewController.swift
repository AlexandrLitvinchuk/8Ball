//
//  ViewController.swift
//  URL
//
//  Created by Олександр Літвінчук on 01.02.2022.
//  Copyright © 2022 Олександр Літвінчук. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let newViewController = NewViewController.shared
    @IBOutlet weak var MyLable: UILabel!
let netvorkManager = NetworkManager()
    var rocet = "bad"
    override func viewDidLoad() {
        super.viewDidLoad()
        print(rocet)
       // MyLable.text = "Shake me"
        
        }
    
    @IBAction func seting(_ sender: Any) {
        performSegue(withIdentifier: "helper", sender: nil)
    }
    
   
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?){
        if motion == .motionShake{
            
            ApiManagerBall.shared.getJson{( ball) in
                switch ball{
                case .succes(let json):
                   // DispatchQueue.main.async{
                        self.MyLable.text = json.magic?.answer
              //  }
                case .failer(let eror):
                    DispatchQueue.main.async{
                        self.MyLable.text = self.rocet
                    }

                }


            }
           
            
            
            
//            netvorkManager.obtainJson{(result) in
//
//                switch result{
//                case .succes(let json):
//                    DispatchQueue.main.async{
//                        self.MyLable.text = json.first?.magic?.answer
//                    }
//                case .failer(let eror):
//                    DispatchQueue.main.async{
//                    self.MyLable.text = String(self.newViewController.textFieldResponce)
//
//                   // self.MyLable.text = String(eror.localizedDescription)
//                    }
//                }
//            }
            }
}
        
}

