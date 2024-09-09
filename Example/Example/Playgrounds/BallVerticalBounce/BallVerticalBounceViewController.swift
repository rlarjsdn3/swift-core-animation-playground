//
//  BallVerticalBounceViewController.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

class BallVerticalBounceViewController: CAViewController {
    
    let subview = BallVerticalBounceView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView(for: subview)
    }
    
}
