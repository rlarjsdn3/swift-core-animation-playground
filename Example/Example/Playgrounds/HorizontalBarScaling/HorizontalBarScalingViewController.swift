//
//  HorizontalBarScalingViewController.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

class HorizontalBarScalingViewController: CAViewController {
    
    let subview = HorizontalBarScalingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView(for: subview)
    }
    
}
