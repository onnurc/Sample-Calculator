//
//  ViewController.swift
//  Sample Calculator
//
//  Created by Onur ÇETİNKAYA on 12.01.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func allClearClicked(_ sender: Any) {
        label.text = ""
    }
    
    @IBAction func reversePNClicked(_ sender: Any) {
        
    }

    
    @IBAction func percentClicked(_ sender: Any) {
        
    }
    
    @IBAction func digitOneClicked(_ sender: Any) {
        addChar(value: "1")
    }
    
    @IBAction func digitTwoClicked(_ sender: Any) {
        addChar(value: "2")
    }
    
    func reversePositiveNegative() {
        
    }
    
    func addChar(value : String) {
        label.text = label.text + value
    }
    
    
    
}

