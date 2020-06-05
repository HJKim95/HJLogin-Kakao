# HJLogin-Kakao

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
파일을 내려받기 전, 카카오 SDK와 기본 설정을 모두 마쳐주세요.

## Installation

Kakao.swift, KakaoModel.swift 두 파일을 복사하셔서 해당 프로젝트에 붙여넣으시면 됩니다. (이때 copy items if needed에 꼭 체크해주세요.)

getUserInfo( ) 를 통해 KakaoModel를 parameter로 받아와 사용할 수 있습니다.
```ruby
let user = Kakao()
        user.getUserInfo { (kakao) in
            print(kakao.age_range)
//            print(kakao.birthday)
//            print(kakao.email)
//            print(kakao.gender)
//            print(kakao.id)
//            print(kakao.profile_image_url)
//            print(kakao.nickname)
        }
```

## Author

HJKim95, 25ephipany@naver.com

## License

HJLogin-Kakao is available under the MIT license. See the LICENSE file for more info.
