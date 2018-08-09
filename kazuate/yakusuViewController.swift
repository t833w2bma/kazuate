//  yakusuViewController.swift
//  kazuate

import UIKit
class yakusuViewController: UIViewController {

    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var textview: UITextView!
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
        self.kaisu+=1   //答えた回数をカウント
        //判定して返事を書く
        if self.ans==yosou {
            henji="\nあたり!正解は\(ans)でした。\n  次の問題"
            self.ans=Int(arc4random_uniform(100))
        }else if self.ans>yosou{
            henji="\n\(yosou)よりも大きいよ"
          
        }else {
            henji="\n\(yosou)よりも小さいよ"
        }
        
    //約数ヒント
        if self.kaisu == 3{  //三回目でヒント
            henji+="､約数は"
            for k in 2 ..< self.ans/2{
                if(self.ans%k==0){
                    henji+=",\(k)"
                }
            }
        }
        
       self.textview.text=self.textview.text + henji
       textview.scrollRangeToVisible(textview.selectedRange)  //下まで自動スクロール
        textfield.text=""  //回答フィールドを空にする
    }
    
    @IBAction func tapimage(_ sender: Any) {
        // キーボードを閉じる
        textfield.endEditing(true);
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }    

}
