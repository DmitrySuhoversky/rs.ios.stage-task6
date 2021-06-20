//
//  Game.swift
//  DurakGame
//
//  Created by Дима Носко on 16.06.21.
//

import Foundation

protocol GameCompatible {
    var players: [Player] { get set }
}

struct Game: GameCompatible {
    var players: [Player]
}

extension Game {

    func defineFirstAttackingPlayer(players: [Player]) -> Player? {
        let values = Value.allCases
        var firstAttackingPlayer = Player()
        var temporary = 8
        
        for player in players {
            for index in 0 ..< 6 {
                if ((player.hand?[index].isTrump) == true) {
                    let indexCard = values.firstIndex(where: {$0 == player.hand?[index].value})!
                    if indexCard <= temporary {
                        temporary = indexCard
                        firstAttackingPlayer = player
                    }
                }
            }
        }
        return firstAttackingPlayer
    }
}
