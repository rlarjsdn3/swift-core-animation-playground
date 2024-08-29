//
//  HorizontalDotScalingViewController.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

class HorizontalDotScalingViewController: CAViewController {
    
    let subview = HorizontalDotScalingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView(for: subview)
    }
    
}
