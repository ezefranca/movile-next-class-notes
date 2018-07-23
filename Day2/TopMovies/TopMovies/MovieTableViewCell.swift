//
//  MovieTableViewCell.swift
//  TopMovies
//
//  Created by Ezequiel on 21/07/18.
//  Copyright © 2018 Barbara Gomes. All rights reserved.
//

import UIKit

class MovieBaseCell : UITableViewCell {
    var movie: Movie!
}

class MovieTableViewCell: MovieBaseCell {
    
    override var movie: Movie! {
        didSet {
            movieTitle.text = movie.movieTitle
            movieSinopse.text = movie.movieSummary
            movieRating.text = movie.movieRating
            movieImage.image = UIImage(named: movie.movieImage)
        }
    }

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieSinopse: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
