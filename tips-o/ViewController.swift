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
    
    let me = AppUser()
    
    @IBAction func LoginButton(_ sender: Any) {
        
        
        self.me.isMatch(name: UserNameTextField!.text ?? "", password: UserIdTextField.text!, complete:{result in
            print("")
            if (result){
                
                self.fromAppDelegate.ThisUsername = self.UserNameTextField.text
                
                self.fromAppDelegate.Thispassword = self.UserIdTextField.text
                
                print(self.fromAppDelegate.Thispassword)
                
                // 移動先のビューコントローラを参照する
                let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "tabPage")
                // トランジションの映像効果を指定する
                nextVC?.modalTransitionStyle = .flipHorizontal
                // シーンを移動する
                self.present(nextVC!, animated: true, completion: nil)
                
                print("終わった")
                
            }
            else{
                //self.ErrorLabel.text! = "NameとIDが違います"
            }})
    }
    
    
    let fromAppDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(fromAppDelegate.globalVar)
        fromAppDelegate.ThisUsername = "あは体験"
        print(fromAppDelegate.ThisUsername)
        fromAppDelegate.Thispassword = "うふ"
        
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
