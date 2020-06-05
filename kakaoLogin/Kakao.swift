//
//  kakao.swift
//  kakaoLogin
//
//  Created by 김희중 on 2020/06/04.
//  Copyright © 2020 HJ. All rights reserved.
//

import UIKit

public class Kakao {
    private var kakao_param = ["birthday","birthyear","age_range","gender","phone_number"]
    
    
    func getUserInfo(completed: @escaping (_ userInfo:KakaoModel) -> Void) {
        guard let session = KOSession.shared() else { return }
        
        if session.isOpen() {
            session.close()
        }
        session.open { (error) in
            if !session.isOpen() {
                if let error = error as NSError? {
                    switch error.code {
                    case Int(KOErrorCancelled.rawValue):
                        break
                    default:
                        print("failed request - error: %@", error)
                        print("** check https://developers.kakao.com/docs/latest/ko/user-mgmt/ios")
                    }
                }
            }
            else {
                KOSessionTask.userMeTask { (error, kakaoUser) in
                    guard let user = kakaoUser else {return}
                    guard let userAccounts = user.dictionary()["kakao_account"] as? [String:Any] else {return}
                    let userInfo = KakaoModel()
                    session.updateScopes(self.kakao_param, completionHandler: { (error) in
                        if error != nil {return}
                        userInfo.id = user.id
                        userInfo.nickname = user.properties?["nickname"]
                        userInfo.profile_image_url = user.properties?["profile_image"]
                        userInfo.thumbnail_image_url = user.properties?["thumbnail_image"]
                        userInfo.age_range = userAccounts["age_range"] as? String
                        userInfo.birthday = userAccounts["birthday"] as? String
                        userInfo.email = userAccounts["email"] as? String
                        userInfo.gender = userAccounts["gender"] as? String
                        
                        completed(userInfo)
                    })
                }
            }
        }
    }
}
