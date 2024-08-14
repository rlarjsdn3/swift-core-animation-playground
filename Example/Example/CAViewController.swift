//
//  CAViewController.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

class CAViewController: UIViewController {
    
    // MARK: - Properties
    
    let containerView = UIView()
    
    
    // MARK: - Helpers
    
    func setupView(for subview: UIView) {
        
        view.addSubview(containerView)
        containerView.addSubview(subview)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.widthAnchor.constraint(equalToConstant: 300),
            containerView.heightAnchor.constraint(equalToConstant: 300),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        subview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subview.widthAnchor.constraint(equalToConstant: 200),
            subview.heightAnchor.constraint(equalToConstant: 200),
            subview.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            subview.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
        
        containerView.backgroundColor = .lightGray.withAlphaComponent(0.5)
        containerView.layer.cornerRadius = 45
        containerView.layer.cornerCurve = .continuous
        
        subview.backgroundColor = .clear
        
    }
    
}
