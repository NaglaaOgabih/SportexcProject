//
//  ViewController.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 10/04/2022.
//

import UIKit
extension ChildAddDataViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //        if let imgUrl = info[UIImagePickerController.InfoKey.imageURL] as? URL{
        //            let imgName = imgUrl.lastPathComponent
        //            let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        //            let localPath = documentDirectory?.appending(imgName)
        //
        //            let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        //            let data = image.pngData()! as NSData
        //            data.write(toFile: localPath!, atomically: true)
        //            //let imageData = NSData(contentsOfFile: localPath!)!
        //            let photoURL = URL.init(fileURLWithPath: localPath!)//NSURL(fileURLWithPath: localPath!)
        //            //              print(photoURL)
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        if imageId == 1{
            selectedPresonalCardImg = image
        }else{
            selectedPresonalImg = image
        }
        
        //        print(info)
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}
