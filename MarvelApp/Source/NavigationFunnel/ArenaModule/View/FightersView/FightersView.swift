import UIKit
import Nuke
import Lottie

class FightersView: UIView, XibInstantiatable {

    // MARK: - IBOutlets
    @IBOutlet var fightersCollection: UICollectionView! {
        didSet {
            fightersCollection.backgroundColor = .white
            fightersCollection.showsVerticalScrollIndicator = false
            fightersCollection.showsHorizontalScrollIndicator = false
            fightersCollection.register(UINib(nibName: FighterCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: FighterCollectionViewCell.identifier)
            fightersCollection.delegate = self
            fightersCollection.dataSource = self
        }
    }
    @IBOutlet var searchBar: UISearchBar! {
        didSet {
            searchBar.delegate = self
            let textFieldInsideUISearchBar = searchBar.value(forKey: "searchField") as? UITextField
            textFieldInsideUISearchBar?.font = textFieldInsideUISearchBar?.font?.withSize(14)
            let labelInsideUISearchBar = textFieldInsideUISearchBar!.value(forKey: "placeholderLabel") as? UILabel
            labelInsideUISearchBar?.font = textFieldInsideUISearchBar?.font?.withSize(14)
            labelInsideUISearchBar?.text = NSLocalizedString("placeholderSearchFighter", comment: "")
        }
    }
    @IBOutlet var containerView: UIView!
    @IBOutlet var animationContainer: UIView!
    
    // MARK: - Properties
    var listCharacters: [Character] = [Character]()
    let options = ImageLoadingOptions(
        placeholder: UIImage(named: "placeholder"),
        transition: .fadeIn(duration: 0.33)
    )
    var loadingAnimation: AnimationView? = .init(name: "loadingAnimation")
    var viewFighter: Int?
    var characterSelected: Character?
    var delegateView: ArenaView?
    
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        instantiate()

    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        instantiate()
        
        setupUI()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.delegateView?.callPresenterMakeInitialRequest(for: self)
        }
    }
    
    func setupUI() {
        containerView.roundedView()
        runLoadingAnimation()
    }
    
    func runLoadingAnimation() {
        fightersCollection.isHidden = true
        loadingAnimation!.frame = animationContainer.bounds
        loadingAnimation!.contentMode = .scaleAspectFill
        loadingAnimation!.loopMode = .loop
        animationContainer.addSubview(loadingAnimation!)
        loadingAnimation!.play()
    }
    
    func stopLoadingAnimation() {
        fightersCollection.isHidden = false
        loadingAnimation?.stop()
    }

}

// MARK: - UISearchBarDelegate
extension FightersView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count >= 3 {
            runLoadingAnimation()
            delegateView?.callPresenterMakeRequestByName(with: searchText, for: self)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.endEditing(true)
    }
    
}

// MARK: - UICollectionViewDelegate
extension FightersView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listCharacters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = fightersCollection.dequeueReusableCell(withReuseIdentifier: FighterCollectionViewCell.identifier, for: indexPath) as! FighterCollectionViewCell
        
        cell.fighterName.text = listCharacters[indexPath.row].name
        cell.fighterPower.text = String(listCharacters[indexPath.row].comicsCount)
        
        if let imageUrl = URL(string: listCharacters[indexPath.row].image ?? "") {
            Nuke.loadImage(with: imageUrl, options: options, into: cell.fighterImage)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        characterSelected = listCharacters[indexPath.row]
        listCharacters.removeAll()
        listCharacters.append(characterSelected!)
        delegateView?.setCharacterSelected(from: self, with: characterSelected!)
        fightersCollection.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

     let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
         let cellWidth: CGFloat = flowLayout.itemSize.width
         let cellSpacing: CGFloat = flowLayout.minimumInteritemSpacing
         var cellCount = CGFloat(collectionView.numberOfItems(inSection: section))
         var collectionWidth = collectionView.frame.size.width
         var totalWidth: CGFloat
         if #available(iOS 11.0, *) {
             collectionWidth -= collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right
         }
         repeat {
             totalWidth = cellWidth * cellCount + cellSpacing * (cellCount - 1)
             cellCount -= 1
         } while totalWidth >= collectionWidth

         if (totalWidth > 0) {
             let edgeInset = (collectionWidth - totalWidth) / 2
             return UIEdgeInsets.init(top: flowLayout.sectionInset.top, left: edgeInset, bottom: flowLayout.sectionInset.bottom, right: edgeInset)
         } else {
             return flowLayout.sectionInset
         }
    }
}

