//
//  PostsListPresenter.swift
//  SocialAppTask
//
//  Created by Youxel mac5 on 1/20/20.
//  Copyright © 2020 Maged Mohammed. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift


class PostsViewModel{
    
//    MARK:- Properties
    var posts = PublishSubject<[Posts]>()
    var deletedPost = PublishSubject<Posts>()
    
//    MARK:- Method
    func getPostsData() {
        PostsRequest.getPosts { [weak self](data, error) in
            guard let self = self else{return}
            if let data = data, error == nil{
                self.posts.onNext(data)
                self.posts.onCompleted()
            }else{
                if let error = error{
                    self.posts.onError(error)
                }
            }
        }
    }
    
    
    func deletePost(id:Int) {
        Request.getData(routerCase: Router.delete(id)) { (data:Posts?, error) in
            if let data = data, error == nil{
                self.deletedPost.onNext(data)
                self.deletedPost.onCompleted()
            }else{
                if let error = error{
                    self.deletedPost.onError(error)
                }
            }
        }
    }
}
