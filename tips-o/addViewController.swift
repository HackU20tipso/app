//
//  ViewController.swift
//  insects_tableView
//
//  Created by yoshiyuki oshige on 2018/08/17.
//  Copyright © 2018年 yoshiyuki oshige. All rights reserved.
//

import UIKit

// テーブルビューに表示するデータ
let qsectionTitle = ["投稿済みのアンケート"]
var qsection0 = [("キタテハ","タテハチョウ科")]
let qtableData = [qsection0]

class addViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let me = AppUser()
    let ques = QuestionnareData()
    
    let fromAppDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    var addData = [(String, String)]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ここですよ！！！！！")
        print(fromAppDelegate.ThisUsername)
        //fromAppDelegate.Thispassword = "うふ"
        print(fromAppDelegate.Thispassword)
        
        
        var name  = ""
        var id = ""
        
        if let x = fromAppDelegate.ThisUsername{
            name = x
        }
        if let y = fromAppDelegate.Thispassword{
            id = y
        }
        
        //ユーザーのアンケートを探す
        var add_url = "あああああああ"
        var add_theme = "いいいいいいいい"
        
        
        let _ = ques.get_url_theme(name: name, password: id, complete:{(result_url, result_theme) in
            print("\(id)\(name)")
            //print("みずきち\(result_url)と\(result_theme)")
            //qsection0.append((result_url, result_theme))
            add_url = result_url
            add_theme = result_theme
            print("みずきち\(add_url)と\(add_theme)")
           // qsection0.append((add_url,add_theme))
            
        })
        print("\(add_url)")
        print("代入された?")
        //qsection0.append((add_url,add_theme))
        //qsection0.append(("追加","された?"))
        
        
        // テーブルビューを作る
        let myTableView:UITableView!
        myTableView = UITableView(frame: view.frame, style: .grouped)
        // テーブルビューのデリゲートを設定する
        myTableView.delegate = self
        // テーブルビューのデータソースを設定する
        myTableView.dataSource = self
        // テーブルビューを表示する
        view.addSubview(myTableView)
    }
    
    /*　UITableViewDataSourceプロトコル */
    // セクションの個数を決める
    func numberOfSections(in qtableView: UITableView) -> Int {
        print("\(qsectionTitle.count)")
        return qsectionTitle.count
    }

    // セクションごとの行数を決める
    func tableView(_   qtableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let qsectionData = qtableData[section]
        return qsectionData.count
    }

    // セクションのタイトルを決める
    func tableView(_ qtableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return qsectionTitle[section]
    }

    // セルを作る
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let qsectionData = qtableData[(indexPath as NSIndexPath).section]
        let cellData = qsectionData[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = cellData.0
        cell.detailTextLabel?.text = cellData.1
        return cell
    }

    /* UITableViewDelegateデリゲートメソッド */
    // 行がタップされると実行される
    func qtableView(_ qtableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let title = sectionTitle[indexPath.section]
        let sectionData = qtableData[indexPath.section]
        let cellData = sectionData[indexPath.row]
        print("\(title)\(cellData.1)")
        print("\(cellData.0)")
    }

}


