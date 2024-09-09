//
//  CirclDotSpinFadeViewController.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

class CircleDotSpinFadeViewController: CAViewController {
    
    let subview = CircleDotSpinFadeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView(for: subview)
    }
    
}
