# How to release an editor version:

- Clone the repository, and check, if you are using the newest GoDot Version.
- Open up the project with GoDot. ReImporting Assets is normally here, and can take some time.
- Delete other folders in /Resources except for /Resources/Basics and /Resources/Tutorials
- Duplicate World Pattern, make a new directory /Worlds/RenameMe, move the duplicated to this folder, and rename it to : 'RenameMe.tscn'
- Head in to the Rename.tscn, and set the fileName variable to "RenameMe".
- Save the scene, and reopen it.
- Create a simple scenario called test, save chunks, and save the world config.
- Check, if you can run this track ingame.
- Check in the main menu the version numer ;)
- Rename the Project in the Project Settings to: "Libre TrainSim Editor"
- Now you can close GoDot. Rename the src folder to "LibreTrainSimEditor_v0.8" for example and zip this folder.
