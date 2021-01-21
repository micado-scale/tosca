# Application Description Templates
#### A domain-specific profile of TOSCA for MiCADO

This TOSCA profile extends the normative, [TOSCA Simple Profile in YAML v1.2](http://docs.oasis-open.org/tosca/TOSCA-Simple-Profile-YAML/v1.2/TOSCA-Simple-Profile-YAML-v1.2.html), with a set of custom container, compute, volume and policy types specific to MiCADO.

## Metadata Description

This section describes the required and optional metadata that should be
used when describing nodes (containers and virtual machines) in an ADT.
There are two rules for naming your nodes:
  - All nodes within a given ADT must be named **uniquely** 
  - Nodes must **not** contain *spaces* or *underscores*. 

### Describing containers

The below table shows the possible metadata for describing a container in MiCADO.
The **required** keys are shown in the table in **bold**.

| key                            | value (type)                 | description                                                    |
| ------------------------------ |:----------------------------:| ---------------------------------------------------------------|
| **name**                       | **string**                   | **Name of container**                                          |
| **type**                       | **string**                   | **MiCADO/Kubernetes type (see possible values in Table 2)**    |
| **image**                      | **string**                   | **Full name of container image**                               |
| tolerateMaster                 | boolean                      | Allow this container to run on the master node. Default: False |
| command                        | []string                     | Command to run / entrypoint to the container                   |
| args                           | []string                     | Arguments to run command / entrypoint                          |
| labels                         | map[string]string            | Labels to attach to this container                             |
| env                            | []*EnvMap*                   | List of maps for environment variables                         |
| *EnvMap*.name                  | string                       | Name of environment variable                                   |
| *EnvMap*.value                 | string                       | Value of environment variable                                  |
| ports                          | []*Port* or []*Service*      | List of maps for exposed ports.                                |
| *Port*.containerPort           | int                          | Port to expose on the container IP                             |
| *Port*.hostPort                | int                          | Port to expose on the host interface                           |
| *Port*.protocol                | string                       | Protocol to use (TCP / UDP)                                    |
| *Service*.port                 | int                          | Port to expose with this service                               |
| *Service*.nodePort             | int                          | High-level port to expose on the host (30000-32767)            |
| *Service*.targetPort           | int                          | Port to target on the pods/containers                          |
| *Service*.protocol             | string                       | Protocol to use (TCP / UDP)                                    |
| resources                      | map[`limits`\|`requests`]... | Please see the relevant section of the [Kubernetes API](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#resource-requests-and-limits-of-pod-and-container) for values   |

**Table 1. Required (in bold) and optional metadata for describing containers in MiCADO**

The `type` key determines the specific Kubernetes workload to use to deploy your application.
Table 2 below shows the most common values for this key. A Kubernetes Deployment (shown in bold)
is the recommended workload type for most use cases.

| value                                                         |  description                                                      |
| ------------------------------------------------------------- | ----------------------------------------------------------------- |
| **tosca.nodes.MiCADO.Container.Application.Docker.Deployment**| **[Deployment](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)- The basic scalable unit (recommended)**            |
| tosca.nodes.MiCADO.Container.Application.Docker.DaemonSet     | [DaemonSet](https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/)- Exactly one replica on each VM                      |
| tosca.nodes.MiCADO.Container.Application.Docker.StatefulSet   | [StatefulSet](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/)- Stable identifiers and persistent storage         |

**Table 2. Possible values for `type` key, for specifying the type of Kubernetes workload to deploy**

**NOTE** It is possible to inline an **entire** Kubernetes manifest under a special key named `inputs`.
This is considered an advanced feature for those users with already prepared Kubernetes
descriptors, or those wishing to use less common resources. If this applies to you, consider
using the [k8s2adt](https://github.com/UoW-CPC/k8s2adt)
command-line tool, which will create a single ADT out of one or more Kubernetes manifests.

### Describing virtual machines

The metadata required to describe a virtual machine in MiCADO is dependent on the chosen cloud service provider.
The table below shows the metadata available for defining an **OpenStack Nova** Compute Node. The **required** keys
are shown in Table 3 in **bold**. 

**NOTE** that the required value for the `type` key is given in its description.

| key                            | value (type)                 | description                                                          |
| ------------------------------ |:----------------------------:| -------------------------------------------------------------------- |
| **name**                       | **string**                   | **Name of virtual machine**                                          |
| **type**                       | **string**                   | ***tosca.nodes.MiCADO.Nova.Compute***                                |
| **image_id**                   | **string**                   | **ID of VM drive image (Ubuntu 18.04 & 20.04 supported)**            |
| **project_id**                 | **string**                   | **ID of the project to scope to**                                    |
| **network_id**                 | **string**                   | **ID of the network to connect to**                                  |
| flavor_id                      | string                       | ID of the instance flavor **(required if `flavor_name` not given)**  |
| flavor_name                    | string                       | Name of the instance flavor **(required if `flavor_id` not given)**  |
| key_name                       | string                       | Name of the SSH keypair                                              |
| security_groups                | []string                     | List of security group IDs to apply                                  |
| auth_url                       | string                       | Endpoint of the v3 Identity service                                  |

**Table 3. Required (in bold) and optional metadata for describing OpenStack Nova virtual machines in MiCADO**
