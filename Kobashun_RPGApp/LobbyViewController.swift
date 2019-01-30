//
//  ViewController.swift
//  Kobashun_RPGApp
//
//  Created by Fumiya Tanaka on 2019/01/13.
//  Copyright © 2019 Fumiya Tanaka. All rights reserved.
//

import UIKit

class LobbyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func tappedToBattleScene() {
        performSegue(withIdentifier: "toBattle", sender: nil)
    }
}
