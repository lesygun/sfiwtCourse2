//
//  AutorizeViewController.swift
//  VkClient
//
//  Created by Елисей Аверкиев on 27.09.2020.
//  Copyright © 2020 Elisey Averkiev. All rights reserved.
//

import UIKit
import WebKit
import Alamofire

class AutorizeViewController: UIViewController {
    

    @IBOutlet weak var webView: WKWebView!{
        didSet{
            webView.navigationDelegate = self
        }
    }
    
   

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7611165"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "offline"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        webView.load(request)
        
        
        }
    
    func nextVC() {
        let nextView = GetFriends()
        self.navigationController?.pushViewController(nextView, animated: true)
    }
    
   
}



extension AutorizeViewController: WKNavigationDelegate{
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        //Если это нужный нам URL (/blank.html), и в нем есть токен, приступим к его обработке, если же нет, дадим зеленый свет на переход между страницами c помощью метода decisionHandler(.allow). Дальше мы просто режем строку с параметрами на части, используя как разделители символы & и =.
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        
        let token = params["access_token"]
        //Сохраняем токен в сессию
        Session.shared.token = token
        
        if Session.shared.token != nil{
            let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginFormController") as! LoginFormController
//           let testLog = TestTableViewController()
            present(loginVC, animated: true)
        }
        
        decisionHandler(.cancel)
    }
}
