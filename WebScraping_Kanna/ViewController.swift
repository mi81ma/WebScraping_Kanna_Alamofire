//
//  ViewController.swift
//  WebScraping_Kanna
//
//  Created by masato on 29/10/2018.
//  Copyright © 2018 masato. All rights reserved.
//


import UIKit
import Kanna
import Alamofire


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        scrapeWebsite()
    }

    func scrapeWebsite() {

        //GETリクエスト 指定URLのコードを取得
        Alamofire.request("https://www.yahoo.co.jp").responseString { response in
            print("\(response.result.isSuccess)")

            if let html = response.result.value {
                self.parseHTML(html: html)
            }
        }
    }

    func parseHTML(html: String) {
        if let doc = try? HTML(html: html, encoding: .utf8) {
            print(doc.title)

            for link in doc.css("a, link") {
                print(link.text)
                print(link["href"])
            }
        }
    }
}
