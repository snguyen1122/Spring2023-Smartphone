//
//  HomeViewController.swift
//  PictureApp
//
//  Created by Son Nguyen on 4/22/23.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UploadImageProtocol {
    
    let realm = try! Realm()
    
    var images : [UIImage] = [UIImage]()
    var locations = [String]()
    var imageTitles : [String] = [String]()

    @IBOutlet weak var tblView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        getImages()
    }
    
    func getImages()
    {
        let stocks = realm.objects(ImageData.self)
        for img in stocks{
            guard let uiImage = UIImage(data: img.image!) else {return}
            images.append(uiImage)
            locations.append(img.location)
            imageTitles.append(img.title)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        imageTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self)?.first as! TableViewCell
        cell.imageContainer.image = images[indexPath.row]
        cell.txtTitle.text = imageTitles[indexPath.row]
        cell.txtLocation.text = locations[indexPath.row]
        return cell
    }
    
    func uploadedImageDelegate(img: UIImage, locationImg: String, titleImg: String) {
        images.append(img)
        locations.append(locationImg)
        imageTitles.append(titleImg)
        
        tblView.reloadData()
    }
}
