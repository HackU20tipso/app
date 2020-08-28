//
//  ViewController.swift
//  tips-o
//
//  Created by 百塚真弥 on 2020/08/24.
//  Copyright © 2020 百塚真弥. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseFirestore

var db: Firestore!

class ViewController: UIViewController, UITextFieldDelegate {
    
    

    @IBOutlet weak var UserNameTextField: UITextField!
    @IBOutlet weak var UserIdTextField: UITextField!
    @IBOutlet weak var ErrorLabel: UILabel!
    @IBAction func LoginButton(_ sender: Any) {
        if UserIdTextField.text! == "123" && UserNameTextField.text! == "ayaka" {
            // 移動先のビューコントローラを参照する
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "tabPage")
            // トランジションの映像効果を指定する
            nextVC?.modalTransitionStyle = .flipHorizontal
            // シーンを移動する
            present(nextVC!, animated: true, completion: nil)
            
            print("終わった")
        }else{
            ErrorLabel.text! = "NameとIDが違います"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // [START setup]
        UserNameTextField.delegate = self
        UserIdTextField.delegate = self

        
        
        let settings = FirestoreSettings()

        Firestore.firestore().settings = settings
        // [END setup]
        db = Firestore.firestore()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           view.endEditing(true)
           print(UserNameTextField.text!)
           print(UserIdTextField.text!)
           guard let nameText = UserIdTextField.text, !nameText.isEmpty else {return false}
           return false
       }
          
}

