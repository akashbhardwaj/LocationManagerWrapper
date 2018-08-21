//
//  ViewController.swift
//  LocationManager
//
//  Created by Akash BhardwaJ on 21/08/18.
//  Copyright © 2018 Akash BhardwaJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lbllat: UILabel!
    @IBOutlet weak var lblLong: UILabel!
    let locationManager = LocationManager(withAccuracy: LMLocationAccuracy.bestForNavigation)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnGetLocationAction(_ sender: UIButton) {
        locationManager.getCurrentLocation { (response) in
            switch response {
            case .failure(let locationError):
                switch locationError {
                case .authorizationFailed(let description):
                    print(description)
                case .locationUpdationFailed(let description):
                    print(description)
                }
            case .success(let location):
                print("location is :", location)
                self.lbllat.text = "\(location.coordinate.latitude)"
                self.lblLong.text = "\(location.coordinate.longitude)"
            }
        }
    }
    
    

}

