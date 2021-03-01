//
//  ViewController.swift
//  Radio
//
//  Created by Денис Магильницкий on 16.02.2021.
//  Copyright © 2021 Денис Магильницкий. All rights reserved.
//

import UIKit

class MainViewController: NiblessViewController {

    // MARK: - Properties
    let viewModel: MainViewModel
    
    // MARK: - Initializers
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        view = MainView(viewModel: viewModel)
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

