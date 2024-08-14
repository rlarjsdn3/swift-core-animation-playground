//
//  CircleRippleSingleViewController.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

class CircleRippleSingleViewController: CAViewController {
    
    let subview = CircleRippleSingleView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView(for: subview)
    }
    
}
