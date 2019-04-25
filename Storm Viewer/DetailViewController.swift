//
//  DetailViewController.swift
//  Storm Viewer
//
//  Created by Carlos Irigoyen on 4/22/19.
//  Copyright © 2019 Carlos Irigoyen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  @IBOutlet var imageView: UIImageView!
  // Es un opcional porque inicialmente no se tendra ningun seleccionado
  var selectedImage: String?
  var totalImagesCount: Int?
  var selectedImagePosition: Int?
  
    override func viewDidLoad() {
      super.viewDidLoad()
      
      // Title Large on Item set Never
      title = "Picture \(selectedImagePosition ?? 0) of \(totalImagesCount ?? 0)"
      navigationItem.largeTitleDisplayMode = .never
      
      // Display button on navigationBar for Share Content
      navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))

      
      if let imageToLoad = selectedImage {
        imageView.image = UIImage(named: imageToLoad)
      }
    }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.hidesBarsOnTap = true
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    navigationController?.hidesBarsOnTap = false
  }
  
  @objc func shareTapped() {
    // Para permitir el guardado de las imagenes en el dispositivo debemos aplicar un cambio sobre info.plist
    // Añadir un nuevo Row, agregar Privacy Photo Library "Privacy - Photo Library Additions Usage Descrip" and add text description
    
    
    guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
      print("Image not found")
      return
    }
    
    let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
    vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
    present(vc, animated: true)
  }
  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
