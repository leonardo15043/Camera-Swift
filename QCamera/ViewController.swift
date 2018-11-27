//
//  ViewController.swift
//  QCamera
//
//  Created by leonardo hernandez on 11/26/18.
//  Copyright © 2018 leonardo hernandez. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate{

    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Titulo alerta", message: "Subtitulo alerta", preferredStyle: .actionSheet)
        
        let cameraAlert = UIAlertAction(title: "Tomar foto", style: .default) { (action) in
            imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true, completion: nil)
        }
        
        let fotoAlert = UIAlertAction(title: "Buscar foto", style: .default) { (action) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }
        
        let cancelAlert = UIAlertAction(title: "Cancelar", style: .default)
        
        actionSheet.addAction(cameraAlert)
        actionSheet.addAction(fotoAlert)
        actionSheet.addAction(cancelAlert)
        
        present(actionSheet, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imageView.image = image
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        dismiss(animated: true, completion: nil)
        
    }
    
}

