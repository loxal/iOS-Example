//  Copyright 2014 Alexander Orlov <alexander.orlov@loxal.net>. All rights reserved.

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button: UIButton
    @IBOutlet var textField: UITextField
    @IBOutlet var label: UILabel
    
    func configureButton() {
        button.addTarget(self, action: "onButtonClicked:", forControlEvents: .TouchUpInside)
    }
    
    func onButtonClicked(sender: UIButton) {
        NSLog("Button clicked")
        label.text = "Hello, " + textField.text + "!"
        textField.text = textField.text + " happened!"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("Do any additional setup after loading the view, typically from a nib.")
        configureButton()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        println("Dispose of any resources that can be recreated.")
    }
}

