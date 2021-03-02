//
//  getData20.swift
//  GPA Calculator
//
//  Created by ardavan on 2/17/1398 AP.
//  Copyright © 1398 Ardavan. All rights reserved.
//

import UIKit
struct dataOfGPA1001{
    var name: String?
    var grade: Double?
    var credit: Int?
}
var data100ForCalculate1 = [dataOfGPA1001]()
class getData20: UIViewController,UITextFieldDelegate {
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    @IBAction func back(_ sender: Any) {
        let isEmpty = ""
        if( getGrade.text! == isEmpty || getCredit.text! == isEmpty){
            displayMyAlertMessage(userMessage: "One or two of the fields are empty. Please enter a number")
            return
        }else{
            var x: dataOfGPA1001
            x = dataOfGPA1001.init(name: array1[myIndex20].courseName,
                                  grade: Double(getGrade.text!),
                                  credit: Int(getCredit.text!) )
            array1[myIndex20].courseGrade = Double(getGrade.text!)
            data100ForCalculate1.append(x)
            i = i+1
            dismiss(animated: true, completion: nil)
        }
    }
    @IBOutlet var getGrade: UITextField!
    
    @IBOutlet var getCredit: UITextField!
    @IBOutlet var coursnameLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        getGrade.keyboardType = UIKeyboardType.asciiCapable
        getCredit.keyboardType = UIKeyboardType.asciiCapableNumberPad
        coursnameLable.text = array1[myIndex20].courseName
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
