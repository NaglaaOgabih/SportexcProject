//
//  ChildDataViewController.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 09/04/2022.
//

import UIKit
import Alamofire

class ChildAddDataViewController: UIViewController {

    @IBOutlet weak var childBirhdateTxtField: UITextField!
    let dataPicker = UIDatePicker()
    var imageId : Int?
    var selectedPresonalCardImg : UIImage?
    var selectedPresonalImg : UIImage?
    @IBOutlet weak var healthProblemYesBtn: UIButton!
    @IBOutlet weak var healthProblemNoBtn: UIButton!
    @IBOutlet weak var vaccinationYesBtn: UIButton!
    @IBOutlet weak var vaccinationNoBtn: UIButton!
    @IBOutlet weak var healthProblemTxtField: UITextField!
    @IBOutlet weak var vaccinationTxtField: UITextField!
    @IBOutlet weak var healthProplemView: UIView!

    @IBOutlet weak var vaccinationView: UIView!
    @IBOutlet weak var healthProblemYesImg: UIImageView!
    
    @IBOutlet weak var healthProblemNoImg: UIImageView!
    
    @IBOutlet weak var vaccinationYesImg: UIImageView!
    
    @IBOutlet weak var vaccinationNoImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDataPicker()
        navigationItem.title = "Add a child"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes

        let backButton = UIBarButtonItem()
        backButton.image = UIImage(systemName: "chevron.backward")
        navigationItem.leftBarButtonItem = backButton
        
    
    }
    @IBAction func addBtnPressed(_ sender: Any) {
        childDataApi()
    }
    @IBAction func personalCardImgPressed(_ sender: Any) {
        imageId = 1
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)

        
    }
    @IBAction func personalImgPressed(_ sender: Any) {
        imageId = 2
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    @IBAction func healthProblemYesBtnPressed(_ sender: Any) {
        healthProblemYesImg.image = UIImage(named: "dot-circle")
        healthProblemNoImg.image = UIImage(named: "circle")
        healthProplemView.isHidden = false

    }
    
    @IBAction func healthProblemNoBtnPressed(_ sender: Any) {
        
        healthProblemNoImg.image = UIImage(named: "dot-circle")
        healthProblemYesImg.image = UIImage(named: "circle")
        healthProplemView.isHidden = true
    }
    
    @IBAction func vaccinationYesBtnPressed(_ sender: Any) {
        vaccinationYesImg.image = UIImage(named:"dot-circle")
        vaccinationNoImg.image = UIImage(named: "circle")
        vaccinationView.isHidden = false
    }
    @IBAction func vaccinationNoBtnPressed(_ sender: Any) {
        vaccinationYesImg.image = UIImage(named:"circle")
        vaccinationNoImg.image = UIImage(named: "dot-circle")
        vaccinationView.isHidden = true

    }
    
    func createDataPicker(){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        doneButton.tintColor = UIColor.black
        toolBar.setItems([doneButton], animated: true)
        childBirhdateTxtField.inputAccessoryView = toolBar
        childBirhdateTxtField.inputView = dataPicker
        dataPicker.preferredDatePickerStyle = .wheels
        dataPicker.locale = .current
        dataPicker.tintColor = UIColor(named: "CustomYellow")
        dataPicker.frame.size = CGSize(width: 0, height: 200)
        dataPicker.datePickerMode = .date
        
    }
    @objc func donePressed(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        childBirhdateTxtField.text = formatter.string(from: dataPicker.date)
        self.view.endEditing(true)
    }
    
    func childDataApi(){
//        let decoder = JSONDecoder()
        let params:[String : String] = [
            "parent_id": "1",
            "child_name": "Child one",
            "id_no" : "50000",
            "birthdate" : "1996-09-28",
            "child_gender" : "female",
            "image" : "",
            "image_id" : "",
            "child_diseases" : "1",
            "child_diseases_details" : "heartattach",
            "vaccination" : "0",
            "vaccination_no" : "0",
            "branch_id" : "1",
            "lang" : "en"
        ]
        let headers: HTTPHeaders = [:]
        AF.upload(multipartFormData: { (form: MultipartFormData) in
            let cardImg = self.selectedPresonalCardImg?.jpegData(compressionQuality: 0.25)
            let personalImg = self.selectedPresonalImg?.jpegData(compressionQuality: 0.25)
            for (key, value) in params {
                form.append(value.data(using: .utf8)! , withName: key)
            }
            form.append(cardImg! , withName: "image" , fileName: "photo.jpeg", mimeType: "image/jpg")
            form.append(personalImg! , withName: "image_id" , fileName: "photo.jpeg", mimeType: "image/jpg")

//            if let data = UiImageJpeg
        }, to: "https://sportexcbh.com/api/add_child.php", method: .post, headers: headers)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    print("success")
                    print(response)
                    print(value)
                case .failure(let error):
                    print("fail")
                    print(error.localizedDescription)
                }
            }
    }
}

