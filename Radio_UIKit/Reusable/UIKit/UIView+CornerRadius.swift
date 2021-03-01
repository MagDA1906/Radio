//
//  UIView+CornerRadius.swift
//  Radio
//
//  Created by Денис Магильницкий on 25.02.2021.
//  Copyright © 2021 Денис Магильницкий. All rights reserved.
//

import UIKit

extension UIView {
    func setCornerRadius() {
//        let width = bounds.size.width
//        let cornerRadius = width / 2
//        layer.cornerRadius = cornerRadius
        layer.cornerRadius = 42
        layer.masksToBounds = true
    }
}
