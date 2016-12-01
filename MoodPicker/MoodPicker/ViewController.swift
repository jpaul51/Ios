//
//  ViewController.swift
//  MoodPicker
//
//  Created by iem on 01/12/2016.
//  Copyright © 2016 iem. All rights reserved.
//
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
import UIKit
import Social

class ViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    
    
    @IBOutlet weak var inputText: UITextField!
    let ACTIONS_COMP = 0
   let  FEELING_COMP = 1
    @IBOutlet weak var moodPicker: UIPickerView!
    @IBOutlet weak var submitButton: UIButton!
    var feelings = [String]()
    var actions = [String]()
    
        override func viewDidLoad() {
        super.viewDidLoad()
           
             self.hideKeyboardWhenTappedAround() 
        // Do any additional setup after loading the view, typically from a nib.
            self.actions=["dors","mange","suis en cours","galère","cours"]
            self.feelings=[":)",";)",":O"]
            
            self.moodPicker.dataSource=self
            self.moodPicker.delegate=self
            
          
    }

    

    //MARK: - Delegates and data sources
    //MARK: Data Sources
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(component == ACTIONS_COMP){
            return self.actions.count;
        }
        else{
            return self.feelings.count;
        }

    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var  titleForRowCount = 0//Initialisation exécutée une seule fois
        titleForRowCount+=1;
        NSLog("Nb appels: %ld / comp: %ld / row: %ld", titleForRowCount,component,row);
        
        if(component == ACTIONS_COMP){
            return self.actions[row];
        }
        else{
            return self.feelings[row];
        }
        

    }
    
    
    @IBAction func submitAction(_ sender: UIButton) {
         let row = moodPicker.selectedRow(inComponent: ACTIONS_COMP)
               let action = self.actions[row];
        let feeling = self.feelings[self.moodPicker.selectedRow(inComponent: FEELING_COMP)]
        let message = inputText.text! + ". Je " + action + " et je me sens " + feeling
        NSLog(message)
        
       
        if (SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter))
        {
           let   tweetSheet = SLComposeViewController.init(forServiceType: SLServiceTypeTwitter)
            tweetSheet?.setInitialText(message)
            self.present(tweetSheet!, animated: true, completion: nil)
            
        }
        else
        {
            
            
            
            let alertController = UIAlertController(title: "Hey AppCoda", message: "What do you want to do?", preferredStyle: .alert)

            
            let callActionHandler = { (action:UIAlertAction!) -> Void in
                let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .alert)
                alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alertMessage, animated: true, completion: nil)
            }
            let callAction = UIAlertAction(title: "Call", style: .default, handler: callActionHandler)
            alertController.addAction(callAction)
            
        }

        
        

    }
    
    

   
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

