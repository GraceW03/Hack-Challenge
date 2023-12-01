//MARK - Properties (view)
// MARK - viewDidLoad
// MARK - Set Up Views
// MARK: - Button Actions
import UIKit
import SnapKit

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

    // MARK - Set Up Views
    // ...

    // MARK: - Set Up Views

    private func setupProfileIcon() {
        profileIcon.translatesAutoresizingMaskIntoConstraints = false
        // Customize profileIcon properties
        view.addSubview(profileIcon)
        // Set up constraints for profileIcon using SnapKit
        profileIcon.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.width.height.equalTo(80)
        }
    }

    private func setupPageHeader() {
        pageHeader.translatesAutoresizingMaskIntoConstraints = false
        pageHeader.text = "Your Page Header"
        // Customize pageHeader properties
        view.addSubview(pageHeader)
        // Set up constraints for pageHeader using SnapKit
        pageHeader.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(profileIcon.snp.bottom).offset(16)
        }
    }

    private func setupPageText() {
        pageText.translatesAutoresizingMaskIntoConstraints = false
        pageText.text = "Your Page Text"
        // Customize pageText properties
        view.addSubview(pageText)
        // Set up constraints for pageText using SnapKit
        pageText.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(pageHeader.snp.bottom).offset(8)
        }
    }

    private func setupStudyButton() {
        studyButton.translatesAutoresizingMaskIntoConstraints = false
        studyButton.setTitle("Study", for: .normal)
        studyButton.backgroundColor = UIColor.blue
        // Customize studyButton properties
        view.addSubview(studyButton)
        // Set up constraints for studyButton using SnapKit
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
        // Customize createButton properties
        view.addSubview(createButton)
        // Set up constraints for createButton using SnapKit
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
        // Customize seeProfileButton properties
        view.addSubview(seeProfileButton)
        // Set up constraints for seeProfileButton using SnapKit
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
        let studyVC = StudyViewController() // Replace with the actual StudyViewController
        navigationController?.pushViewController(studyVC, animated: true)
    }

    @objc private func createButtonTapped() {}
        let createVC = CreateViewController() // Replace with the actual CreateViewController
        navigationController?.pushViewController(createVC, animated: true)
    }

    @objc private func seeProfileButtonTapped() {
        let profileVC = ProfileViewController() // Replace with the actual ProfileViewController
        navigationController?.pushViewController(profileVC, animated: true)
    }

    .
