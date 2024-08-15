//
//  CirclePulseMultipleViewController.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

class CirclePulseMultipleViewController: CAViewController {
    
    let subview = CirclePulseMultipleView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView(for: subview)
    }
    
}
