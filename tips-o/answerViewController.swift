//
//  answerViewController.swift
//  tips-o
//
//  Created by 百塚真弥 on 2020/08/24.
//  Copyright © 2020 百塚真弥. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore
import WebKit



class answerViewController: UIViewController {
    
    
    @IBOutlet var webView: WKWebView!
    
    // シーン移動の際に設定されるWebデータ
    var data:(name:String, url:String)?
    
    let fromAppDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ここです！！！！！")
        print(fromAppDelegate.ThisUsername)
        //fromAppDelegate.Thispassword = "うふ"
        print(fromAppDelegate.Thispassword)
         
        
        // dataが設定されていればwebDataに代入する
        guard let webData = data else {
            return
        }
       
        
        // Do any additional setup after loading the view.
        // 表示するWebページのURLRequestを作る
        let myURL = URL(string: webData.url)
        let myRequest = URLRequest(url: myURL!)
        print(myRequest)
        // Webを読み込む
        webView.load(myRequest)
        
    }
    
   
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    
}
