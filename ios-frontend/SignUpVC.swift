import UIKit
import SnapKit

class SignUpVC: UIViewController {

    // MARK - Properties (view)
    private let pageHeader = UILabel()
    private let emailText = UILabel()
    private let inputEmail = UITextField()
    private let phoneNumberText = UILabel()
    private let inputPhoneNumber = UITextField()
    private let usernameText = UILabel()
    private let inputUsername = UITextField()
    private let passwordText = UILabel()
    private let inputPassword = UITextField()
    private let confirmPasswordText = UILabel()
    private let inputConfirmPassword = UITextField()
    private let signUpButton = UIButton()

    // MARK - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        
        setupPageHeader()
        setupEmailText()
        setupInputEmail()
        setupPhoneNumberText()
        setupInputPhoneNumber()
        setupUsernameText()
        setupInputUsername()
        setupPasswordText()
        setupInputPassword()
        setupConfirmPasswordText()
        setupInputConfirmPassword()
        setupSignUpButton()
    }

    // MARK - Set Up Views

    private func setupPageHeader() {
        pageHeader.translatesAutoresizingMaskIntoConstraints = false
        pageHeader.textAlignment = .center
     
        view.addSubview(pageHeader)
      
        pageHeader.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
        }
    }

    private func setupEmailText() {
        emailText.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(emailText)

        emailText.snp.makeConstraints { make in
            make.top.equalTo(pageHeader.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
    }

    private func setupInputEmail() {
        inputEmail.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(inputEmail)
        inputEmail.snp.makeConstraints { make in
            make.top.equalTo(emailText.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
    }

    private func setupPhoneNumberText() {
        phoneNumberText.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(phoneNumberText)
        phoneNumberText.snp.makeConstraints { make in
            make.top.equalTo(inputEmail.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
    }

    private func setupInputPhoneNumber() {
        inputPhoneNumber.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(inputPhoneNumber)
        inputPhoneNumber.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberText.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
    }

    private func setupUsernameText() {
        usernameText.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameText)
        usernameText.snp.makeConstraints { make in
            make.top.equalTo(inputPhoneNumber.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
    }

    private func setupInputUsername() {
        inputUsername.translatesAutoresizingMaskIntoConstrain 
        view.addSubview(inputUsername)
  
        inputUsername.snp.makeConstraints { make in
            make.top.equalTo(usernameText.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
    }

    private func setupPasswordText() {
        passwordText.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordText)
        passwordText.snp.makeConstraints { make in
            make.top.equalTo(inputUsername.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
    }

    private func setupInputPassword() {
        inputPassword.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(inputPassword)
        inputPassword.snp.makeConstraints { make in
            make.top.equalTo(passwordText.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
    }

    private func setupConfirmPasswordText() {
        confirmPasswordText.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(confirmPasswordText)
        confirmPasswordText.snp.makeConstraints { make in
            make.top.equalTo(inputPassword.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
    }

    private func setupInputConfirmPassword() {
        inputConfirmPassword.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(inputConfirmPassword)
        inputConfirmPassword.snp.makeConstraints { make in
            make.top.equalTo(confirmPasswordText.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
    }

    private func setupSignUpButton() {
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(signUpButton)
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(inputConfirmPassword.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }

    // MARK: - Button Actions
    @objc private func signUpButtonTapped() {
        guard let email = inputEmail.text,
              let phoneNumber = inputPhoneNumber.text,
              let username = inputUsername.text,
              let password = inputPassword.text,
              let confirmPassword = inputConfirmPassword.text else {
            
            return
        }

        NetworkManager.shared.signUp(email: email, phoneNumber: phoneNumber, username: username, password: password, confirmPassword: confirmPassword) { success in
            if success {
                let homePageVC = HomePageVC()
                viewController.navigationController?.pushViewController(homePageVC, animated: true)
            } else {
                print("Login failed.")
            }
            completion(success)
        }
    }
}

