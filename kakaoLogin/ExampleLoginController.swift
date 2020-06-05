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
        iv.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ss)))
        return iv
    }()
    
    let loginButton: KOLoginButton = {
        let button = KOLoginButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(ss), for: .touchUpInside)
        return button
    }()
    
    var imageViewConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
        loginButton.frame = CGRect(x: 0, y: 300, width: view.frame.width, height: 50)
        imageView.frame = CGRect(x: 0, y: 400, width: view.frame.width, height: 50)
        view.addSubview(loginButton)
        view.addSubview(imageView)
        
    }
    
    @objc func ss() {
        let user = Kakao()
        user.getUserInfo { (kakao) in
            
            print(kakao.age_range)
//            print(kakao.birthday)
//            print(k.email)
//            print(k.gender)
//            print(k.id)
//            print(k.profile_image_url)
//            print(k.nickname)
        }
    }
    
    
    
    
    

}

