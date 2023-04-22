//
//  UploadViewController.swift
//  PictureApp
//
//  Created by Son Nguyen on 4/22/23.
//

import UIKit
import CoreLocation
import RealmSwift

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate{
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var txtTitle: UITextField!
    var uploadProtocol: UploadImageProtocol?
    let realm = try! Realm()
    var locationText = ""
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    }
    
    @IBAction func takeAPictureAction(_ sender: Any) {
        let actionSheet = UIAlertController(title: "Get picture", message: "Options", preferredStyle: .alert)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default){ action in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerController.SourceType.camera;
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true)
                self.locationManager.requestLocation()
            }
            
        }
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default){ action in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary;
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true)
                self.locationManager.requestLocation()
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel){ action in
            print("Cancel")
            
        }
        
        actionSheet.addAction(cameraAction)
        actionSheet.addAction(photoLibraryAction)
        actionSheet.addAction(cancel)
        
        self.present(actionSheet, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imgView.image = image
        }
        
        picker.dismiss(animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        let lat = location.coordinate.latitude
        let log = location.coordinate.longitude
        locationText = "Lat: \(lat), Log: \(log)"
    }
    
    @IBAction func uploadImage(_ sender: Any) {
        guard let img = imgView.image else {return}
        let location = locationText
        guard let title = txtTitle.text else {return}
        
        let imageData: Data? = img.jpegData(compressionQuality: 0.1)
        let imgData: ImageData = ImageData()
        imgData.title = title
        imgData.location = location
        imgData.image = imageData
       
        // Add to the Realm
        do {
            try realm.write {
                realm.add(imgData, update: .modified)
            }
        } catch let error as NSError {
            print("Unable to add values to the DB " + error.localizedDescription)
        }
        uploadProtocol?.uploadedImageDelegate(img: img, locationImg: location, titleImg: title)
        tabBarController?.selectedIndex = 0
    }
}
