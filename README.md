# Blocish

Sample project highlighting a layered architecture and a simple bloc inspired state management technique.

## Layered Architecture

A simple layered architecture that establishes well defined boundaries. These layers make for easier testability, reusability (layers can become packages) and ultimately something that is very simple, yet scalable for an app of any size.

## Layers

**Data layer**

This layer is responsible for retrieving raw data. Typically via an API, local database, etc. Model objects can also be defined here. 

**Domain layer**

This layer exposes domain specific functionality. It typically has a data layer component injected via DI (e.g. TodosApi) and is responsible for transforming data if need be and throwing application specific errors.

** Repository lifecycle is extremely powerful/important. Said another way, create them at the root of your app for app lifecycle scoping (e.g. an AuthenticationRepository) or maybe you only need access to a repository on said view.

**Application layer**

This layer is broken up into two sub-parts. **View Layer** and **Business Logic Layer** (bloc).

The view layer is Swift views. They can contain presentation logic (e.g. loading state check, empty view state check), but not business logic. 

The business logic layer manages state. In this sample project, these are blocs. 

## Blocs

Blocs typically have domain layer repositories injected in them for consumption and can respond to user or system events. Another interesting feature of blocs is a dedicated `@Published state` object (or struct). This object (or struct) encapsulates all of the state for the bloc and should be immutable. To make changes to state, you call `copyWith` and pass in your state updates. A new state object is returned and can be emitted by simply assigning to the state property.

Another cool side-effect of having a dedicated state object is the ability to hydrate a bloc with state. Imagine you're building a survey app and you want to allow a user to save their progress and come back later. Simply have your state object conform to `Codable` and stash it on disk, in a database, whereever. When the user returns to complete the survey, simply deserialize your state and hydrate your bloc.

## Considerations

**SwiftUI**

Some of the new SwiftUI features can muddy the waters between some of these boundaries. A prime example is the new `@FetchRequest` property wrapper for CoreData. Many would say your view layer shouldn't know about CoreData and you should create an abstraction layer around it. I generally agree with this sentiment, but I would make the call on a case by case basis. Introducing complexity and over engineering _could_ do more harm than good.

**Packages**

Reasons to create dedicated packages.

- Reusability
- Feature teams
- Semantic versioning  

Reasons not to create dedicated packges.

- Don't over engineer and introduce overhead if you don't need to.
