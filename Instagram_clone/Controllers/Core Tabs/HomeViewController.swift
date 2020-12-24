//
//  ViewController.swift
//  Instagram_clone
//
//  Created by Blossom on 2020/12/24.
//

import UIKit
import Firebase

@available(iOS 13.0, *)
class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // 애니메이션을 활용하여 창에 뷰 추가
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handleNotAuthenticated()
    }
    
    // 오프핸들 인증 확인 함수
    private func handleNotAuthenticated() {
        // 인증상태 확인
        if Auth.auth().currentUser == nil {
            // 로그인 표시
            let loginVC = LoginViewController()
            // 전체화면 구현
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
        }
    }
}

