//
//  CircleRotateChaseViewController.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

class CircleRotateChaseViewController: CAViewController {
    
    let subview = CircleRotateChaseView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView(for: subview)
    }
    
}
