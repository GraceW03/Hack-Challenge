//MARK - Properties (view)
// MARK - viewDidLoad
// MARK - Set Up Views
// MARK: - Button Actions

//MARK - Properties (view)
// MARK - viewDidLoad
// MARK - Set Up Views
// MARK: - Button Actions
//log in credentials page
import UIKit
import SnapKit

class SignUpVC: UIViewController {

    //MARK: - Properties (view) -> in order btw

    private let pageHeader = UILabel()
    private let emailText = UILabel()
    private let inputEmail = UILabel()
    private let phoneNumberText = UILabel()
    private let inputPhoneNumber = UILabel()
    private let usernameText = UILabel()
    private let inputUsername  = UILabel()
    private let passwordText = UIButton()
    private let inputPassword = UIButton()
    private let confirmPasswordText = UIButton()
    private let inputConfirmPassword = UIButton()
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
        
        view.addSubview(pageHeader)
       
    }

    private func setupEmailText() {
        
        view.addSubview(emailText)
       
    }

    private func setupInputEmail() {
    
        view.addSubview(inputEmail)
        
    }

    private func setupPhoneNumberText() {
        
        view.addSubview(phoneNumberText)
        
    }

    private func setupInputPhoneNumber() {
       
        view.addSubview(inputPhoneNumber)
       
    }

    private func setupUsernameText() {
       
        view.addSubview(usernameText)
       
    }

    private func setupInputUsername() {
        
        view.addSubview(inputUsername)
       
    }

    private func setupPasswordText() {
       
        view.addSubview(passwordText)
       
    }

    private func setupInputPassword() {
        
        view.addSubview(inputPassword)
        
    }

    private func setupConfirmPasswordText() {
        
        view.addSubview(confirmPasswordText)
        
    }

    private func setupInputConfirmPassword() {
       
        view.addSubview(inputConfirmPassword)
       

    private func setupLogInButton() {
       
        view.addSubview(logInButton)
        
        logInButton.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
    }

    // MARK: - Button Actions
    @objc private func logInButtonTapped() {
        
    }
}
