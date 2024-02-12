# MapApp

MapApp is an iOS application built with SwiftUI that allows users to explore different locations and view details about them.

## Overview

MapApp provides users with an intuitive interface to discover various locations on a map. Users can interact with the map to explore different areas and tap on markers to access detailed information about each location.

## Features

- **Map View**: Explore locations on an interactive map powered by MapKit.
- **Location Details**: View detailed information about each location, including images, descriptions, and related links.
- **Search**: Easily search for specific locations by name or city using the search functionality.
- **Navigation**: Navigate through different locations seamlessly with intuitive controls.

## Architecture

MapApp follows the Model-View-Controller (MVC) architectural pattern:

- **Model**: The `Location` model represents the data structure for each location, including properties such as name, coordinates, description, and images.
- **View**: SwiftUI views such as `LocationView`, `LocationListView`, and `LocationDetailsView` handle the presentation and user interface aspects of the app.
- **Controller**: The `LocationViewModel` acts as the controller, managing the application logic, data flow, and interactions between views and the underlying data model.

## Code Explanation

MapApp consists of several SwiftUI views and a view model responsible for managing the application's state and interactions.

- `LocationView`: This view displays the main map interface along with search functionality and location previews.
- `LocationListView`: A list view displaying all available locations for exploration.
- `LocationDetailsView`: This view presents detailed information about a selected location, including images and related links.
- `LocationViewModel`: The view model orchestrates data flow and interactions, handling search queries, location selection, and map region updates.

## Screenshots

[Insert screenshots here]

## Installation

To install MapApp on your iOS device, follow these steps:

1. Clone the repository to your local machine.
2. Open the project in Xcode.
3. Build and run the project on your iOS device or simulator.

## Requirements

- iOS 14.0+
- Xcode 12.0+

## Credits

MapApp was developed by [Sabbir Nasir].

