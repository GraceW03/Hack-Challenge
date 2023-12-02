import UIKit
import SnapKit

class SignUpVC: UIViewController {

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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        // Setup UI elements
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
        // ... (Existing code)
    }

    private func setupInputEmail() {
        // ... (Existing code)
    }

    private func setupPhoneNumberText() {
        // ... (Existing code)
    }

    private func setupInputPhoneNumber() {
        // ... (Existing code)
    }

    private func setupUsernameText() {
        // ... (Existing code)
    }

    private func setupInputUsername() {
        // ... (Existing code)
    }

    private func setupPasswordText() {
        // ... (Existing code)
    }

    private func setupInputPassword() {
        // ... (Existing code)
    }

    private func setupConfirmPasswordText() {
        // ... (Existing code)
    }

    private func setupInputConfirmPassword() {
        // ... (Existing code)
    }

    private func setupSignUpButton() {
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.backgroundColor = .blue
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        view.addSubview(signUpButton)

        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(confirmPasswordText.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
    }

    @objc private func signUpButtonTapped() {
        performSignUp()
    }

    private func performSignUp() {
        let url = URL(string: "your_backend_signup_endpoint")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        let parameters: [String: Any] = [
            "email": inputEmail.text ?? "",
            "phone": inputPhoneNumber.text ?? "",
            "username": inputUsername.text ?? "",
            "password": inputPassword.text ?? ""
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            // Handle the response from the server
            // You might want to check for errors, parse the JSON response, etc.
            // Update the UI on the main thread if needed
        }

        task.resume()
    }
}
