//
//  PlayerDetailsViewController.swift
//  Ratings
//
//  Created by DAM07 on 15/2/22.
//

import UIKit

class PlayerDetailsViewController: UITableViewController {
    var player: Player?

    required init?(coder aDecoder: NSCoder) {
      print("init PlayerDetailsViewController")
      super.init(coder: aDecoder)
    }

    deinit {
      print("deinit PlayerDetailsViewController")
    }

    
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var detailLabel: UILabel!
    
    var game = "" {
      didSet {
        detailLabel.text = game
      }
    }
    
    override func viewDidLoad() {
      game = "Chess"
        nameTextField.becomeFirstResponder()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)  {
        if segue.identifier == "SavePlayerDetail",
           let playerName = nameTextField.text,
           let gameName = detailLabel.text {
          player = Player(name: playerName, game: gameName, rating: 1)
        }

        
        
      if segue.identifier == "PickGame",
         let gamePickerViewController = segue.destination as? GamePickerViewController {
        gamePickerViewController.gamesDataSource.selectedGame = game
      }
    }

}

extension PlayerDetailsViewController {
  @IBAction func unwindWithSelectedGame(segue: UIStoryboardSegue) {
      if let gamePickerViewController = segue.source as? GamePickerViewController,
         let selectedGame = gamePickerViewController.gamesDataSource.selectedGame {
        game = selectedGame
      }

  }
}


