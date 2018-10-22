//
//  NewPlaceViewController.swift
//  spendSumCounter
//
//  Created by amubarak on 14.06.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import MapKit

class NewPlaceViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var spendLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var geoLabel: UILabel!
    @IBOutlet weak var trasportSegment: UISegmentedControl!
    @IBOutlet weak var descriptionLabel: UITextView!
    let placeModel: Place = Place()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let leftBackButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(closeNewPlaceView(sender:)))
        let rightSaveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(savePlace(sender:)))
        
//        self.navigationController?.navigationItem.rightBarButtonItems
        
        self.navigationItem.setRightBarButton(rightSaveButton, animated: true)
        self.navigationItem.setLeftBarButton(leftBackButton , animated: true)
        updateLabelsByPlaceModel(model: placeModel)
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - @IBAction
    
    @IBAction func backFromMap(sender: UIStoryboardSegue){
        
    }
    
    @IBAction func backFromExpence(sender: UIStoryboardSegue){
        let expenseVC = sender.source as? ExpenceViewController
        placeModel.spend = expenseVC!.spend
        updateLabelsByPlaceModel(model: placeModel)
    }
    
    @IBAction func nameChanged(_ sender: UITextField) {
        if let name = sender.text as? String{
            placeModel.name = name
            updateLabelsByPlaceModel(model: placeModel)
        }
    }
    
    @IBAction func rateChanged(_ sender: UIStepper) {
        if let step = Int(sender.value) as? Int{
            placeModel.rate = RateEnum(rawValue:RateEnum.RawValue(step))!
            updateLabelsByPlaceModel(model: placeModel)
        }
    }
    
    @IBAction func transportChange(_ sender: UISegmentedControl) {
    }
    
    @objc func closeNewPlaceView(sender: UIStoryboardSegue){
//        self.performSegue(withIdentifier: "closePlace", sender: self)
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func savePlace(sender: UIStoryboardSegue){
        self.performSegue(withIdentifier: "savePlace", sender: self)
    }
    
    // MARK: - Fucks

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMap" {
            let vc = segue.destination as! MapViewController
        }
        if segue.identifier == "showExpence"{
            let vc = segue.destination as! ExpenceViewController
            vc.spend = self.placeModel.spend
        }
        if segue.identifier == "savePlace" {
            let vc = segue.destination as! PlacesViewController
            updateLabelsByPlaceModel(model: self.placeModel)
            vc.place = self.placeModel
        }
    }
    
    func updateLabelsByPlaceModel(model placeModel: Place){
        spendLabel.text = "\(placeModel.spend.amount)\(placeModel.spend.currency.sign)"
        nameTextField.text = placeModel.name
        descriptionLabel.text = placeModel.description
        rateLabel.text = "\(placeModel.rate.rawValue)"
        
    }
    
    func updateModelByLabels(with sender: UIStoryboardSegue){
        if sender.identifier == "closeExpense" {
            let expenseVC = sender.source as! ExpenceViewController
            self.placeModel.spend = expenseVC.spend
            updateLabelsByPlaceModel(model: placeModel)
        }
        
        if sender.identifier == "closeMap" {
            //        geoLabel.text = :todo
            
        }
    }
    
 
    
}

//protocol UpdateModelDelegate {
//   
//    func updateModelByLabels(model place: Place)
//}
//
//protocol GetCurrentModel {
//    var placeModel: Place  { get set }
//}
//
// class NewPlaceViewController: UIViewController, UpdateModelDelegate, GetCurrentModel{
//    let placeModel: Place = Place()
//    
//    func updateModelByLabels(model place: Place){
//        place.name = placeModel.name
//        place.description = placeModel.description
//        place.rate = placeModel.rate
//        place.coordinate = placeModel.coordinate
//        place.spend = placeModel.spend
//        place.transportType = placeModel.transportType
//    }
//}
