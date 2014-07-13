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
        
        retrieveContentAsynchronously()
    }
    
    func retrieveContentAsynchronously() {
        let url = NSURL(string: "http://customer-dev-v1.test.cf.hybris.com/registration")
        let request = NSMutableURLRequest(URL: url)
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("loxal", forHTTPHeaderField: "hybris-tenant")
        request.HTTPMethod = "POST"
        
        let payload = "{\"email\": \"noreply6@hybris.com\", \"name\": \"user6\"}"
        let payloadData = (payload as NSString).dataUsingEncoding(NSUTF8StringEncoding)
        request.HTTPBody = payloadData
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
            (response, data, error) in println(NSString(data: data, encoding: NSUTF8StringEncoding))
            let json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as Dictionary<String, String!>
            println(json["moreInfo"])
        }
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