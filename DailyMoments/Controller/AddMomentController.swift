//
//  AddMomentController.swift
//  DailyMoments
//
//  Created by Jogi Oktavianus on 03/09/20.
//  Copyright © 2020 Jogi Oktavianus. All rights reserved.
//

import UIKit

class AddMomentController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var dateView: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Function create Rectangle rounded
        self.textView.delegate = self
        textView.layer.cornerRadius = 8
        textView.layer.borderWidth = 1.5
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.text = "Add your story here!"
        
        //Function to call UIDatePicker
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.addTarget(self, action: #selector(AddMomentController.datePickerValueChanged(sender:)), for: UIControl.Event.valueChanged)
        dateView.inputView = datePicker
    }
    
    //MARK: - Func Choose Image
    
    @IBAction func chooseImage(_ sender: Any) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        //Alert Notification
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        
        //Photo From Camera
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action: UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            }
            else {
                print("Camera not available")
            }
        }))
        
        //Photo from Photo Library
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action: UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
         
        //Cancel Button
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    //MARK: - UIImagePickerControlle DidFinishMediaInfo
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    let image = info [UIImagePickerController.InfoKey.originalImage] as! UIImage
        imageView.image = image                                         //Populate ImageView and It's Image Property, Then Assign into image
        picker.dismiss(animated: true, completion: nil)                 //Pass image along delegate
    }
    
    //MARK: - UIImagePickerController DidCancel
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - UITextView
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.textView.resignFirstResponder()
        self.dateView.resignFirstResponder()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.backgroundColor = UIColor.lightGray
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.backgroundColor = UIColor.white
    }
    
    //MARK: - UIDatePicker
    @objc func datePickerValueChanged(sender: UIDatePicker){
        let formatter = DateFormatter()
        
        formatter.dateStyle = DateFormatter.Style.medium
        
        formatter.timeStyle = DateFormatter.Style.none
        
        dateView.text = formatter.string(from: sender.date)
    }
}
