# iOS-StarWars

This iOS project contains a simple showcase application which integrates the Star Wars API [SWAPI](https://swapi.dev/) to display information about the popular movie franchise. After selecting a film the user can navigate further to other detail screens for related information about characters, planets, starships, etc.

The app was build with SwiftUI and Swift Concurrency and targets iOS 17+, [which covers most of the available iOS devices today](https://telemetrydeck.com/survey/apple/iOS/majorSystemVersions/).

Images for the movie posters were added to the project manually as the API does not provide anything besides text data.
The effort for adding tests was not completed, but some of the most important entities were covered with unit- and snapshot-tests.

The next steps to improve the application could be:
- An offline-mode by persisting the loaded data on disk.
- A search for finding specific information
- A watch list screen where user could find their favorite facts

![screenshots](https://github.com/user-attachments/assets/9ed51496-3e5c-47ed-92f7-cf58cdaf4987)
