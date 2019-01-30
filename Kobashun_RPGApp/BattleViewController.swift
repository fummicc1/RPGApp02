//
//  BattleViewController.swift
//  Kobashun_RPGApp
//
//  Created by Fumiya Tanaka on 2019/01/15.
//  Copyright © 2019 Fumiya Tanaka. All rights reserved.
//

import UIKit

class BattleViewController: UIViewController {
    
    @IBOutlet var playerImageView: UIImageView!
    @IBOutlet var playerHPLabel: UILabel!
    @IBOutlet var enemyImageView: UIImageView!
    @IBOutlet var enemyHPLabel: UILabel!
    
    let enemy = Enemy()
    let player = Player()
    
    var turnNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tappedAttackButton() {
        
        player.commandNumber = 0
        
        if enemy.commandNumber == 0 {
            print("攻撃！")
        } else {
            print("避けられた...")
        }
        
        enemy.hp = enemy.hp - 1
        showAlert(title: "アタック！", message: "プレイヤーは攻撃しました。")
        
        displayDamage()
        
        doEnemyTurn()
    }
    
    @IBAction func tappedAvoidButton() {
        
        player.commandNumber = 1
        
        showAlert(title: "避けましょう！", message: "プレイヤーは次のターン攻撃を喰らいません。")
        
        displayDamage()
        
        doEnemyTurn()
    }
    
    // ここがわ分からなかったら#7のメモを復習しよう！
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            // OKボタンがタップされたら次の動きを行いたい。
            self.turnNumber += 1
            self.judgeTurn()
        }))
        present(alert, animated: true, completion: nil)
    }
    
    // 偶数ならば、自分のターン。奇数ならば相手のターン。
    func judgeTurn() {
        if turnNumber % 2 == 0 {
            print("プレイヤーのターン")
        } else {
            print("敵のターン")
            doEnemyTurn()
        }
    }
    
    func doEnemyTurn() {
        enemy.commandNumber = Int.random(in: 0...1) // 攻撃するか避けるかの選択を決める。
        if enemy.commandNumber % 2 == 0 {
            if player.commandNumber == 0 {
                player.hp -= 1
                print("攻撃失敗")
            } else {
                print("攻撃失敗")
            }
            showAlert(title: "アタック!", message: "敵が攻撃してきた。")
        } else {
            showAlert(title: "...", message: "敵がコソコソしているぞ..?")
        }
        
        displayDamage()
        
    }
    
    func displayDamage() {
        playerHPLabel.text = String(player.hp)
        enemyHPLabel.text = String(enemy.hp)
    }
    
}
