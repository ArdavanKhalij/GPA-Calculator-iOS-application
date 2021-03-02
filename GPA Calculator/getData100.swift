//
//  getData100.swift
//  GPA Calculator
//
//  Created by ardavan on 2/17/1398 AP.
//  Copyright © 1398 Ardavan. All rights reserved.
//

import UIKit
struct dataOfGPA100{
    var name: String?
    var grade: Double?
    var credit: Int?
}
//bayad sefr shavad dar calculat
var i: Int = 0

var data100ForCalculate = [dataOfGPA100]()
class getData100: UIViewController,UITextFieldDelegate {
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    //var i: Int = 0
    @IBOutlet var coursnameLable: UILabel!
    @IBOutlet var getGrade: UITextField!
    @IBOutlet var getCredit: UITextField!
    @IBAction func back(_ sender: Any) {
        let isEmpty = ""
        if( getGrade.text! == isEmpty || getCredit.text! == isEmpty){
            displayMyAlertMessage(userMessage: "One or two of the fields are empty. Please enter a number")
            return
        }else{
            var x: dataOfGPA100
            x = dataOfGPA100.init(name: array[myIndex100].courseName,
            grade: Double(getGrade.text!),
            credit: Int(getCredit.text!) )
            array[myIndex100].courseGrade = Double(getGrade.text!)
            data100ForCalculate.append(x)
            i = i+1
            dismiss(animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getGrade.keyboardType = UIKeyboardType.asciiCapable
        getCredit.keyboardType = UIKeyboardType.asciiCapableNumberPad
        coursnameLable.text = array[myIndex100].courseName
        self.getGrade.delegate = self
    }
    let ACCEPTABLE_CHARACTERS = "0123456789."
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let cs = CharacterSet(charactersIn: ACCEPTABLE_CHARACTERS).inverted
        let filtered: String = (string.components(separatedBy: cs) as NSArray).componentsJoined(by: "")
        return (string == filtered)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    func displayMyAlertMessage(userMessage:String){
        let myAlert = UIAlertController(title: "Attention", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
}
