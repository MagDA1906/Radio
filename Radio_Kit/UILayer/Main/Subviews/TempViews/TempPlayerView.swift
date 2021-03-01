
//
//  TempPlayerView.swift
//  Radio
//
//  Created by Денис Магильницкий on 19.02.2021.
//  Copyright © 2021 Денис Магильницкий. All rights reserved.
//

import UIKit

class TempPlayerView: UIView {
    // MARK: - IBOutlets
    @IBOutlet var shareButton: UIButton!
    @IBOutlet var imageView: UIView!
    @IBOutlet var songLabel: UILabel!
    @IBOutlet var artistLabel: UILabel!
    @IBOutlet var playButton: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }
    
    func loadView() {
        let bundle = Bundle(for: TempPlayerView.self)
        let nib = UINib(nibName: "TempPlayerView", bundle: bundle)
        let view = nib.instantiate(withOwner: self).first as! UIView
        view.frame = bounds
        addSubview(view)
    }
}
