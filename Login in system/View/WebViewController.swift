//
//  WebViewController.swift
//  Login in system
//
//  Created by Andrey Bezrukov on 23.08.2023.
//

import UIKit
import WebKit

final class WebViewController: UIViewController {
    
    private let webView = WKWebView()
    private let urlString: String
    
    init(with urlString: String) {
        self.urlString = urlString
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setConstraints()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: Constant.rightBarButtonWeb,
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapDone))
        navigationController?.navigationBar.backgroundColor = .secondarySystemBackground
        
        guard let url = URL(string: urlString) else {
            return dismiss(animated: true)
        }
        webView.load(URLRequest(url: url))
    }
    
    @objc func didTapDone() {
        dismiss(animated: true)
    }
    
    private func addSubviews() {
        view.backgroundColor = .white
        view.addViewsTAMIC(webView)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
