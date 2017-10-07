//
//  PostCommentViewController.swift
//  Instagram
//
//  Created by 橋本養子 on 2017/09/18.
//  Copyright © 2017年 kotokotokoto. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class PostCommentViewController: UIViewController {
    
    @IBOutlet weak var postComment: UITextField!
    
    var postData:PostData!
    
    // 投稿ボタンをタップした時に呼ばれるメッソド
    @IBAction func postCommentButton(_ sender: Any) {
        
        if let displayName = Auth.auth().currentUser?.displayName {
            postData.comments.append("\(displayName) : \(postComment.text!)")
            
            let postRef = Database.database().reference().child(Const.PostPath).child(postData.id!)
            let comments  = ["comments": postData.comments]
            postRef.updateChildValues(comments)
            
            dismiss(animated: true, completion: nil)
        }
        
        
    }
    

    // キャンセルボタンをタップした時に呼ばれるメソッド
    @IBAction func postCommentCancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
