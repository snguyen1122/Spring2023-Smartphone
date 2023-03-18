//
//  ViewController.swift
//  SevenWondersApp
//
//  Created by Son Nguyen on 3/18/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let imageNames = ["Chichen Itza", "Christ The Redeemer", "Colosseum", "Great Wall Of China", "Machu Picchu", "Petra", "Taj Mahal"]
    var selectedRow = -1
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self)?.first as! TableViewCell
        cell.ImageContainer.image = UIImage(named: imageNames[indexPath.row].replacingOccurrences(of: " ", with: ""))
        cell.ImageLabel.text = imageNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        performSegue(withIdentifier: "SegueDetails", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueDetails" {
            let secondVC = segue.destination as! DetailViewController
            let details = imageText[selectedRow]
            secondVC.detailsText = details
        }
    }

}

