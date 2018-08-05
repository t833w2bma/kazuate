//  Created by ginzo on 2018/08/05.
//  Copyright © 2018年 ginzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textview: UITextView!
    @IBOutlet weak var textfield: UITextField!
    
    var kotae = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kotae = Int(arc4random_uniform(100))
        textview.text = "0〜99のうちで、数を当ててください。\n"
        
        textview.layer.masksToBounds = true
        textview.layer.cornerRadius = 12
        textview.layer.borderWidth = 2
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func tapButton(sender: AnyObject) {
        guard let yosou = Int(textfield.text!) else {
            return
        }
        
        var henji = ""
        if yosou == kotae {
            henji = "当たり！答えは\(kotae)でした。\n\nでは、次の数を当ててください。\n"
            kotae = Int(arc4random_uniform(100))
        } else if yosou < kotae {
            henji = "\(yosou)よりも大きいよ。\n"
        } else {
            henji = "\(yosou)よりも小さいよ。\n"
        }
        textview.text = textview.text + henji
        textview.scrollRangeToVisible(textview.selectedRange)
        textfield.text = ""
    }

  @IBAction func returnTop(segue:UIStoryboardSegue){}

}
