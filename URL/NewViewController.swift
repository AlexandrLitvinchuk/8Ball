//
//  NewViewController.swift
//  URL
//
//  Created by Олександр Літвінчук on 09.02.2022.
//  Copyright © 2022 Олександр Літвінчук. All rights reserved.
//

import UIKit

class NewViewController: UIViewController, UITextFieldDelegate {
    static let shared = NewViewController()
   // @IBOutlet weak var goBack: UIButton!
    @IBOutlet weak var field: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    var textFieldResponce = "god"
    var someInts = [String]()
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc2 = segue.destination as? ViewController {
            vc2.rocet = textFieldResponce
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       // var ffff = field.text
//        field.returnKeyType = .done
//        field.autocapitalizationType = .words
//        field.autocorrectionType = .no
//        field.becomeFirstResponder()
//        field.delegate = self
    }
    @IBAction func goBack(_ sender: Any) {
        // performSegue(withIdentifier: "goBack", sender: nil)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonDo(_ sender: Any) {
        textFieldResponce = field.text!
        someInts.append(textFieldResponce)
        print(textFieldResponce)
        print(someInts.randomElement())
        //field.deleteBackward()
        
        
        
}
    
//extension ViewController: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        let text = textField.text
//        print ("\(text)")
//        return true
//    }
//}

}
