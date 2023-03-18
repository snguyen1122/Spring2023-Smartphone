//
//  DetailViewController.swift
//  SevenWondersApp
//
//  Created by Son Nguyen on 3/18/23.
//

import UIKit

class DetailViewController: UIViewController {

    var detailsText = ""
    @IBOutlet weak var txtDetails: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        txtDetails.text = detailsText
        // Do any additional setup after loading the view.
    }

}
