//
//  SemiRingRotationViewController.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

class SemiRingRotationViewController: CAViewController {
    
    let subview = SemiRingRotationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView(for: subview)
    }
    
}
