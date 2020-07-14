//
//  ViewController.swift
//  CarsInCountries
//
//  Created by Nulrybek Karshyga on 7/14/20.
//  Copyright © 2020 Nulrybek Karshyga. All rights reserved.
//

import UIKit

protocol carsDelegate {
    func modifyCars(image: UIImage)
}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, carsDelegate{

    func modifyCars(image: UIImage){
        cars.
    }
    enum Countries: String {
        case US
        case Germany
    }
    let carTypes = ["Germany", "US"]
    let cars : [String : [(make: String, horsepower: Int, price: Int, image: UIImage)]] =
               ["Germany" : [("Audi TT", 220, 45500, #imageLiteral(resourceName: "audi")),
                        ("Porsche 718 Cayman",414, 57500, #imageLiteral(resourceName: "porsche")),
                        ("Mercedes-Benz SLC-Class", 385, 49950, #imageLiteral(resourceName: "mercedes")),
                        ("BMW 2 Series", 248, 35_300, #imageLiteral(resourceName: "bmw"))],
                "US": [("Chevrolet Corvette", 495, 58900,#imageLiteral(resourceName: "Chevrolet Corvette")),
                       ("Tesla Model S", 402, 74900, #imageLiteral(resourceName: "tesla")),
                       ("Jeep Cherokee", 271, 25045, #imageLiteral(resourceName: "Jeep Cherokee")),
                       ("GMC Canyon", 308, 22200, #imageLiteral(resourceName: " GMC Canyon"))]]

    @IBOutlet weak var carsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        carsTableView.delegate = self
        carsTableView.dataSource = self
        
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CarTableViewCell
        let country = carTypes[indexPath.section]
        if let car = cars[country]?[indexPath.row] {
            cell.car = car
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(carTypes[section])"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars[Countries.US.rawValue]?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(withIdentifier: "CarsDetailViewController") as! CarsDetailViewController
        let country = carTypes[indexPath.section]
        if let car = cars[country]?[indexPath.row] {
            vc.name = car.make
            vc.image = car.image
            vc.horsepower = car.horsepower
            vc.price = car.price
        }
        
        present(vc, animated: true, completion: nil)
    }
}

