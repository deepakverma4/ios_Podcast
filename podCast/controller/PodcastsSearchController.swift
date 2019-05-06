//
//  PodcastsSearchController.swift
//  podCast
//
//  Created by prabhat pankaj on 15/03/19.
//  Copyright © 2019 learnix. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage


class PodcastsSearchController: UITableViewController, UISearchBarDelegate{
    
 
    
    var podcasts = [Podcast]()
    
    let cellId = "searchCellId"
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "podcastCell", bundle: nil)
        tableView?.register(nib, forCellReuseIdentifier: cellId)
        tableView.estimatedRowHeight = 120.0
        tableView.tableFooterView = UIView()
        setupSearchBar()
        
    }
    
    func setupSearchBar(){
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController?.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        APIService.shared.fetchRequest(searchText: searchText) { (pod) in
            self.podcasts = pod
            self.tableView.reloadData()
            
            print(" self.podcasts", self.podcasts)
        }
        
        

    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "No Results Found!"
        label.textAlignment = .center
//        label.font = UIFont(
        return label
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.podcasts.count > 0 ? 0 : 250
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcasts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PodcastCell
        
        let podcast = podcasts[indexPath.row]
        cell.podCast = podcast
        
//        cell.titleLabel?.text = "\(podcast.trackName ?? "Unknown")\n\(podcast.artistName ?? "Unknown")"

//        cell.titleLabel?.numberOfLines = -1
//        cell.imageView?.image = UIImage(named: "podcastIcon.jpg")
        return cell
    
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
