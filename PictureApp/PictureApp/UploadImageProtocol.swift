//
//  UploadImageProtocol.swift
//  PictureApp
//
//  Created by Son Nguyen on 4/22/23.
//

import Foundation
import UIKit

protocol UploadImageProtocol{
    
    func uploadedImageDelegate(img : UIImage, locationImg: String, titleImg: String)
    
}
