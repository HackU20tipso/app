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

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // [START setup]
        
        
        
        let settings = FirestoreSettings()

        Firestore.firestore().settings = settings
        // [END setup]
        db = Firestore.firestore()
    }


}

