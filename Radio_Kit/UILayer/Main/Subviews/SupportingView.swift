//
//  SupportingView.swift
//  Radio
//
//  Created by Денис Магильницкий on 03.03.2021.
//  Copyright © 2021 Денис Магильницкий. All rights reserved.
//

import UIKit

enum BorderShape: String {
    case circle
    case squircle
    case none
}

enum SelfColor: String {
    case clear
    case some
}

enum BorderWidth: String {
    case none
    case thin
    case bold
}

final class SupportingView: UIView {
    
    private let borderShape: BorderShape
    private let selfColor: SelfColor
    private let borderWidth: BorderWidth
    
    // MARK: - Initializers
    convenience init() {
        self.init(borderShape: .none, borderWidth: .none, selfColor: .clear)
    }
    
    init(borderShape: BorderShape, borderWidth: BorderWidth, selfColor: SelfColor) {
        self.borderShape = borderShape
        self.borderWidth = borderWidth
        self.selfColor = selfColor
        super.init(frame: CGRect.zero)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        borderShape = .none
        borderWidth = .none
        selfColor = .clear
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .clear
        contentMode = .scaleAspectFit
        clipsToBounds = true
        //    layer.masksToBounds = true
    }
    
    // MARK: - Layouts
    override func layoutSubviews() {
        super.layoutSubviews()
        setupBorderShape()
        setupSelfColor()
        setupBorderWidth()
    }
    
    private func setupBorderShape() {
        let width = bounds.size.width
        let divisor: CGFloat
        switch borderShape {
        case .circle:
            divisor = 2
        case .squircle:
            divisor = 4
        case .none:
            divisor = width
        }
        let cornerRadius = width / divisor
        layer.cornerRadius = cornerRadius
    }
    
    private func setupSelfColor() {
        switch selfColor {
        case .clear:
            backgroundColor = .clear
        case .some:
            backgroundColor = .gray
        }
    }
    
    private func setupBorderWidth() {
        switch borderWidth {
        case .none:
            layer.borderWidth = 0
        case .thin:
            layer.borderWidth = 2
        case .bold:
            layer.borderWidth = 5
        }
    }
}
