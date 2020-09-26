//
//  ViewController.swift
//  insects_tableView
//
//  Created by yoshiyuki oshige on 2018/08/17.
//  Copyright © 2018年 yoshiyuki oshige. All rights reserved.
//

import UIKit

// テーブルビューに表示するデータ
let qsectionTitle = ["チョウ目"]
let qsection0 = [("キタテハ","タテハチョウ科"),("クロアゲハ","アゲハチョウ科")]
let qtableData = [qsection0]

class addViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let me = AppUser()
    let fromAppDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ここですよ！！！！！")
        print(fromAppDelegate.ThisUsername)
        //fromAppDelegate.Thispassword = "うふ"
        print(fromAppDelegate.Thispassword)
        
        if let user_name = fromAppDelegate.ThisUsername{
            print("どうですかね")
            print(user_name)
        }
        if let user_id = fromAppDelegate.Thispassword{
            print(user_id)
        }
        
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


