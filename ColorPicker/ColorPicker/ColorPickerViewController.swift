//
//  ColorPickerViewController.swift
//  ColorPicker
//
//  Created by iem on 01/12/2016.
//  Copyright © 2016 iem. All rights reserved.
//

protocol ColorPickerDelegate{
    func userDidChooseColor(sender: ColorPickerViewController , color: UIColor)
}


import UIKit

class ColorPickerViewController: UIViewController {

    struct color {
       let red = UIColor.red
        let green = UIColor.green
        let orange = UIColor.orange
        
    }
     var delegate:ColorPickerDelegate! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func returnHome(_ sender: UIButton) {
         if (delegate != nil) {
        delegate!.userDidChooseColor(sender: self,color: UIColor.blue)
        }
    }

    func home(_ sender: UIButton,_ color: UIColor){
        if (delegate != nil) {
            delegate!.userDidChooseColor(sender: self,color: color)
        }
    }
    
    @IBAction func sendGreen(_ sender: UIButton) {
        let col = color()
        
       home(sender,col.green)
    }
    
    @IBAction func sendOrange(_ sender: UIButton) {
        let col = color()
        
        home(sender,col.orange)
    }
  
    @IBAction func sendRed(_ sender: UIButton) {
        let col = color()
        
        home(sender,col.red)
    }
}
