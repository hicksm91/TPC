//
//  ViewControllerGroups.swift
//  Turning Point Church
//
//  Created by Hicks, Matt on 1/22/19.
//  Copyright © 2019 Turning Point Church. All rights reserved.
//

import UIKit
import WebKit

class ViewControllerMessages: UIViewController, WKNavigationDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var loadingSpinner: UIActivityIndicatorView!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        webView.navigationDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        loadingSpinner.startAnimating()
        loadPodcasts()
    }
    
    // MARK: - WebView Methods
    
    func loadPodcasts() {
        
        print("Loading podcasts...")
        
        guard let url = URL(string: "https://podcasts.apple.com/us/podcast/turning-point-church/id1458427155?mt=2") else {
            print("Failed to create URL object from podcasts address")
            return
        }
        
        webView.load(URLRequest(url: url))
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        print("Finished loading")
        loadingSpinner.stopAnimating()
    }
    
    // This method will keep users within the podcasts.apple.com domain
    // If you don't care whether they can navigate around, you can remove this
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        guard let requestURL = navigationAction.request.url else {
            decisionHandler(.cancel)
            return
        }
        
        if requestURL.absoluteString.contains("podcasts.apple.com") {
            print("Navigating to podcast url")
            decisionHandler(.allow)
        }
        else {
            print("Cancelling navigation to: \(requestURL.absoluteString)")
            decisionHandler(.cancel)
        }
    }
}
