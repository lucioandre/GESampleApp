# GoTravel App

This simple app was built to demonstrate the usage of Viper Archictecture. Using Viper my project is structured in modules (in this app we have only one), and in general modules represent a screen. Each module utilizes the following organization:
* Wireframe - Responsible for screen instantiation and presentation, and also to communicate with other Viper modules in case of Navigation intention. 
* View - Handles everything related to UI. Only View knows what UIKit is. Is responsible for notifying Presenter of user interactions events and (once we must have to work over Apple's MVC) View Controller life cycle events. 
* Presenter - It is where the main logic of a screen happens. It is responsible to handle the events received from View and ask it to present information, that for example can be result of a request to Interactor, or change behavior. Also is responsible for asking Wireframe to navigate to other modules.
* Interactor - Here is where all data related logic is. It is responsible for calling our API Client for data and return the data as Entity. Also could used for communication with Persistance like Core Data, NSUserDefaults or even KeyChain.
* Entities - It is the model object handled by Interactor. For a serie of advantages (or problems), one of the main Viper principes is to avoid manipulating non PONSO (Plain Old NSObjects) models, like ManagedObjects or Mantle, thats why Entities are important.
* Protocols - Viper follows many good principes like S.O.L.I.D, and of them is Dependency Inversion. It means that sub-modules should not depend on concretions, but on Abstractions. It brings a series of advantages like refactoring, business rules change, unit testing, etc. In this case, I grouped all the protocols for the module in a single file. 

This project was written using Objective-C, and utilize Cocoapods as dependency manager. Layout is built using XIB files instead Storyboards to make reuse easier. The third-party libs used are:
* AFNetworking - for networking request
* Mantle - for JSON parse and object mapping
* MBProgressHUB - A common used progress indicator in iOS.
* SDWebImage - Used to load images async and manage presentation in reusable cells.
