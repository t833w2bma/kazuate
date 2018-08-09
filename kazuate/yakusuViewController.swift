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
        ans=Int(arc4random_uniform(100))
        
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
        kaisu+=1   //答えた回数をカウント
        //判定して返事を書く
        if ans==yosou {
            henji="\nあたり!正解は\(ans)でした。\n  次の問題"
            ans=Int(arc4random_uniform(100))
        }else if ans>yosou{
            henji="\n\(yosou)よりも大きいよ"
          
        }else {
            henji="\n\(yosou)よりも小さいよ"
        }
        
    //約数ヒント
        
        if kaisu == 3{  //三回目でヒント
            henji+="､約数は"
            if ans > 4{
                for k in 2 ..< ans/2{
                    if(ans%k==0){
                        henji+=",\(k)"
                    }
                }
            }
        }
        
       textview.text=textview.text + henji
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
