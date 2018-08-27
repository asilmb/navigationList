//
//  PlacesViewController.swift
//  spendSumCounter
//
//  Created by amubarak on 14.06.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class PlacesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var cities: [Place] = []
    var place: Place?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rightAddButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createNewPlace(sender:)))
        self.navigationItem.setRightBarButton(rightAddButton, animated: true)
//
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    @IBAction func createNewPlace(sender: Any?){
        self.performSegue(withIdentifier: "showPlace", sender: self)
    }
    
    @IBAction func closeNewPlaceView(sender: UIStoryboardSegue){
        
    }
    
    @IBAction func savePlace(sender: UIStoryboardSegue){
//        let newPlaceVC = sender.destination as? NewPlaceViewController
//        print (newPlaceVC?.nameTextField.text)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = cities[]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
