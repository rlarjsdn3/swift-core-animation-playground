//
//  SFSymbolBounceViewController.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

class SFSymbolBounceViewController: CAViewController {
    
    let subview = SFSymbolBounceView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView(for: subview)
    }
    
}
