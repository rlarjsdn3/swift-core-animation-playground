//
//  CircleArcDotSpinViewController.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

class CircleArcDotSpinViewController: CAViewController {
    
    let subview = CircleArcDotSpinView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView(for: subview)
    }
    
}
