//
//  LoginViewController.swift
//  Instagram_clone
//
//  Created by Blossom on 2020/12/24.
//

import UIKit
import SafariServices

@available(iOS 13.0, *)
class LoginViewController: UIViewController {
    
    struct Constants {
        static let cornerRadius: CGFloat = 8.0
    }
    
    private let usernameEmailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Username or Email..."
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        // 보안 텍스트 입력
        field.isSecureTextEntry = true
        field.placeholder = "Password..."
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let loginButton: UIButton = {
    let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let headerView: UIView = {
        let header = UIView()
        header.clipsToBounds = true
        let backgroundImageView = UIImageView(image: UIImage(named: "gradient"))
        header.addSubview(backgroundImageView)
        return header
    }()
    
    private let termsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Term of Service", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    private let privacyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Privacy Policy", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    private let createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("New User? Create an Account", for: .normal)
        return button
    }()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.addTarget(self, action: #selector(didTapLoginButton)
                              , for: .touchUpInside)
        createAccountButton.addTarget(self, action: #selector(didTapCreateAccountButton)
                                      , for: .touchUpInside)
        termsButton.addTarget(self, action: #selector(didTapTermsButton),
                              for: .touchUpInside)
        privacyButton.addTarget(self, action: #selector(didTapPrivacyButton),
                                for: .touchUpInside)
        
        addSubviews()
        usernameEmailField.delegate = self
        passwordField.delegate = self
        view.backgroundColor = .systemBackground
    }
    
    // 다크모드 기반색상뷰 재정의
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        headerView.frame = CGRect(x: 0, y: 0.0, width: view.frame.width, height: view.height/3.0)
        configureHeaderView()
        
        usernameEmailField.frame = CGRect(x: 25, y: headerView.bottom + 10, width: view.frame.width - 50, height: 52.0)
        configureHeaderView()
        
        passwordField.frame = CGRect(x: 25, y: usernameEmailField.bottom + 10, width: view.frame.width - 50, height: 52.0)
        configureHeaderView()
        
        loginButton.frame = CGRect(x: 25, y: passwordField.bottom + 10, width: view.frame.width - 50, height: 52.0)
        configureHeaderView()
        
        createAccountButton.frame = CGRect(x: 25, y: loginButton.bottom + 10, width: view.frame.width - 50, height: 52.0)
        configureHeaderView()
        
        termsButton.frame = CGRect(x: 10,
                                   y: view.height - view.safeAreaInsets.bottom - 100,
                                   width: view.width - 20,
                                   height: 50)
        
        privacyButton.frame = CGRect(x: 10,
                                   y: view.height - view.safeAreaInsets.bottom - 50,
                                   width: view.width - 20,
                                   height: 50)
        
    }
    
    
    
    private func configureHeaderView() {
        guard headerView.subviews.count == 1 else {
            return
        }
        
        guard let backgroundView = headerView.subviews.first else {
            return
        }
        backgroundView.frame = headerView.bounds
        
        // 로고 추가하기
        let imageView = UIImageView(image: UIImage(named: "logotext"))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: headerView.width/4.0, y: view.safeAreaInsets.top, width: headerView.width/2.0, height: headerView.height - view.safeAreaInsets.top)
    }
    
    private func addSubviews() {
        view.addSubview(usernameEmailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(createAccountButton)
        view.addSubview(headerView)
    }
    
    // 터치 액션
    @objc private func didTapLoginButton() {
        passwordField.resignFirstResponder()
        usernameEmailField.resignFirstResponder()
        
        guard let usernameEmail = usernameEmailField.text, !usernameEmail.isEmpty,
              let password = passwordField.text, !password.isEmpty, password.count >= 8 else {
                return
        }
        // 로그인 기능 구현
    }
    
    @objc private func didTapTermsButton() {
        guard let url = URL(string: "https://www.instagram.com/about/legal/terms/before-january-19-2013/") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    @objc private func didTapPrivacyButton() {
        guard let url = URL(string: "https://help.instagram.com/519522125107875") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    @objc private func didTapCreateAccountButton() {
        let vc = RegistrationViewController()
        present(vc, animated: true)
    }
    
}

@available(iOS 13.0, *)
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameEmailField {
            passwordField.becomeFirstResponder()
        }else if textField == passwordField {
            didTapLoginButton()
        }
        return true
    }
}
