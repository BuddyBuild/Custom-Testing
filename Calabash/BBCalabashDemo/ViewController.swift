//
//  ViewController.swift
//  BBCalabashDemo
//
//  Created by John Cross on 25/04/2017.
//  Copyright © 2017 John Cross. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var textLabel: UITextView!
    @IBOutlet weak var flipButtonTap: UIButton!

    @IBAction func buttonPressed(_ sender: Any) {
        if (textLabel.text == "Hello, World!") {
            textLabel.text = "Hello from Vancouver!";
        } else {
            textLabel.text = "Hello, World!";
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

