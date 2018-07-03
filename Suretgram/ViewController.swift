//
//  ViewController.swift
//  Suretgram
//
//  Created by Нурасыл on 03.07.2018.
//  Copyright © 2018 Нурасыл. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? SecondViewController
        destination?.label = userTxtField.text!
    }
}

