# MiCADO: TOSCA Repository


### This repository holds material related to TOSCA Application Description Templates in [MiCADO](https://micado-scale.eu/)

#### On this branch specifically, you can find ADTs for the [ASCLEPIOS](https://www.asclepios-project.eu/) demonstrators, located under ADT/

## Structure
------------
### ADT/
##### Application Description Templates are kept here
These templates describe the application topology and policies for COLA use-cases. They are submitted to the toscasubmitter component in MiCADO to deploy applications to the cloud.

### policy/
##### Policy definitions are kept here
These definitions describe policies which can be referenced and abstracted by various ADTs. The location of a policy defintion is referenced in the import section of an ADT, and its defintion is expanded with properties and targets within the policies section of the ADT.

### micado_types.yaml
##### Custom type defintions for nodes, relationships, capabilities and data types are defined here
This file defines all custom types for use with the MiCADO platform. Its location is reference in the import section of an ADT, and the types defined herein can be used as needed within the topology section of the ADT.
