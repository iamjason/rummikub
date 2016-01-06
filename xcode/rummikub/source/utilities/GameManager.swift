//
//  GameManager.swift
//  rummikub
//
//  Created by Jason Garrett on 1/2/16.
//  Copyright © 2016 Jason Garrett. All rights reserved.
//

import Foundation

protocol GameManager {
  func startGame()
}

class TestGameManager : GameManager {
  
  var pile = Pile()
  var players = [Player]()
  var board = Set<Tile>()
  
  func startGame() {
  
    for i in 1...4 {
      var player = Player.createPlayer("Player\(i)")
      for _ in 1...14 {
        player.rack.addTile(pile.drawTile()!)
      }
      players.append(player)
    }
    
    printPlayersRacks()
    
    var foundWinner = false
    while !foundWinner {
    // play 20 hands see if we find a winner
    //for _ in 1...2 {
    
      players = players.map({ (player) -> Player in
        
        var tPlayer = player
        
        let solution:TileGroupPlay = tPlayer.strategy.solve(tPlayer.rack.tiles)
     
        // TODO: have a count of tiles _NOT_ already on the board,
        // that is, only count tiles from the player's rack
        if solution.totalTiles > 0 {

          print("found solution: \(solution)")
          
          if tPlayer.plays.count == 0 && solution.score < 30 {
            if let tile = pile.drawTile() {
            print("no solution... drawing tile \(tile)")
              tPlayer.rack.addTile(tile)
            } else {
              print("no tiles to draw")
            }
            
            
          } else {
            
            
            tPlayer.plays.append(solution)
            
            solution.groups.forEach({ (group) -> () in
              group.tiles.forEach({ (tile) -> () in
                board.insert(tile)
                tPlayer.rack.removeTile(tile)
              })
            })
 
          }
          
        } else {
        
          if let tile = pile.drawTile() {
            print("no solution... drawing tile \(tile)")
            tPlayer.rack.addTile(tile)
          } else {
            print("no tiles to draw")
          }

        }
        
        if tPlayer.rack.tiles.count == 0 {
          foundWinner = true
        }
        
        return tPlayer
        
      })
      
    }
    
    print("foundWinner:\(foundWinner)")
    printPlayersRacks()
    
  }
  
  func printPlayersRacks(){
    print("Players:-----------------------------------------------------------------")
    print(players.map{ $0.description }.joinWithSeparator("\n"))
    print("-------------------------------------------------------------------------")
  }
  func playSolution(solution:TileGroupPlay, board:Set<Tile>) {
    

  }

  
}