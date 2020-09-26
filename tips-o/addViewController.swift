//  AddController.swift
import UIKit
import WebKit

//変数の設置
var TodoKobetsunonakami = [String]()

class addViewController: UIViewController {

    //@IBOutlet var webView: WKWebView!
    
    // シーン移動の際に設定されるWebデータ
    var data:(name:String, url:String)?
    @IBOutlet var webVIew2: WKWebView!
    
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
        
        //webView.load(myRequest)
        
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
