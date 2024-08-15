//
//  ActivityIndicatorView.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

class ActivityIndicatorView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let spinner = UIActivityIndicatorView(style: .large)
        let scale = self.frame.size.width / spinner.frame.size.width
        spinner.transform = CGAffineTransform(scaleX: scale, y: scale)
        spinner.frame = self.bounds
        spinner.color = UIColor.systemBlue
        spinner.hidesWhenStopped = true
        spinner.startAnimating()
        self.addSubview(spinner)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
