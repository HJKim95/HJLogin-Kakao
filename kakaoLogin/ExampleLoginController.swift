//
//  ViewController.swift
//  kakaoLogin
//
//  Created by 김희중 on 2020/06/03.
//  Copyright © 2020 HJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .red
        iv.isUserInteractionEnabled = true
        iv.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(loginKakao)))
        return iv
    }()
    
    let loginButton: KOLoginButton = {
        let button = KOLoginButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(loginKakao), for: .touchUpInside)
        return button
    }()
    
    var imageViewConstraint: NSLayoutConstraint?
    var loginButtonConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true

        view.addSubview(loginButton)
        view.addSubview(imageView)
        
        loginButtonConstraint = loginButton.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 200, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 50).first
        imageViewConstraint = imageView.anchor(loginButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 100, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 50).first
        
    }
    
    @objc func loginKakao() {
        let user = Kakao()
        user.age_range = true
        user.birthday = true
        user.birthyear = true
        user.gender = true
        user.phone_number = true
        user.getUserInfo { (kakao) in
            print("--------------------------------")
            print(kakao.age_range)
            print(kakao.birthday)
            print(kakao.email)
        }
    }
    
    
    
    
    

}

