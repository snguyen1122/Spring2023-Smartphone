//
//  ViewController.swift
//  RestaurantApp
//
//  Created by Son Nguyen on 2/18/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let restaurants = ["Dominos", "Ichiran", "Matsuya", "McDonalds", "Pho24"]
    let menuItems = ["Dominos": ["Pizzas", "Wings", "Pasta", "Sandwiches"],"Ichiran": ["Ramen", "Matcha Pudding"], "Matsuya":["Gyumeshi", "Curry"], "McDonalds":["Burgers", "Fries"], "Pho24":["Pho"]]
    
    var selectedRestaurant = ""
    
    @IBOutlet weak var tblViewTop: UITableView!
    @IBOutlet weak var tblViewBottom: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (tableView == tblViewTop)
        {
            return restaurants.count
        }
        else
        {
            return menuItems[selectedRestaurant]?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = (tableView == tblViewTop) ? restaurants[indexPath.row] : menuItems[selectedRestaurant]?[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (tableView == tblViewTop)
        {
            selectedRestaurant = restaurants[indexPath.row]
        }
        tblViewBottom.reloadData()
    }
}

