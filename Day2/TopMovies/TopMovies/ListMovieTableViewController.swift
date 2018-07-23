//
//  ListMovieTableViewController.swift
//  TopMovies
//
//  Created by Ezequiel on 21/07/18.
//  Copyright © 2018 Barbara Gomes. All rights reserved.
//

import UIKit

class ListMovieTableViewController: UITableViewController {

    var movies : [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMovies()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func loadMovies() {
        guard let url = Bundle.main.url(forResource: "movies.json", withExtension: nil) else {
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            self.movies = try jsonDecoder.decode([Movie].self, from: data)
            self.tableView.reloadData()
        } catch {
            debugPrint(error.localizedDescription)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = self.movies[indexPath.row]
        let reuseIdentifier = movie.reuseIdentifier
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? MovieBaseCell else {
            return UITableViewCell()
        }
        cell.movie = self.movies[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //(cell as? MovieTableViewCell)?.movie = self.movies[indexPath.row]
        //cell.reloadInputViews()
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }

    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? MovieViewController, let cell = sender as? UITableViewCell, let index = tableView.indexPath(for: cell)?.row {
                vc.movie = self.movies[index]
        }
    }
 

}
