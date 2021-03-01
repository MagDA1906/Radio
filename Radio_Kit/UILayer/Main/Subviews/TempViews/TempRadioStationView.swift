//
//  TempRadioStationView.swift
//  Radio
//
//  Created by Денис Магильницкий on 25.02.2021.
//  Copyright © 2021 Денис Магильницкий. All rights reserved.
//

import UIKit

@IBDesignable class TempRadioStationView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }
    
    func loadView() {
        let bundle = Bundle(for: TempRadioStationView.self)
        let nib = UINib(nibName: "TempRadioStationView", bundle: bundle)
        let view = nib.instantiate(withOwner: self).first as! UIView
        view.frame = bounds
        addSubview(view)
    }
}
