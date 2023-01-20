//
//  ViewController.swift
//  Hello World
//
//  Created by Son Nguyen on 1/19/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Hello from the other side")
    }
    
    @IBAction func pressMeAction(_ sender: UIButton) {
        print("Button was pressed")
        label.text = "Hello World"
    }
    
    @IBOutlet weak var label: UILabel!
}

