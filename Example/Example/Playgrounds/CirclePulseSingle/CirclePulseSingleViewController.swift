//
//  CirclePulseSingleViewController.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

class CirclePulseSingleViewController: CAViewController {
    
    let subview = CirclePulseSingleView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView(for: subview)
    }
    
}
