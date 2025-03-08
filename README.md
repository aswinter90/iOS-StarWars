# iOS-StarWars

This iOS project contains a simple showcase application which integrates the Star Wars API [SWAPI](https://swapi.dev/) to display information about the popular movie franchise. After selecting a film the user can navigate further to other detail screens for related information about characters, planets, starships, etc.

The app was build with SwiftUI and Swift Concurrency and targets iOS 17+, [which covers most of the available iOS devices today](https://telemetrydeck.com/survey/apple/iOS/majorSystemVersions/).

Images for the movie posters were added to the project manually as the API does not provide anything besides text data.
The effort for adding tests was not completed, but some of the most important entities were covered with unit- and snapshot-tests.

The next steps to improve the application could be:
- An offline-mode by persisting the loaded data on disk.
- A search for finding specific information
- A watch list screen where users could find their favorite facts

<div style="display: flex; flex-wrap: wrap;">
  <img src="https://github.com/user-attachments/assets/a41174bb-e84e-430e-8624-bac55bcd41d6" alt="1" style="width: 14%;" />
  <img src="https://github.com/user-attachments/assets/12fde79a-502d-4fa2-b061-6c4446c79282" alt="2" style="width: 14%;" />
  <img src="https://github.com/user-attachments/assets/97dee767-9ebf-41ac-afac-d26f3a50a3f4" alt="3" style="width: 14%;" />
  <img src="https://github.com/user-attachments/assets/957d0057-b945-49af-af87-a78a094e8916" alt="4" style="width: 14%;" />
  <img src="https://github.com/user-attachments/assets/de2977ef-fc7b-49a1-aebe-85db06c6b75c" alt="5" style="width: 14%;" />
  <img src="https://github.com/user-attachments/assets/231b4bda-d88e-4056-9025-86754847c27d" alt="6" style="width: 14%;" />
  <img src="https://github.com/user-attachments/assets/3c0f16f0-c850-4d74-9a1c-68714a7f7bf5" alt="7" style="width: 14%;" />
</div>
