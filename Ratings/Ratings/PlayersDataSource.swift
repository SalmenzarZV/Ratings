//
//  PlayersDataSource.swift
//  Ratings
//
//  Created by DAM07 on 15/2/22.
//

import UIKit

class PlayersDataSource: NSObject {
  // MARK: - Properties
  var players: [Player]

  static func generatePlayersData() -> [Player] {
    return [
      Player(name: "Bill Evans", game: "Tic-Tac-Toe", rating: 4),
      Player(name: "Oscar Peterson", game: "Spin the Bottle", rating: 5),
      Player(name: "Dave Brubeck", game: "Texas Hold 'em Poker", rating: 2)
    ]
  }

  // MARK: - Initializers
  override init() {
    players = PlayersDataSource.generatePlayersData()
  }

  // MARK: - Datasource Methods
  func numberOfPlayers() -> Int {
    players.count
  }

  func append(player: Player, to tableView: UITableView) {
    players.append(player)
    tableView.insertRows(at: [IndexPath(row: players.count-1, section: 0)], with: .automatic)
  }

  func player(at indexPath: IndexPath) -> Player {
    players[indexPath.row]
  }
}

