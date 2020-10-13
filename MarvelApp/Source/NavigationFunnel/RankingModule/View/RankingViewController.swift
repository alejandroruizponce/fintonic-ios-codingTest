import UIKit
import Nuke

class RankingViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var rankTableView: UITableView! {
        didSet {
            rankTableView.delegate = self
            rankTableView.dataSource = self
            rankTableView.register(UINib(nibName: RankTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: RankTableViewCell.identifier)
        }
    }
    @IBOutlet var emptyMessage: UILabel! {
        didSet {
            emptyMessage.isHidden = true
        }
    }
    
    
    // MARK: - Properties
	var presenter: RankingPresenter?
    var listCharacters: [Character] = [Character]()
    let options = ImageLoadingOptions(
        placeholder: UIImage(named: "placeholder"),
        transition: .fadeIn(duration: 0.33)
    )

    
    // MARK: - Life Cycle
	override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listCharacters = UserDefaultsFactory.getCharactersFight()
        if listCharacters.count == 0 {
            emptyMessage.isHidden = false
        } else {
            emptyMessage.isHidden = true
        }
        rankTableView.reloadData()
    }
    
    
}


// MARK: - RankingView Protocol
extension RankingViewController: RankingView {

    
}

// MARK: - UITableViewDelegate
extension RankingViewController: UITableViewDelegate, UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCharacters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = rankTableView.dequeueReusableCell(withIdentifier: RankTableViewCell.identifier, for: indexPath) as! RankTableViewCell
        
        cell.heroName.text = listCharacters[indexPath.row].name

        if let imageUrl = URL(string: listCharacters[indexPath.row].image ?? "") {
            Nuke.loadImage(with: imageUrl, options: options, into: cell.heroImage)
        }
        
        cell.rankPosition.text = "\(indexPath.row+1)º"
        
        cell.heroPower.text = String(listCharacters[indexPath.row].comicsCount) + NSLocalizedString("pointsPower", comment: "")

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
