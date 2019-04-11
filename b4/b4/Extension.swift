//
//  Extension.swift
//  b4
//
//  Created by cuonghx on 4/12/19.
//  Copyright © 2019 cuonghx. All rights reserved.
//

import UIKit

extension UITextField {
    func addLeftIcon(_ icon : UIImage){
        let size = 20
        let padding = 8
        let outer = UIView(frame: CGRect(x: 0, y: 0, width: size + padding, height: size))
        let image = UIImageView(frame: CGRect(x: padding, y: 0, width: size, height: size))
        image.contentMode = .scaleAspectFit
        image.image = icon.withRenderingMode(.alwaysTemplate)
        image.tintColor = UIColor.gray
        outer.addSubview(image)
        self.leftView = outer
        self.leftViewMode = .always
    }
}
