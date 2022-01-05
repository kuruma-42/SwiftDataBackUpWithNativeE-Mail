//
//  ViewController.swift
//  FileManagerRealmBackUpTest
//
//  Created by Yong Jun Cha on 2021/12/07.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let fileManager = FileManager.default
        
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        print("DOCUMNETS URL :: \(documentsURL)")
        
        let fileURL = documentsURL.appendingPathComponent("Youtube_Keyword_data.txt")
        print("FILE URL :: \(fileURL)")
        
        let myTextString = NSString(string: "KEYWORD TEST FILE")
        
        try? myTextString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8.rawValue)
    }

    @IBAction func EmailButton(_ sender: Any) {
        present(EmailViewController(), animated: true, completion: {})
    }
}

