# MiCADO: TOSCA Repository


##### This repository holds the TOSCA related material developed as a part of the [COLA Project](https://project-cola.eu/)
------------
## ADT/
##### Application Description Templates are kept here
These templates describe the application topology and policies for COLA use-cases. They are submitted to the toscasubmitter component in MiCADO to deploy applications to the cloud.

## policy/
##### Policy definitions are kept here
These definitions describe policies which can be referenced and abstracted by various ADTs. The location of a policy defintion is referenced in the import section of an ADT, and its defintion is expanded with properties and targets within the policies section of the ADT.

## micado_types.yaml
##### Custom type defintions for nodes, relationships, capabilities and data types are defined here
This file defines all custom types for use with the MiCADO platform. Its location is reference in the import section of an ADT, and the types defined herein can be used as needed within the topology section of the ADT.
