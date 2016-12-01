//
//  ViewController.swift
//  ColorPicker
//
//  Created by iem on 01/12/2016.
//  Copyright © 2016 iem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pickColorButton: UIButton!
    
    
    @IBOutlet var background: UIView!
    var oldColor:UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pickColorButton.titleLabel?.textAlignment = NSTextAlignment.center
       oldColor = self.background.backgroundColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
       // if segue.identifier == "PickColor" {
            let vc = segue.destination as! ColorPickerViewController
            
            vc.delegate = self
        //}
    }
    

    
    
}

extension ViewController:ColorPickerDelegate{
    
    func keepColor(alert: UIAlertAction!,_ color: UIColor) {
        // Do something...
    }
    
    func userDidChooseColor(sender:ColorPickerViewController,color: UIColor) {
        sender.dismiss(animated: true, completion: nil)
        self.background.backgroundColor=color
       
        let alert = UIAlertController(title: "New color", message: "Do you like this new color ?", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Yes, keep it", style: UIAlertActionStyle.default, handler:  { action in self.oldColor=color}))
        alert.addAction(UIAlertAction(title: "No, discard", style: UIAlertActionStyle.default, handler:  { action in self.background.backgroundColor=self.oldColor}))
        self.present(alert, animated: true, completion: nil)
    }
    
   
    
    
    
    
}








