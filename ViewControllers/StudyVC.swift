//MARK - Properties (view)
// MARK - viewDidLoad
// MARK - Set Up Views
// MARK: - Button Actions
import UIKit
import SnapKit


class StudyVC: UIViewController {
    
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

    private func setupProfileIcon() {
        profileIcon.translatesAutoresizingMaskIntoConstraints = false
        // Customize profileIcon properties
        view.addSubview(profileIcon)
        // Set up constraints for profileIcon using SnapKit
        profileIcon.snp.makeConstraints { make in
            // Add constraints for profileIcon
        }
    }

    private func setupPageHeader() {
        pageHeader.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(pageHeader)
        // Set up constraints for pageHeader using SnapKit
        pageHeader.snp.makeConstraints { make in
            // Add constraints for pageHeader
        }
    }

    private func setupPageText() {
        pageText.translatesAutoresizingMaskIntoConstraints = false
        // Customize pageText properties
        view.addSubview(pageText)
        // Set up constraints for pageText using SnapKit
        pageText.snp.makeConstraints { make in
            // Add constraints for pageText
        }
    }

    private func setupStudyButton() {
        studyButton.translatesAutoresizingMaskIntoConstraints = false
        // Customize studyButton properties
        view.addSubview(studyButton)
        // Set up constraints for studyButton using SnapKit
        studyButton.snp.makeConstraints { make in
            // Add constraints for studyButton
        }
        studyButton.addTarget(self, action: #selector(studyButtonTapped), for: .touchUpInside)
    }

    private func setupCreateButton() {
        createButton.translatesAutoresizingMaskIntoConstraints = false
        // Customize createButton properties
        view.addSubview(createButton)
        // Set up constraints for createButton using SnapKit
        createButton.snp.makeConstraints { make in
            // Add constraints for createButton
        }
        createButton.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
    }

    private func setupSeeProfileButton() {
        seeProfileButton.translatesAutoresizingMaskIntoConstraints = false
        // Customize seeProfileButton properties
        view.addSubview(seeProfileButton)
        // Set up constraints for seeProfileButton using SnapKit
        seeProfileButton.snp.makeConstraints { make in
            // Add constraints for seeProfileButton
        }
        seeProfileButton.addTarget(self, action: #selector(seeProfileButtonTapped), for: .touchUpInside)
    }

    // MARK: - Button Actions

    @objc private func studyButtonTapped() {
        // Handle studyButton tap
    }

    @objc private func createButtonTapped() {
        // Handle createButton tap
    }

    @objc private func seeProfileButtonTapped() {
        // Handle seeProfileButton tap
    }
}
