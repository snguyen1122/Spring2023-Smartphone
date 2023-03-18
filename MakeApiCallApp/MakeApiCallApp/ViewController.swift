//
//  ViewController.swift
//  MakeApiCallApp
//
//  Created by Son Nguyen on 3/18/23.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner
class ViewController: UIViewController {

    @IBOutlet weak var txtWebsite: UILabel!
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var txtName: UILabel!
    @IBOutlet weak var txtPrice: UILabel!
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func getStockDetails(_ sender: Any) {
        guard let symbol = txtField.text else {return}
        let url = "\(baseUrl)\(symbol)?apikey=\(apiKey)"
        
        SwiftSpinner.show("Getting stock info for \(symbol)")
        print(url)
        AF.request(url).responseJSON {response in
            SwiftSpinner.hide()
            if response.error != nil {
                print("Error in response")
                return
            }
            guard let rawData = response.data else {return}
            guard let jsonArray = JSON(rawData).array else {return}
            print(jsonArray)
            guard let stock = jsonArray.first else {return}
            print(stock)
            let name = stock["companyName"].stringValue
            let price = stock["price"].doubleValue
            let website = stock["website"].stringValue
            self.txtName.text = name
            self.txtPrice.text = String(format: "%f", price)
            self.txtWebsite.text = website
        }
    }
}

