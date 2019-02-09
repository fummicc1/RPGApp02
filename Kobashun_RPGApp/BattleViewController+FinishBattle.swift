//
//  BattleViewController+FinishBattle.swift
//  Kobashun_RPGApp
//
//  Created by Fumiya Tanaka on 2019/02/08.
//  Copyright © 2019 Fumiya Tanaka. All rights reserved.
//

import Foundation
import UIKit

extension BattleViewController {
    
    func finishGame(text: String) {
        performSegue(withIdentifier: "toResult", sender: text)
    }
    
    func judgeFinishGame() {
        
        if player.hp == 0, enemy.hp == 0 {
            finishGame(text: "引き分け..! また遊んでね！")
        } else if player.hp == 0 {
            finishGame(text: "敗北... またじチャンレンジしてね！")
        } else if enemy.hp == 0 {
            finishGame(text: "勝利！ 連署目指して頑張ろう！")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let resultViewController = segue.destination as! ResultViewController
        
        let text = sender as! String
        
        resultViewController.resulttext = text
        
    }
    
}
