//
//  BarSweepToggleViewController.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

class BarSweepToggleViewController: CAViewController {
    
    let subview = BarSweepToggleView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView(for: subview)
    }
    
}
