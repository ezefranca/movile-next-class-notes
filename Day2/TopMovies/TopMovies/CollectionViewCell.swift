//
//  CollectionViewCell.swift
//  TopMovies
//
//  Created by Ezequiel on 21/07/18.
//  Copyright © 2018 Barbara Gomes. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewCell : UICollectionViewCell {
    var movie: Movie!
    
    @IBOutlet weak var movieImage: UIImageView!
    
    override func awakeFromNib() {
        movieImage.layer.cornerRadius = movieImage.frame.width / 2
        movieImage.layer.borderWidth = 2
        movieImage.layer.borderColor = #colorLiteral(red: 0.9969380498, green: 0.8286826611, blue: 0, alpha: 1)
    }
    
    func prepareForCell(with poster: String) {
        movieImage.image = UIImage(named: poster)
    }
}
