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
    
    let enemy = Enemy() // 敵のインスタンス
    let player = Player() // プレイヤーのクラス
    
    var turnNumber: Int = 0 // 現在のターン数を記録した変数
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 攻撃を押した時のボタン
    @IBAction func tappedAttackButton() {
        
        player.commandNumber = 0
        
        if enemy.commandNumber == 0 {
            print("攻撃！")
            enemy.hp = enemy.hp - 1
        } else {
            print("避けられた...")
        }
        
        showAlert(title: "アタック！", message: "プレイヤーは攻撃しました。")
        
        displayDamage()
    }
    
    // 避けるを押した時のボタン
    @IBAction func tappedAvoidButton() {
        
        player.commandNumber = 1
        
        showAlert(title: "避けましょう！", message: "プレイヤーは次のターン攻撃を喰らいません。")
        
        displayDamage()
    }
    
    // ここは#7のメモの教科書を使用しているよ！
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            // OKボタンがタップされたら次の動きを行いたい。
            self.turnNumber += 1
            self.judgeTurn()
        }))
        present(alert, animated: true, completion: nil)
    }
    
    // 偶数ならば、自分のターン。奇数ならば相手のターン。 ← 重要
    func judgeTurn() {
        if turnNumber % 2 == 0 {
            print("プレイヤーのターン")
        } else {
            print("敵のターン")
            doEnemyTurn()
        }
    }
    
    // 敵にダメージを与えるかメソッド(教科書#5と#6)
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
    
    // プレイヤーと敵のHPをラベルに表示する。
    func displayDamage() {
        playerHPLabel.text = String(player.hp)
        enemyHPLabel.text = String(enemy.hp)
    }
    
}
