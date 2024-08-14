//
//  CircleRippleMultipleViewController.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

class CircleRippleMultipleViewController: CAViewController {
    
    let subview = CircleRippleMultipleView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView(for: subview)
    }
    
}
