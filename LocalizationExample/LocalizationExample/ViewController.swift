//
//  ViewController.swift
//  LocalizationExample
//
//  Created by Son Nguyen on 3/25/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblHelloWorld: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblHelloWorld.text = helloWorld
    }


}

