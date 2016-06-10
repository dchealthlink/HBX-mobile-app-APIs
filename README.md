# HBX-mobile-app-APIs
Specifications and resources for mobile apps needed by the HBX mobile app

## APIs needed - Version 1 (Broker MVP)

Iteration 0 of the mobile app targets SHOP brokers, and allows them to do easy management of SHOP employer clients.

The MVP will use existing IAM & EnrollApp security systems, and not require any changes to HBX's security systems.

The MVP will require a couple of specific new API endpoints to yield broker data.

The following JSON payloads provide the information that the mobile app needs for the Broker MVP:
   `GET http://enroll.dchealthlink.com/broker_agencies/profiles/employers_api?id=<broker id>`
     The following JSON payload is returned:
     * [schema](enroll/broker/employers_list/response/schema.json)
     * [example](enroll/broker/employers_list/response/example.json)
    
## Additional APIs needed

### Version 2 (Expanded Broker App) 

The MVP API will be extended, or more endpoints added, to include:
 - roster/enrollment/participation information
 - employer plan offerings information
 - payment and invoice information


### Version 3 (Employer MVP)
 - roster management
 - employee coverage information

### Future versions
 
Will target additional customer groups including Employee and Individual users, providing shopping, verification, upload, notifications, etc.

TODO

******

### Some resources for dealing with JSON schemas:
* [jsonschema - Python tool] (http://python-jsonschema.readthedocs.org/en/latest/)
* [JSON Schema Lint - validator of JSON against a schema] (http://jsonschemalint.com/draft4/#)
* [JSON Schema Generator] (http://jsonschema.net/#/)
