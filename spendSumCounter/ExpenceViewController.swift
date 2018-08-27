//
//  ViewController.swift
//  spendSumCounter
//
//  Created by Admin on 21.05.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class ExpenceViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var currency: UISegmentedControl!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
       
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let ACCEPTABLE_CHARACTERS = "0123456789."

        let characterSet = CharacterSet(charactersIn: ACCEPTABLE_CHARACTERS).inverted
        let filtered = string.components(separatedBy: characterSet).joined(separator: "")
        
        return (string == filtered)
    }
    
    @IBOutlet var backgroundView: UIView!
    
    @IBOutlet weak var doneButton: UISegmentedControl!
    
    @IBOutlet weak var readyButton: UIButton!
    

    private func configureUI() {
        backgroundView.layer.cornerRadius = 6
        
        doneButton.layer.cornerRadius = 8
        
        readyButton.layer.cornerRadius = 6

    }
    func updateViewFields(model placeModel: Place) {
        let spend = placeModel.spend
        guard let spendSum = String(format:"%f", placeModel.spend.sum) as String? else {
            return
        }
        amount.text = spendSum
        currency.titleForSegment(at: spend.currency.hashValue)
    }
    func updateSpendFields(model placeModel: Place) {
        let currency = self.currency.titleForSegment(at: self.currency.selectedSegmentIndex)
        let currencyEnum = CurrencyEnum(rawValue: CurrencyEnum.RawValue(currency!))!
        if let amountInput =  Double(amount.text!){
            placeModel.spend = Spend(howMuch: amountInput, currency: currencyEnum)
        }
    }
}

