# Packages

This is a PoC of splitting an iOS project into a set of libraries using the Swift package manager. 

The main project **SPMPackages** uses the **Core** package, which in turn contains the following two libraries
 
- **CoreHelpers** - contains couple of formatters
- **Networking** - library that contains base network data request infrastructure powered by Combine

Libraries are plugged into the main project via **Build Phases -> Link Binary With Libraries**

Besides that, the project shows some other aspects
- using **Combine** for network layer
- using **Diffable Data Source** for the *UITableView*
- using real network calls or using stubbed data
