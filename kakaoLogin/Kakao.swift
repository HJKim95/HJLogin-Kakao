//
//  kakao.swift
//  kakaoLogin
//
//  Created by 김희중 on 2020/06/04.
//  Copyright © 2020 HJ. All rights reserved.
//

import UIKit

public class Kakao {
    private var kakao_param = [String]()
    
    var birthday: Bool? {
        didSet {
            if birthday ?? false {
                kakao_param.append("birthday")
            }
        }
    }
    
    var birthyear: Bool? {
        didSet {
            if birthyear ?? false {
                kakao_param.append("birthyear")
            }
        }
    }
    
    var age_range: Bool? {
        didSet {
            if age_range ?? false {
                kakao_param.append("age_range")
            }
        }
    }
    
    var gender: Bool? {
        didSet {
            if gender ?? false {
                kakao_param.append("gender")
            }
        }
    }
    
    var phone_number: Bool? {
        didSet {
            if phone_number ?? false {
                kakao_param.append("phone_number")
            }
        }
    }
    
    
    func getUserInfo(completed: @escaping (_ userInfo:KakaoModel) -> Void) {
        guard let session = KOSession.shared() else { return }
        
        if session.isOpen() {
            session.close()
        }
        session.open { [weak self] (error) in
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
                    if user.account?.profile == nil {
                        print("@@@카카오 계정 프로필 정보 없음@@@")
                    }
                    let userInfo = KakaoModel()
                    guard let userAccounts = user.dictionary()["kakao_account"] as? [String:Any] else {return}
                    userInfo.id = user.id
                    userInfo.nickname = user.properties?["nickname"]
                    userInfo.profile_image_url = user.properties?["profile_image"]
                    userInfo.thumbnail_image_url = user.properties?["thumbnail_image"]
                    if user.account?.profileNeedsAgreement ?? true && self?.kakao_param.count ?? 0 > 0 {
                        session.updateScopes(self?.kakao_param, completionHandler: { (error) in
                            if error != nil {return}
                            print("@@@asking agreement and getting data@@@")
                            userInfo.age_range = userAccounts["age_range"] as? String
                            userInfo.birthday = userAccounts["birthday"] as? String
                            userInfo.email = userAccounts["email"] as? String
                            userInfo.gender = userAccounts["gender"] as? String
                            completed(userInfo)
                        })
                    }
                    else {
                        userInfo.age_range = userAccounts["age_range"] as? String
                        userInfo.birthday = userAccounts["birthday"] as? String
                        userInfo.email = userAccounts["email"] as? String
                        userInfo.gender = userAccounts["gender"] as? String
                        completed(userInfo)
                    }
                }
            }
        }
    }
}
