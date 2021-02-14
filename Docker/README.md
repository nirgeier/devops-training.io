# Docker
## A (Very) Deep Dive Into Docker

### Preface
- Prior to Docker we had to use 3<sup>rd</sup> party tools for virtualization
- Docker relay on Linux Kernel 3.8.13 and above. This version added the required features for executing Docker at kernel level
- Docker is based upon [Linux Container](#what-is-a-container)

---

## Containers Overview
- Containers `share the same host kernel`.
### `cgroups`   
- Containers `use kernel cgroups`. 
- **A `cgroup` is a collection of processes that are bound to a set of limits or parameters defined via the cgroup filesystem.**
- Control groups, usually referred to as `cgroups`, are a Linux kernel feature which **allow processes to be organized into hierarchical groups whose usage of various types of resources can then be limited and monitored**. cgroups consist of one hierarchy (tree) per resource (cpu, memory, …)
- The kernel's cgroup interface is provided through a pseudo-filesystem called `cgroupfs`.
- Grouping is implemented in the core cgroup kernel code, while resource tracking and limits are implemented in a set of per-resource-type subsystems (memory, CPU, and so on).
### `namespace`
- Containers `use kernel namespaces` for isolation. 
- A namespace wraps a global system resource in an abstraction that makes it appear to the processes within the `namespace` that they have **their own isolated instance of the global resource.**
- Changes to the global resource are **visible** to other processes that are **members of the namespace**, but are invisible to other processes.
- `namespace` Allow you to create isolation of:
    - Process trees (PID Namespace)
    - Mounts (MNT namespace) `wc -l /proc/mounts`
    - Network (Net namespace) `ip addr`  
      - Isolation on the networking level is achieved through the creation of virtual switches in the linux kernel.
    - Users / UIDs (User Namespace)   
      - **User namespaces** isolate security-related identifiers and attributes, in particular, user IDs and group IDs
    - Hostnames (UTS Namespace) `hostname`
    - Inter Process Communication (IPC Namespace) `ipcs`
### `LXC` / `Libcontainer`
- In the past Docker were based upon `Linux containers` (`LXC`).
- `LXC` is a composition of `cgroup` & `namespace` for providing isolated environment which allow sandboxing processes from one another, and controlling their resource allocations.
- `LXC` bundles with the kernel’s `Cgroups` to provide the functionality for the process and network space instead of creating a full virtual machine and provides an isolated environment for the applications. 
- With the release of version 0.9 Docker.io have dropped LXC as the default execution environment, replacing it with their own `runc/libcontainer`.
    - `Libcontainer` provides a native Go implementation for creating containers with namespaces, `cgroups`, capabilities, and filesystem access controls. It allows you to manage the lifecycle of the container performing additional operations after the container is created
- In July 2015 Docker moved to `runc`
