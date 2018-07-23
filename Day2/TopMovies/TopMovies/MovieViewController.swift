//
//  MovieViewController.swift
//  TopMovies
//
//  Created by Ezequiel on 21/07/18.
//  Copyright © 2018 Barbara Gomes. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController, UIGestureRecognizerDelegate {

    var movie: Movie? = nil
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieCategories: UILabel!
    @IBOutlet weak var movieDuration: UILabel!
    @IBOutlet weak var movieSinopse: UITextView!
    @IBOutlet weak var movieRating: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let movie = movie {
            self.movieImage.image = UIImage(named: movie.movieImage)
            self.movieTitle.text = movie.movieTitle
            self.movieCategories.text = movie.movieCategories
            self.movieDuration.text = movie.movieDuration
            self.movieSinopse.text = movie.movieSummary
            self.movieRating.text = movie.movieRating
            navigationController?.interactivePopGestureRecognizer?.delegate = self
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
