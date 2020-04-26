# StopPoking
Your pokedex app

### Please enable semantic commits running the following commands:
`chmod +x hooks/commit-msg`

`git config core.hooksPath hooks`

### To run tests
Each module has its own dependencies and data and domain layers doesnt depends on Flutter, therefore their tests run dart test package. You can see how to run tests in each package below.
```
cd app/domain
flutter pub test

cd ../data
flutter pub test

cd ../presentation
flutter test
```
