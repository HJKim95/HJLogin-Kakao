//
//  KakaoModel.swift
//  kakaoLogin
//
//  Created by 김희중 on 2020/06/04.
//  Copyright © 2020 HJ. All rights reserved.
//

import UIKit

@objcMembers
class KakaoModel: NSObject {
    
    var id: String?
    var age_range: String?
    var birthday: String?
    var email: String?
    var gender: String?
    var nickname: String?
    var profile_image_url: String?
    var thumbnail_image_url: String?
    
    var age_range_needs_agreement: String?
    var birthday_needs_agreement: String?
    var birthday_type: String?
    var email_needs_agreement: String?
    var gender_needs_agreement:String?
    var profile_needs_agreement:String?
    
    var has_age_range:String?
    var has_birthday:String?
    var has_email:String?
    var has_gender:String?
    var is_email_valid:String?
    var is_email_verified:String?
    
}
