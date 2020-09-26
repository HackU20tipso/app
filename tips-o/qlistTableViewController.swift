//
//  WebListTableTableViewController.swift
//  tips-o
//
//  Created by 藤元彩花 on 2020/08/26.
//  Copyright © 2020 百塚真弥. All rights reserved.
//

import UIKit

var TodoKobetsunonakami_sub = [String]()

class qListTableTableViewController: UITableViewController{
    
    /*
    var path : String = ""
    var Point : Int = 0
    
    let me = AppUser()
    
    // MARK: - Table view data source
    
    // セクション内の行数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("幾つですか...???? \(TodoKobetsunonakami_sub.count)です")
        return TodoKobetsunonakami_sub.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           //変数を作る
           let TodoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
           //変数の中身を作る
        
        //   TodoCell.textLabel!.text = TodoKobetsunonakami[indexPath.row]
           //戻り値の設定（表示する中身)
           return TodoCell
       }

    let fromAppDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //override func viewDidLoad()
    //override func  viewWillAppear(_ animated: Bool)
    override func viewDidLoad(){
        print("これ動いてる...??????")
        TodoKobetsunonakami_sub[0] = "表示して欲しい"
        //super.viewDidLoad()
        self.me.getPath(name: self.fromAppDelegate.ThisUsername!, password: self.fromAppDelegate.Thispassword!, complete:{result in
            print("きたこれ\(result)しぱい")
            
            self.path = result
        })
        
        let _ = self.me.getPoint(name: self.fromAppDelegate.ThisUsername, password: self.fromAppDelegate.Thispassword, complete:{result in
            print("みずきち\(result)")
            self.Point = result
            
        })
        
        print("ここです！！！！！")
        print(fromAppDelegate.ThisUsername)
        print(fromAppDelegate.Thispassword)
        
        
        
        
        if UserDefaults.standard.object(forKey: "TodoList") != nil {
                   TodoKobetsunonakami_sub = UserDefaults.standard.object(forKey: "TodoList") as! [String]
               }
    }
    //最初からあるコード
       override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
       }
            */
}

//OutofRangeをチェックできるやつ
/*
extension Array {
    subscript (safe index: Index) -> Element? {
        //indexが配列内なら要素を返し、配列外ならnilを返す（三項演算子）
        return indices.contains(index) ? self[index] : nil
    }
}
*/
