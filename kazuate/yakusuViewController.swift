//  yakusuViewController.swift
//  kazuate

import UIKit

class yakusuViewController: UIViewController {

    @IBOutlet weak var textview: UITextView!
    @IBOutlet weak var textfield: UITextField!
    var ans:Int=0
    override func viewDidLoad() {
        super.viewDidLoad()
        textview.text="1~99までで数をあててください"
        self.ans=Int(arc4random_uniform(100))
        
        textview.layer.backgroundColor = UIColor(red: 255/255, green: 248/255, blue: 220/255, alpha: 1.0).cgColor        // BOXデザイン
        textview.layer.borderColor = (UIColor( red: 1, green: 0.95, blue:0.4, alpha: 1.0 )).cgColor
        textview.layer.masksToBounds=true
        textview.layer.cornerRadius=12
        textview.layer.borderWidth=2
    }
    
    private var henji:String=""
    private var kaisu:Int=0
    
    @IBAction func tapbutton(_ sender: Any) {
        guard let yosou = Int(textfield.text!) else {
            return
        }
        //判定して返事を書く
        if self.ans==yosou {
            henji="\nあたり!正解は\(ans)でした。\n  次の問題"
            self.ans=Int(arc4random_uniform(100))
        }else if self.ans>yosou{
            henji="\n\(yosou)よりも大きいよ"
            yakusu()
        }else {
            
            henji="\n\(yosou)よりも小さいよ"
            yakusu()
        }
        self.textview.text=self.textview.text + henji
        textview.scrollRangeToVisible(textview.selectedRange)  //下まで自動スクロール
    }
    
    func yakusu(){
        self.kaisu+=1
        
        if self.kaisu == 3{  //三回目でヒント
            henji+="約数は"
            for k in 2..<self.ans/2{
                if(self.ans%k==0){
                    henji+=",\(k)"
                }
            }
            if henji.count == 3{
                henji += "表示きるものがありません"
            }
            print( henji.count )
        }
        textfield.text=""
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
