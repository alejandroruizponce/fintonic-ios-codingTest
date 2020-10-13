
protocol Router {
    
    // MARK: - Splash Screen
    func createSplashScreen()
    
    // MARK: - Home View
    func createNavigationView()
    
    // MARK: - Detail Character View
    func createDetailCharacterView(with characterDetail: Character)
    
}
