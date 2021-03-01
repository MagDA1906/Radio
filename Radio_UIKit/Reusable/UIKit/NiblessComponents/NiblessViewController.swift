//
//  NiblessViewController.swift
//  Radio
//
//  Created by Денис Магильницкий on 17.02.2021.
//  Copyright © 2021 Денис Магильницкий. All rights reserved.
//

import UIKit

open class NiblessViewController: UIViewController {
    // MARK: - Methods
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
