//
//  ViewControllerGroups.swift
//  Turning Point Church
//
//  Created by Hicks, Matt on 1/22/19.
//  Copyright © 2019 Turning Point Church. All rights reserved.
//

import UIKit
import WebKit

class ViewControllerGiving: UIViewController {
    
    private var webView: WKWebView?
    
    override func loadView() {
        webView = WKWebView()
        
        //If you want to implement the delegate
        //webView?.navigationDelegate = self
        
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: "https://tpoint.churchcenter.com/giving") {
            let req = URLRequest(url: url)
            webView?.load(req)
        }
    }
}
// Do any additional setup after loading the view.



/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


