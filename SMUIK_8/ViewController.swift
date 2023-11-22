//
//  ViewController.swift
//  SMUIK_8
//
//  Created by Andrei Kovryzhenko on 22.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
        view.tintColor = .systemGray3
        return view
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = view.bounds
        scrollView.contentSize = CGSize(
            width: view.bounds.width,
            height: view.bounds.height + 600
        )
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Avatar"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.backgroundColor = .white
        view.addSubview(scrollView)
    }
    
    override func viewWillLayoutSubviews() {
        addImageToLargeTitle()
    }
    
    private func addImageToLargeTitle() {
        guard let navigationBar = navigationController?.navigationBar else { return }
    
        for subview in navigationBar.subviews {
            if let largeTitleView = NSClassFromString("_UINavigationBarLargeTitleView"), subview.isKind(of: largeTitleView) {
                
                imageView.contentMode = .scaleAspectFit
                subview.addSubview(imageView)
                
                imageView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    imageView.bottomAnchor.constraint(equalTo: subview.bottomAnchor, constant: -10),
                    imageView.trailingAnchor.constraint(equalTo: subview.trailingAnchor, constant: -view.directionalLayoutMargins.trailing),
                    imageView.widthAnchor.constraint(equalToConstant: 36),
                    imageView.heightAnchor.constraint(equalToConstant: 36)
                ])
            }
        }
    }
}

