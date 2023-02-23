//
//  ViewController.swift
//  FoodItemsApp
//
//  Created by Son Nguyen on 2/22/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let imageNames = ["Mochi", "Oyakodon", "Okonomiyaki", "Ramen", "Sashimi", "Sushi", "Udon"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self)?.first as! TableViewCell
        cell.ImageContainer.image = UIImage(named: imageNames[indexPath.row])
        cell.lblImage.text = imageNames[indexPath.row]
        
        return cell
    }
}

