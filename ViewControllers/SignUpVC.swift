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

        // Helper methods for setting up views
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
        // Customize pageHeader properties
        view.addSubview(pageHeader)
        // Set up constraints for pageHeader using SnapKit
        pageHeader.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
        }
    }

    private func setupEmailText() {
        emailText.translatesAutoresizingMaskIntoConstraints = false
        // Customize emailText properties
        view.addSubview(emailText)
        // Set up constraints for emailText using SnapKit
        emailText.snp.makeConstraints { make in
            make.top.equalTo(pageHeader.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
    }

    private func setupInputEmail() {
        inputEmail.translatesAutoresizingMaskIntoConstraints = false
        // Customize inputEmail properties
        view.addSubview(inputEmail)
        // Set up constraints for inputEmail using SnapKit
        inputEmail.snp.makeConstraints { make in
            make.top.equalTo(emailText.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
    }

    private func setupPhoneNumberText() {
        phoneNumberText.translatesAutoresizingMaskIntoConstraints = false
        // Customize phoneNumberText properties
        view.addSubview(phoneNumberText)
        // Set up constraints for phoneNumberText using SnapKit
        phoneNumberText.snp.makeConstraints { make in
            make.top.equalTo(inputEmail.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
    }

    private func setupInputPhoneNumber() {
        inputPhoneNumber.translatesAutoresizingMaskIntoConstraints = false
        // Customize inputPhoneNumber properties
        view.addSubview(inputPhoneNumber)
        // Set up constraints for inputPhoneNumber using SnapKit
        inputPhoneNumber.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberText.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
    }

    private func setupUsernameText() {
        usernameText.translatesAutoresizingMaskIntoConstraints = false
        // Customize usernameText properties
        view.addSubview(usernameText)
        // Set up constraints for usernameText using SnapKit
        usernameText.snp.makeConstraints { make in
            make.top.equalTo(inputPhoneNumber.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
    }

    private func setupInputUsername() {
        inputUsername.translatesAutoresizingMaskIntoConstraints = false
        // Customize inputUsername properties
        view.addSubview(inputUsername)
        // Set up constraints for inputUsername using SnapKit
        inputUsername.snp.makeConstraints { make in
            make.top.equalTo(usernameText.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
    }

    private func setupPasswordText() {
        passwordText.translatesAutoresizingMaskIntoConstraints = false
        // Customize passwordText properties
        view.addSubview(passwordText)
        // Set up constraints for passwordText using SnapKit
        passwordText.snp.makeConstraints { make in
            make.top.equalTo(inputUsername.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
    }

    private func setupInputPassword() {
        inputPassword.translatesAutoresizingMaskIntoConstraints = false
        // Customize inputPassword properties
        view.addSubview(inputPassword)
        // Set up constraints for inputPassword using SnapKit
        inputPassword.snp.makeConstraints { make in
            make.top.equalTo(passwordText.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
    }

    private func setupConfirmPasswordText() {
        confirmPasswordText.translatesAutoresizingMaskIntoConstraints = false
        // Customize confirmPasswordText properties
        view.addSubview(confirmPasswordText)
        // Set up constraints for confirmPasswordText using SnapKit
        confirmPasswordText.snp.makeConstraints { make in
            make.top.equalTo(inputPassword.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
    }

    private func setupInputConfirmPassword() {
        inputConfirmPassword.translatesAutoresizingMaskIntoConstraints = false
        // Customize inputConfirmPassword properties
        view.addSubview(inputConfirmPassword)
        // Set up constraints for inputConfirmPassword using SnapKit
        inputConfirmPassword.snp.makeConstraints { make in
            make.top.equalTo(confirmPasswordText.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
    }

    private func setupSignUpButton() {
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        // Customize signUpButton properties
        view.addSubview(signUpButton)
        // Set up constraints for signUpButton using SnapKit
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
            // Handle missing input
            return
        }

        // Call your signup function from NetworkManager
        NetworkManager.shared.signUp(email: email, phoneNumber: phoneNumber, username: username, password: password, confirmPassword: confirmPassword) { success in
            if success {
                // Handle successful signup, e.g., navigate to the next screen
            } else {
                // Handle signup failure, show an error message, etc.
            }
        }
    }
}

