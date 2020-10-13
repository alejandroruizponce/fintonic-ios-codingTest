import UIKit
import Nuke
import Lottie

// MARK: - HomeViewController
class HomeViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var heroTableView: UITableView! {
        didSet {
            heroTableView.delegate = self
            heroTableView.dataSource = self
            heroTableView.register(UINib(nibName: HeroTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: HeroTableViewCell.identifier)
        }
    }
    @IBOutlet var searchBar: UISearchBar! {
        didSet {
            searchBar.delegate = self
            let textFieldInsideUISearchBar = searchBar.value(forKey: "searchField") as? UITextField
            textFieldInsideUISearchBar?.font = textFieldInsideUISearchBar?.font?.withSize(14)
            let labelInsideUISearchBar = textFieldInsideUISearchBar!.value(forKey: "placeholderLabel") as? UILabel
            labelInsideUISearchBar?.font = textFieldInsideUISearchBar?.font?.withSize(14)
            labelInsideUISearchBar?.text = NSLocalizedString("placeholderSearchCharacter", comment: "")
        }
    }
    @IBOutlet var animationContainer: UIView!
    
    
    // MARK: - Properties
	var presenter: HomePresenter?
    var listCharacters: [Character] = [Character]()
    let options = ImageLoadingOptions(
        placeholder: UIImage(named: "placeholder"),
        transition: .fadeIn(duration: 0.33)
    )
    var loadingAnimation: AnimationView? = .init(name: "loadingAnimation")


    // MARK: - Life Cycle
	override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if !Reachability.isConnectedToNetwork() {
            let connectionPopUp = ConnectionAlertViewController()
            connectionPopUp.show(above: self)
        }
        runLoadingAnimation()
        presenter?.makeRequestInitialCharacters()

    }
    
    
    
    func runLoadingAnimation() {
        heroTableView.isHidden = true
        loadingAnimation!.frame = animationContainer.bounds
        loadingAnimation!.contentMode = .scaleAspectFill
        loadingAnimation!.loopMode = .loop
        animationContainer.addSubview(loadingAnimation!)
        loadingAnimation!.play()
    }
    
    func stopLoadingAnimation() {
        heroTableView.isHidden = false
        loadingAnimation?.stop()
    }
    
    
}

// MARK: - HomeView Protocol
extension HomeViewController: HomeView {
    func reloadWithCharactersResult(with characters: [Character]) {
        listCharacters = characters
        stopLoadingAnimation()
        heroTableView.reloadData()
    }
    
}

// MARK: - UISearchBarDelegate
extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count >= 3 {
            runLoadingAnimation()
            presenter?.makeRequestsCharactersByName(with: searchText)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.endEditing(true)
    }
    
    
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCharacters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = heroTableView.dequeueReusableCell(withIdentifier: HeroTableViewCell.identifier, for: indexPath) as! HeroTableViewCell
        
        cell.heroName.text = listCharacters[indexPath.row].name

        if let imageUrl = URL(string: listCharacters[indexPath.row].image ?? "") {
            Nuke.loadImage(with: imageUrl, options: options, into: cell.heroImage)
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.clickHeroCell(with: listCharacters[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0

        UIView.animate(
            withDuration: 0.5,
            delay: 0.05 * Double(indexPath.row),
            animations: {
                cell.alpha = 1
        })
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }

}
