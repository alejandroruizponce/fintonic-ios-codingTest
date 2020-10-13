# MarvelApp
---
This application has been written in Swift 5 in XCode 11. It follows the VIPER architecture pattern with the aim of being easily scalable and long-term maintainable.

The VIPER modules of the application are:
- SplashScreen Module: An initial module that synchronizes with the LaunchScreen and prepares the first module.
- HomeModule: Main tab in our navigation bar where we have a character search engine, along with a list of initial results as an example and a detailed view of each character.
- ArenaModule: Tab in charge of showing two selections of characters to be able to choose and carry out a fight between them based on their attributes.
- RankingModule: Tab in charge of showing a ranking with the characters that have fought and a detailed view of each character.

These tabs are launched within a generic TabBarController called "NavViewController". Each module is configured from "AppModules" and redirected by the main Router, all of this, among other things, is located inside the "BaseComponents" folder.

Requests and responses to the Marvel API are made within the "DataManager" folder.

Finally, the following Cocoa libraries are used:
- Alamofire: To simplify requests and responses with the API.
- Nuke: For downloading images of the characters via URL asynchronously.
- Lottie-ios: For "Loading" animation.
- SwiftPopup: To show the popups.

---
# Attribution

Data provided by Marvel. © 2014 Marvel
