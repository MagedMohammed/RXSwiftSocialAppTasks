//
//  EditPostViewController.swift
//  SocialAppTask
//
//  Created by Youxel mac5 on 1/20/20.
//  Copyright © 2020 Maged Mohammed. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class EditPostViewController: UIViewController {
    //    MARK:- Outlet
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTexetView: UITextView!
    
    
    //    MARK:- Properties
    var postData:Posts?
    var segueId = "editPost"
    private let viewModel = EditPostViewModel()
    private let bag = DisposeBag()
    
    //    MARK:- ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        if let post = self.postData{
            self.setDataForEdit(data: post)
        }
    }
    
    //    MARK:- Method
//    func bindWith
    func setDataForEdit(data:Posts){
        self.bodyTexetView.text = data.body ?? ""
        self.titleTextField.text = data.title ?? ""
    }
    //    MARK:- Action
    
    @IBAction func savePost(_ sender: UIButton) {
        guard let title = titleTextField.text, !title.isEmpty else{return}
        guard let body = bodyTexetView.text, !body.isEmpty else{return}
        let userId = self.postData?.userId ?? 1
        if self.postData != nil {
            self.viewModel.editPost(title: title, userId: userId, body: body)
        }else{
            self.viewModel.addPost(title: title, userId: userId, body: body)
        }
    }
}

extension EditPostViewController {
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
