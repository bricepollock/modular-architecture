# modular-architecture
Examples of iOS Modular Architecture in Swift

This architecture strives to encapsulate and bound our features to reduce complexity and improve reliability. Some great advantages of this approach are:

* Limiting and encapsulating scope / state
* Preventing feature-level bugs from cascading through your app
* Ability to work on features independently and in parallel
* Make testing individual features a bounded task


In the example each feature is encapsilated within a dynamic framework. A module router is used for inter-feature communication and the modified version of VIPER used within each feature.
