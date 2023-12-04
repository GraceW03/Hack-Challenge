//MARK - Properties (view)
// MARK - viewDidLoad
// MARK - Set Up Views
// MARK: - Button Actions
import UIKit
import SnapKit


class HomePageVC: UIViewController {
    
    // MARK - Properties (view)
    private let profileIcon = UIImageView()
    private let pageHeader = UILabel()
    private let pageText = UILabel()
    private let studyButton = UIButton()
    private let createButton = UIButton()
    private let seeProfileButton = UIButton()

    // MARK - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        // Helper methods for setting up views
        setupProfileIcon()
        setupPageHeader()
        setupPageText()
        setupStudyButton()
        setupCreateButton()
        setupSeeProfileButton()
    }

 
    // MARK: - Set Up Views

    private func setupProfileIcon() {
        profileIcon.translatesAutoresizingMaskIntoConstraints = false
       
        view.addSubview(profileIcon)
       
        profileIcon.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.width.height.equalTo(80)
        }
    }

    private func setupPageHeader() {
        pageHeader.translatesAutoresizingMaskIntoConstraints = false
        pageHeader.text = "Your Page Header"
       
        view.addSubview(pageHeader)
     
        pageHeader.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(profileIcon.snp.bottom).offset(16)
        }
    }

    private func setupPageText() {
        pageText.translatesAutoresizingMaskIntoConstraints = false
        pageText.text = "Your Page Text"
       
        view.addSubview(pageText)
   
        pageText.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(pageHeader.snp.bottom).offset(8)
        }
    }

    private func setupStudyButton() {
        studyButton.translatesAutoresizingMaskIntoConstraints = false
        studyButton.setTitle("Study", for: .normal)
        studyButton.backgroundColor = UIColor.blue
       
        view.addSubview(studyButton)

        studyButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(pageText.snp.bottom).offset(24)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        studyButton.addTarget(self, action: #selector(studyButtonTapped), for: .touchUpInside)
    }

    private func setupCreateButton() {
        createButton.translatesAutoresizingMaskIntoConstraints = false
        createButton.setTitle("Create", for: .normal)
        createButton.backgroundColor = UIColor.green
      
        view.addSubview(createButton)
       
        createButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(studyButton.snp.bottom).offset(16)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        createButton.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
    }

    private func setupSeeProfileButton() {
        seeProfileButton.translatesAutoresizingMaskIntoConstraints = false
        seeProfileButton.setTitle("See Profile", for: .normal)
        seeProfileButton.backgroundColor = UIColor.orange
        
        view.addSubview(seeProfileButton)
      
        seeProfileButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(createButton.snp.bottom).offset(16)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        seeProfileButton.addTarget(self, action: #selector(seeProfileButtonTapped), for: .touchUpInside)
    }

    // MARK: - Button Actions

    @objc private func studyButtonTapped() {
        let studyVC = StudyVC()
        navigationController?.pushViewController(studyVC, animated: true)
    }

    @objc private func createButtonTapped() {}
        let createVC = CreateSetVC()
        navigationController?.pushViewController(createVC, animated: true)
    }

    @objc private func seeProfileButtonTapped() {
        let profileVC = ProfileViewController() 
        navigationController?.pushViewController(profileVC, animated: true)
    }

    .
