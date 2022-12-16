# Ruzz: Programming Updates Tracker
 
Ruzz is a free open source app that allows its users to track new features and changes in popular programming languages, frameworks, libraries and editors. 

Built with Firebase, Flutter, and love. 

#### App Store
https://apps.apple.com/us/app/ruzz-programming-updates/id6443829024

#### Google Play
https://play.google.com/store/apps/details?id=dev.mell.ruzz.updated

### Contributing
Clone the project and run "flutter create ." to generate the missing android and ios folders. Due to security reasons I cannot give access to Firebase, so when you first launch the app you will get an empty screen because the data could not be loaded. 
To fix this go to main.dart and change the initialRoute parameter in both CupertinoApp and MaterialApp to page route that you would like to work on.

In case the page relies on Firebase code, remove this code, and use dummy data if needed (Unfrotunately you cannot simplify this process). 
To test the Firebase code a separate sample Firebase project would be needed. Please email me if you need the DB architecture. 

### Feedback
If you have any ideas, requests, or suggestions, please email me at vladyslavtsepenok@gmail.com. 
