//
//  getData6.swift
//  GPA Calculator
//
//  Created by ardavan on 2/18/1398 AP.
//  Copyright © 1398 Ardavan. All rights reserved.
//

import UIKit
struct dataOfGPA1003{
    var name: String?
    var grade: Double?
    var credit: Int?
}
var data100ForCalculate3 = [dataOfGPA1003]()
class getData6: UIViewController,UITextFieldDelegate {
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    @IBOutlet var coursnameLable: UILabel!
    @IBOutlet var getGrade: UITextField!
    @IBOutlet var getCredit: UITextField!
    @IBAction func back(_ sender: Any) {
        let isEmpty = ""
        if( getGrade.text! == isEmpty || getCredit.text! == isEmpty){
            displayMyAlertMessage(userMessage: "One or two of the fields are empty. Please enter a number")
            return
        }else{
            var x: dataOfGPA1003
            x = dataOfGPA1003.init(name: array3[myIndex6].courseName,
                                   grade: Double(getGrade.text!),
                                   credit: Int(getCredit.text!) )
            array3[myIndex6].courseGrade = Double(getGrade.text!)
            
            data100ForCalculate3.append(x)
            i = i+1
            dismiss(animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getGrade.keyboardType = UIKeyboardType.asciiCapable
        getCredit.keyboardType = UIKeyboardType.asciiCapableNumberPad
        coursnameLable.text = array3[myIndex6].courseName
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
        // Dispose of any resources that can be recreated.
    }
    func displayMyAlertMessage(userMessage:String){
        let myAlert = UIAlertController(title: "Attention", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
}
