//
//  TableViewController.swift
//  RedditObjC
//
//  Created by Kelsey Sparkman on 3/25/20.
//  Copyright © 2020 Kelsey Sparkman. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var posts: [ROCPost] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        ROCPostController.fetchPosts { (posts) in
            self.posts = posts
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? TableViewCell else {return UITableViewCell()}

        // Configure the cell...
        let post = posts[indexPath.row]
        cell.postTitleLabel.text = post.title
        
        ROCPostController.fetchImage(for: post) { (image) in
            DispatchQueue.main.async {
            cell.postThumbnailImageView.image = image ?? #imageLiteral(resourceName: "reddit")
            }
        }
        return cell
    }
}
