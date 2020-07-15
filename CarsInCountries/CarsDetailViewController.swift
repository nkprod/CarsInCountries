//
//  CarsDetailViewController.swift
//  CarsInCountries
//
//  Created by Nulrybek Karshyga on 7/14/20.
//  Copyright © 2020 Nulrybek Karshyga. All rights reserved.
//

import UIKit
import Foundation

protocol carsDelegate: class {
    func modifyCars(image: UIImage?, index: Int?, section: Int?)
}

class CarsDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var name: String?
    var image: UIImage?
    var price: Int?
    var horsepower: Int?
    var selectionDelegate: carsDelegate!
    var index: Int?
    var section: Int?
    private let carImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.font = UIFont(name: "Avenir-Light", size: 36)
        return lbl
    }()
    
    private let priceLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.font = UIFont(name: "Avenir", size: 24)
        return lbl
    }()
    private let horsepowerLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.font = UIFont(name: "Avenir", size: 24)
        return lbl
    }()
    private let cameraButton: UIButton = {
        let button = UIButton()
        button.setTitle("📷", for: .normal)
        button.setTitleColor(UIColor(white: 1, alpha: 0.5), for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 5
        button.heightAnchor.constraint(equalToConstant: 50)
        
        return button
    }()
    
    @objc func btnPressed(_ sender: UIButton){
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carImageView.image = image
        titleLabel.text = name
        if let horsepower = horsepower {
            horsepowerLabel.text = "Horsepower(up to): \(horsepower) HP"
        }
        if let price = price {
            priceLabel.text = "Average Price: $\(price)"
        }
        view.addSubview(carImageView)
        view.addSubview(priceLabel)
        view.addSubview(titleLabel)
        view.addSubview(horsepowerLabel)
        view.addSubview(cameraButton)
        cameraButton.addTarget(self, action: #selector(btnPressed(_:)), for: .touchUpInside)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 50)
        titleLabel.centerX(inView: view)
        carImageView.anchor(top: titleLabel.bottomAnchor, paddingTop: 150 , width: 350, height: 350)
        carImageView.centerX(inView: view)
        priceLabel.anchor(top:carImageView.bottomAnchor)
        priceLabel.centerX(inView: view)
        horsepowerLabel.anchor(top:priceLabel.bottomAnchor)
        horsepowerLabel.centerX(inView: view)
        cameraButton.anchor(top: horsepowerLabel.bottomAnchor,paddingTop: 20, width: view.frame.width, height: 50)
        cameraButton.centerX(inView: view)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)

        guard let image = info[.editedImage] as? UIImage else {
            print("No image found")
            return
        }
        // print out the image size as a test
        carImageView.image = image
        
        
        // delegate methods to change the image of the car
        guard let name = titleLabel.text else {return}
        guard let newImage: UIImage = image else {return}
        selectionDelegate.modifyCars(image: newImage, index: index, section: section)
        
        print(image.size)
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
