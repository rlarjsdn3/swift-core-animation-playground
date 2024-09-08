//
//  CircleBarSpinFadeViewController.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

class CircleBarSpinFadeViewController: CAViewController {
    
    let subview = CircleBarSpinFadeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView(for: subview)
    }
    
}
