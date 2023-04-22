//
//  TabBarViewController.swift
//  PictureApp
//
//  Created by Son Nguyen on 4/22/23.
//

import UIKit
import RealmSwift

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        let homeViewController = viewControllers?[0] as! HomeViewController
        let uploadPicVC = viewControllers?[2] as! UploadViewController
        uploadPicVC.uploadProtocol = homeViewController.self
    }


}
