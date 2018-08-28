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
    var spend: Spend = Spend(howMuch: 0, currency: CurrencyEnum.usd)

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        self.updateViewFields()
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
    

    @IBAction func amountChanged(_ sender: UITextField) {
        if let amountInput =  Double(sender.text!){
            self.spend.amount = amountInput
        }
        
    }
    
    @IBAction func currencyChanged(_ sender: UISegmentedControl) {
        let currency = self.currency.titleForSegment(at: self.currency.selectedSegmentIndex)
        let currencyEnum = CurrencyEnum(rawValue: CurrencyEnum.RawValue(currency!))!
        self.spend.currency = currencyEnum
    }
    
    private func configureUI() {
        backgroundView.layer.cornerRadius = 6
        
        doneButton.layer.cornerRadius = 8
        
        readyButton.layer.cornerRadius = 6

    }
    func updateViewFields() {
        self.amount.text = "\(self.spend.getStringSum())"
        self.currency.titleForSegment(at: self.spend.getCurrencyHash())
    }
    
}

