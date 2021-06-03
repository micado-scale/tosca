# MiCADO: TOSCA Repository


### This repository holds material related to TOSCA Application Description Templates in [MiCADO](https://micado-scale.eu/)

#### On this branch specifically, you can find ADTs for the [ASCLEPIOS](https://www.asclepios-project.eu/) demonstrators and components

## Structure
------------
### components/
##### ASCLEPIOS component ADTs are kept here
These are the security enablers in ASCLEPIOS. They should be mixed & matched and added to demonstrators for a complete, secure deployment

### demonstrators/
##### ASCLEPIOS demonstrator ADTs are kept here
These are the demonstrator applications in ASCLEPIOS

### micado_types.yaml
##### Custom type defintions for nodes, relationships, capabilities and data types are defined here
This file defines all custom types for use with the MiCADO platform. Its location is reference in the import section of an ADT, and the types defined herein can be used as needed within the topology section of the ADT.
