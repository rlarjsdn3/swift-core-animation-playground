//
//  ActivityIndicatorViewController.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

class ActivityIndicatorViewController: CAViewController {
    
    let subview = ActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView(for: subview)
    }
    
}
