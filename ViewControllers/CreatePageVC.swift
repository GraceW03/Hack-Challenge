//MARK - Properties (view)
// MARK - viewDidLoad
// MARK - Set Up Views
// MARK: - Button Actions
import UIKit
import SnapKit

class HomePageVC: UIViewController {
    
    // MARK - Properties (view)
    private let createFolder = UIButton()
    private let createSet = UIButton()

    // missing some properties atm

    // MARK - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        
        setupCreateFolder()
        setupCreateSet()
        
    }

    // MARK - Set Up Views


    // MARK: - Button Actions

    @objc private func createFolderButtonTapped() {
        
    }

    @objc private func createSetButtonTapped() {
        
    }
}
