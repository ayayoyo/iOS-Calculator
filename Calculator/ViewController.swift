//
//  ViewController.swift
//  Calculator
//
//  Created by aya on 1/13/16.
//  Copyright (c) 2016 aya. All rights reserved.
//

import UIKit
import AVFoundation




class ViewController: UIViewController {

    enum operation: String
    {
        case divide = "/"
        case multiply = "*"
        case subtact = "-"
        case add = "+"
        case empty = "Empty"
    }
    
    
    var runningnumber = ""
    var leftval = ""
    var rightval = ""
    var crroperation: operation = operation.empty
    var result = ""
    
    
    @IBOutlet weak var lbl_counter:UILabel!
    var btn_sound: AVAudioPlayer!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        lbl_counter.text = ""
        
       
        
        
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundurl = NSURL(fileURLWithPath: path!)
        
        var error: NSErrorPointer = nil
        
        btn_sound = AVAudioPlayer(contentsOfURL: soundurl!, error: error)
        btn_sound.prepareToPlay()
        
       /* do
        {
            try
        {}
        }
        */
        
       
    }

   
    @IBAction func num_click(sender: UIButton)
    {
        playSound()
        runningnumber += "\(sender.tag)"
        lbl_counter.text = runningnumber
       
    }
    
    @IBAction func divide_pressed (sender: UIButton)
    {
        ProcessOperation(operation.divide)
    }
    
    @IBAction func Multiply_pressed (sender: UIButton)
    {
        ProcessOperation(operation.multiply)

    }
    
    @IBAction func Subtract_pressed (sender: UIButton)
    {
        ProcessOperation(operation.subtact)

    }
    
    @IBAction func add_pressed (sender: UIButton)
    {
        ProcessOperation(operation.add)

    }
    
    @IBAction func equal_pressed (sender: UIButton)
    {
        ProcessOperation(crroperation)
        crroperation = operation.empty

    }
    
    @IBAction func Clear_pressed (sender: UIButton)
    {
        runningnumber = "0"
        lbl_counter.text = runningnumber
    }
    

    func ProcessOperation(oper: operation)
    {
        playSound()
        if runningnumber != ""
        {
            if crroperation != operation.empty
            {
                rightval = runningnumber
                runningnumber = ""
                
                if crroperation == operation.multiply
                {
                    result = "\(NSString(string: leftval).doubleValue * NSString(string: rightval).doubleValue)"
                }
                else  if crroperation == operation.divide
                {
                    result = "\(NSString(string: leftval).doubleValue / NSString(string: rightval).doubleValue)"
                }
                else  if crroperation == operation.add
                {
                    result = "\(NSString(string: leftval).doubleValue + NSString(string: rightval).doubleValue)"
                }
                else if crroperation == operation.subtact
                {
                    result = "\( NSString(string: leftval).doubleValue - NSString(string: rightval).doubleValue)"
                }
                lbl_counter.text = result
                leftval = result
                
            }
            else
            {
                leftval = runningnumber
                runningnumber = ""
                
            }

        }
        crroperation = oper
    }
   
    func playSound()
    {
        if btn_sound.playing
        {
            btn_sound.stop()
        }
        btn_sound.play()
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func clear_click(sender: UIButton)
    {
        playSound()
        
        if rightval == ""
        {
            leftval = ""
            crroperation = operation.empty
        }
        else
        {
            rightval = ""
        }
        lbl_counter.text = ""
        runningnumber = ""
    }
  
}

