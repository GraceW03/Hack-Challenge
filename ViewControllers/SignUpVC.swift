//MARK - Properties (view)
import UIKit
import SnapKit

class SignUpVC: UIViewController {

    //MARK: - Properties (view) -> in order btw

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
    private let logInButton = UIButton()

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        //helper methods
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
        setupLogInButton()
    }

    // MARK: - Set Up Views
    private func setupPageHeader() {
        pageHeader.text = "Sign Up"
        pageHeader.font = .systemFont(ofSize: 32, weight: .bold)
        view.addSubview(pageHeader)
       
        pageHeader.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.centerX.equalToSuperview()
        }
    }

    private func setupEmailText() {
        emailText.text = "Email"
        emailText.font = .systemFont(ofSize: 20)
        view.addSubview(emailText)
       
        emailText.snp.makeConstraints { make in
            make.top.equalTo(pageHeader.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
        }
    }

    private func setupInputEmail() {
        inputEmail.placeholder = "Enter your email"
        inputEmail.font = .systemFont(ofSize: 20)
        inputEmail.borderStyle = .roundedRect
        view.addSubview(inputEmail)
        
        inputEmail.snp.makeConstraints { make in
            make.top.equalTo(emailText.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(40)
        }
    }

    private func setupPhoneNumberText() {
        phoneNumberText.text = "Phone Number"
        phoneNumberText.font = .systemFont(ofSize: 20)
        view.addSubview(phoneNumberText)
        
        phoneNumberText.snp.makeConstraints { make in
            make.top.equalTo(inputEmail.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
        }
    }

    private func setupInputPhoneNumber() {
        inputPhoneNumber.placeholder = "Enter your phone number"
        inputPhoneNumber.font = .systemFont(ofSize: 20)
        inputPhoneNumber.borderStyle = .roundedRect
        view.addSubview(inputPhoneNumber)
       
        inputPhoneNumber.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberText.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(40)
        }
    }

    private func setupUsernameText() {
        usernameText.text = "Username"
        usernameText.font = .systemFont(ofSize: 20)
        view.addSubview(usernameText)
       
        usernameText.snp.makeConstraints { make in
            make.top.equalTo(inputPhoneNumber.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
        }
    }

    private func setupInputUsername() {
        inputUsername.placeholder = "Enter your username"
        inputUsername.font = .systemFont(ofSize: 20)
        inputUsername.borderStyle = .roundedRect
        view.addSubview(inputUsername)
        
        inputUsername.snp.makeConstraints { make in
            make.top.equalTo(usernameText.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(40)
        }
    }

    private func setupPasswordText() {
        passwordText.text = "Password"
        passwordText.font = .systemFont(ofSize: 20)
        view.addSubview(passwordText)
        
        passwordText.snp.makeConstraints { make in
            make.top.equalTo(inputUsername.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
        }
    }

    private func setupInputPassword() {
        inputPassword.placeholder = "Enter your password"
        inputPassword.font = .systemFont(ofSize: 20)
        inputPassword.borderStyle = .roundedRect
        inputPassword.isSecureTextEntry = true
        view.addSubview(inputPassword)
        
        inputPassword.snp.makeConstraints { make in
            make.top.equalTo(passwordText.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(40)
        }
    }

    private func setupConfirmPasswordText() {
        confirmPasswordText.text = "Confirm Password"
        confirmPasswordText.font = .systemFont(ofSize: 20)
        view.addSubview(confirmPasswordText)
        
        confirmPasswordText.snp.makeConstraints { make in
            make.top.equalTo(inputPassword.snp.bottom).offset(16)
            make.leading.equalToSuperview().
