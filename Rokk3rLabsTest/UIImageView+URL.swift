//
//  UIImageView+URL.swift
//  Rokk3rLabsTest
//
//  Created by Fernando on 24/4/17.
//  Copyright © 2017 Infinixsoft. All rights reserved.
//

import Foundation
import Kingfisher

extension UIImageView {
    
    func load(urlString: String?, placeholder: UIImage? = nil) {
        guard let _urlString = urlString else {
            image = placeholder
            return
        }
        
        guard let url = URL(string: _urlString) else {
            image = placeholder
            return
        }
        
        self.kf.setImage(
            with                : url,
            placeholder         : placeholder,
            options             : [.transition(.fade(0.3))],
            progressBlock       : nil,
            completionHandler   : nil
        )
    }
    
    func cancelDownload() {
        self.kf.cancelDownloadTask()
    }
    
}
