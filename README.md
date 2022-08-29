
[![Build status](https://build.appcenter.ms/v0.1/apps/1af55bed-6d94-4424-bb11-7f6a218db141/branches/master/badge)](https://appcenter.ms)

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
