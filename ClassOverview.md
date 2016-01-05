There are 3 layers in FSKit.
  1. Request/Response
  1. Service
  1. Repository

Most of the time you should be able to stay in the Repository and Service layer. If you would like to highly customize the requests, you will need to drop down to the lower Request/Response layer.

### FSKConnection ###

FSKConnection maintains authentication information, and all information common to all requests. You usually just need a single instance, and you will use it to create all of the other classes.

# Request/Response #
### FSKRequest ###

A single HTTP REST request to the FamilySearch API. Uses NSURLConnection.

### FSKResponse ###

The response that you get back from from the API. Handles error handling and parsing of the response data into model objects.

# Services #
### FSKPersonService ###

Helper service for making requests to the familytree/v2/person endpoint.

### FSKFamilyService ###

Helper service for requesting families and relationships. May make several requests to get a fully populated family.

# Repositories #
### FSKPersonRepository ###

A cache for FSKPersons. Uses FSKPersonService.

# Data Model #
### FSKPerson, FSKFamily, etc. ###

Model objects to handle person and relationship data. Provides helper methods and a simpler, more usable interface than the raw data structures returned from the API.