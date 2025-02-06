//
//  WebViewController.swift
//  TabbarVCSample
//
//  Created by Ankit Sharma  on 06/02/25.
//

import WebKit

class WebViewController: UIViewController {
    private var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
        setupCloseButton()
    }
    
    private func setupWebView() {
        webView = WKWebView(frame: self.view.bounds)
        self.view.addSubview(webView)
        
        if let url = URL(string: "https://github.com/ankit-ios") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    private func setupCloseButton() {
        let closeButton = UIButton(type: .system)
        closeButton.setTitle("Close", for: .normal)
        closeButton.setTitleColor(.white, for: .normal)
        closeButton.backgroundColor = .black
        closeButton.layer.cornerRadius = 8
        closeButton.addTarget(self, action: #selector(closeTapped), for: .touchUpInside)
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            closeButton.widthAnchor.constraint(equalToConstant: 80),
            closeButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc private func closeTapped() {
        dismiss(animated: true, completion: nil)
    }
}
