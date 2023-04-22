//
//  ImageData.swift
//  PictureApp
//
//  Created by Son Nguyen on 4/22/23.
//

import Foundation
import RealmSwift


class ImageData: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var location: String = ""
    @objc dynamic var image: Data?
    
    override static func primaryKey() -> String? {
        return "title"
    }
}
