//
//  EditPostPresenter.swift
//  SocialAppTask
//
//  Created by Youxel mac5 on 1/21/20.
//  Copyright © 2020 Maged Mohammed. All rights reserved.
//

import Foundation
import RxSwift

class EditPostViewModel{
    
    //    MARK:- Properties
    let post = PublishSubject<Posts>()
    let addPost = PublishSubject<Posts>()
    
    func addPost(title: String, userId: Int, body: String) {
        let parameters = [
            "userId": userId,
            "title": title,
            "body": body
        ] as [String : Any]
        
        Request.getData(routerCase: Router.edit(parameters)) { (data:Posts?, error) in
            if let data = data, error == nil {
                self.addPost.onNext(data)
            }else{
                if let error = error{
                    self.addPost.onError(error)
                }
            }
        }
        self.addPost.onCompleted()
    }
    
    func editPost(title: String, userId: Int, body: String) {
        let parameters = [
            "userId": userId,
            "title": title,
            "body": body
        ] as [String : Any]
        
        Request.getData(routerCase: Router.edit(parameters)) { (data:Posts?, error) in
            if let data = data, error == nil {
                self.post.onNext(data)
            }else{
                if let error = error{
                    self.post.onError(error)
                }
            }
        }
        self.post.onCompleted()
    }
}

