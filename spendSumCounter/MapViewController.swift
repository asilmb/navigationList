//
//  MapViewController.swift
//  spendSumCounter
//
//  Created by Admin on 08.06.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var MapView: MKMapView!
    
    var annotations: [MKPointAnnotation]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        MapView.addAnnotations(annotations)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
