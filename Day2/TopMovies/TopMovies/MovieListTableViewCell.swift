//
//  MovieListTableViewCell.swift
//  TopMovies
//
//  Created by Ezequiel on 21/07/18.
//  Copyright © 2018 Barbara Gomes. All rights reserved.
//

import UIKit

class MovieListTableViewCell: MovieBaseCell {
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override var movie: Movie! {
        didSet {
            movieTitle.text = movie.movieTitle
            self.collectionView.reloadData()
        }
    }
        
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.dataSource = self
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
        }
        self.collectionView.reloadData()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension MovieListTableViewCell : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movie.lancamentos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.prepareForCell(with: self.movie.items![indexPath.row].movieImage)
        return cell
    }
    
}








