//
//  ResultViewController.swift
//  Kobashun_RPGApp
//
//  Created by Fumiya Tanaka on 2019/02/08.
//  Copyright © 2019 Fumiya Tanaka. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var label: UILabel!
    
    var resulttext: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = resulttext
        
    }
    
    
    
}
