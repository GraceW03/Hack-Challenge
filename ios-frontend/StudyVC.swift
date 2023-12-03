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
        profileIcon.image = UIImage(named: "profileIcon") // replace with your image
        view.addSubview(profileIcon)
        profileIcon.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(100)
        }
    }

    private func setupPageHeader() {
        pageHeader.translatesAutoresizingMaskIntoConstraints = false
        pageHeader.text = "Study VC"
        pageHeader.font = .systemFont(ofSize: 24, weight: .bold)
        view.addSubview(pageHeader)
        pageHeader.snp.makeConstraints { make in
            make.top.equalTo(profileIcon.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
    }

    private func setupPageText() {
        pageText.translatesAutoresizingMaskIntoConstraints = false
        pageText.text = "Welcome to the Study VC. Choose an action below:"
        pageText.numberOfLines = 0
        view.addSubview(pageText)
        pageText.snp.makeConstraints { make in
            make.top.equalTo(pageHeader.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
    }

    private func setupStudyButton() {
        studyButton.translatesAutoresizingMaskIntoConstraints = false
        studyButton.setTitle("Start Studying", for: .normal)
        studyButton.backgroundColor = .blue
        view.addSubview(studyButton)
        studyButton.snp.makeConstraints { make in
            make.top.equalTo(pageText.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        studyButton.addTarget(self, action: #selector(studyButtonTapped), for: .touchUpInside)
    }

    private func setupCreateButton() {
        createButton.translatesAutoresizingMaskIntoConstraints = false
        createButton.setTitle("Create Study Set", for: .normal)
        createButton.backgroundColor = .green
        view.addSubview(createButton)
        createButton.snp.makeConstraints { make in
            make.top.equalTo(studyButton.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        createButton.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
    }

    private func setupSeeProfileButton() {
        seeProfileButton.translatesAutoresizingMaskIntoConstraints = false
        seeProfileButton.setTitle("See Profile", for: .normal)
        seeProfileButton.backgroundColor = .purple
        view.addSubview(seeProfileButton)
        seeProfileButton.snp.makeConstraints { make in
            make.top.equalTo(createButton.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        seeProfileButton.addTarget(self, action: #selector(seeProfileButtonTapped), for: .touchUpInside)
    }

    // MARK: - Button Actions

    @objc private func studyButtonTapped() {
        let studyDetailVC = StudyDetailVC()
        navigationController?.pushViewController(studyDetailVC, animated: true)
    }

    @objc private func createButtonTapped() {
        let createStudySetVC = CreateStudySetVC()
        navigationController?.pushViewController(createStudySetVC, animated: true)
    }

    @objc private func seeProfileButtonTapped() {
        let seeProfileVC = SeeProfileVC()
        navigationController?.pushViewController(seeProfileVC, animated: true)
    }
}
