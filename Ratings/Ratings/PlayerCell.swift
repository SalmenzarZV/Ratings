//
//  PlayerCell.swift
//  Ratings
//
//  Created by DAM07 on 15/2/22.
//

import UIKit

class PlayerCell: UITableViewCell {
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    
    // 1:
    var player: Player? {
      didSet {
        guard let player = player else { return }

        gameLabel.text = player.game
        nameLabel.text = player.name
        ratingImageView.image = image(forRating: player.rating)
      }
    }

    // 2:
    private func image(forRating rating: Int) -> UIImage? {
      let imageName = "\(rating)Stars"
      return UIImage(named: imageName)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
