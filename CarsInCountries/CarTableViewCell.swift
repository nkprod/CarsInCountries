//
//  CarTableViewCell.swift
//  CarsInCountries
//
//  Created by Nulrybek Karshyga on 7/14/20.
//  Copyright © 2020 Nulrybek Karshyga. All rights reserved.
//

import UIKit

class CarTableViewCell: UITableViewCell {
    
    

    
    var car : [Any]? {
        didSet {
            carImage.image = car?[3] as! UIImage
            carName.text = car?[0] as! String

            if let price = car?[1] as? Int {
                carPrice.text = "$\(price)"
            }
        }
    }

    
    private let carImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "porsche"))
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    private let carName: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = ".red"
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir-Light", size: 16)
        return label
    }()
    
    private let carPrice: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = ".red"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0

        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()

        
        addSubview(carImage)
        
        addSubview(carName)

        addSubview(carPrice)
        
        carImage.translatesAutoresizingMaskIntoConstraints = false
        
        carImage.leftAnchor.constraint(equalTo: leftAnchor , constant: 10).isActive = true
        
        carImage.topAnchor.constraint(equalTo: topAnchor , constant: 10).isActive = true
        carImage.bottomAnchor.constraint(equalTo: bottomAnchor , constant: -10).isActive = true
        
        carImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
                        // carName anchors
        carName.translatesAutoresizingMaskIntoConstraints = false
        carName.widthAnchor.constraint(equalToConstant: frame.width/2).isActive = true
        
        carName.leftAnchor.constraint(equalTo: carImage.rightAnchor , constant: 20).isActive = true
        
        carName.topAnchor.constraint(equalTo: topAnchor , constant: 30).isActive = true
        
        
                // carPrice anchors
        carPrice.translatesAutoresizingMaskIntoConstraints = false
        carPrice.widthAnchor.constraint(equalToConstant: frame.width/2 - 60).isActive = true
        
        carPrice.leftAnchor.constraint(equalTo: carName.rightAnchor , constant: 10).isActive = true
        
        carPrice.topAnchor.constraint(equalTo: topAnchor , constant: 30).isActive = true
        
        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
