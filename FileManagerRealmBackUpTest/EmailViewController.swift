//
//  emailViewController.swift
//  FileManagerRealmBackUpTest
//
//  Created by Yong Jun Cha on 2021/12/07.
//

import Foundation
import MessageUI
import UIKit
import Combine

class EmailViewController : UIViewController, MFMailComposeViewControllerDelegate {
    
    var cancellables: [AnyCancellable] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func sendKeywordDataByUsingEmail(_ sender: Any) {
        if MFMailComposeViewController.canSendMail() {
            let mailComposer = MFMailComposeViewController()
            mailComposer.setSubject("경기도 알림톡 유튜브 검색어 백업자료")
            mailComposer.setMessageBody("\(Date())까지의 경기도 알림톡 유튜브 검색자료 백업데이터 입니다. ", isHTML: false)
            mailComposer.setToRecipients(["yongjun.cha@snplab.io"])
            let fileManager = FileManager()
            let documentURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileURL = documentURL.appendingPathComponent("Youtube_Keyword_data.txt")
            print("URL :: \(documentURL.description)")
            
            
            
            do {
                let attachmentData = try Data(contentsOf: fileURL)
                mailComposer.addAttachmentData(attachmentData, mimeType: "txt", fileName: "Youtube_Keyword_data")
                mailComposer.mailComposeDelegate = self
                self.present(mailComposer, animated: true
                             , completion: nil)
            } catch let error {
                print("We have encountered error \(error.localizedDescription)")
            }
            
        } else {
            print("Email is not configured in settings app or we are not able to send an email")
        }
    }
    
    
    
    //MARK:- MailcomposerDelegate
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
        case .cancelled:
            print("User cancelled")
            break

        case .saved:
            print("Mail is saved by user")
            break

        case .sent:
            print("Mail is sent successfully")
            break

        case .failed:
            print("Sending mail is failed")
            break
        default:
            break
        }

        controller.dismiss(animated: true)

    }
}
