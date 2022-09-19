//
//  MoviesListViewController.swift
//  marcuslecture
//
//  Created by Yunseong Hwang on 2022/09/11.
//

import UIKit

final class MoviesListViewController: UIViewController, Alertable {

  
    private var viewModel : MoviesListViewModel!
    private var posterImageRepository : PosterImagesRepository?
    
    private var moviesTableViewController : MoviesListTableViewController>?
    private var searchController = UISearchController(searchResultsController: nil)
    
    static func create(with viewModel : MoviesListViewModel,
                       posterImageRepository : PosterImagesRepository?) -> MoviesListViewController {
        let view = MoviesListViewController.
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
