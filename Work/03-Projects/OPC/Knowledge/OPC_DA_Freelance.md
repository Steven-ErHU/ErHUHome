# Freelance OPC DA Server

## Reference
Design Document For Freelance OPC DA Server

## High Level Architecture

### Goals and System Objectives

__OPC__ is primarily designed for __accessing data__ from a networked server, OPC interfaces can be used in many places within an application.

The main goal is to have standardized way to connect to data __of different process systems__. The architecture and design makes it possible to develop an __OPC Server__ which allows a client application to access data from OPC Server.

### Design Considerations

OPC client/server interaction is performed by __OPC-specified interfaces__ for DA.

The __OPC-Server__ is a stand-alone program which is installed on any PC within the system network. An __OPC type gateway__(*What is OPC gateway and where it is*) is configured in the __Control Builder F__ project. During commissioning __the data__ that is to be made available to the remote system __is downloaded to the gateway station__.

Thus any OPC compatible Windows program (with client function) can read and write the values of all the variables available in the gateway (*inputs, outputs and parameters of __function blocks__ and __variables__*) "online" from the connected __process stations__ and __field instruments__.

### Design Approach

At a __high level__, an OPC server is comprised of several objects: __the server, the group, and the item__. 

The OPC server object maintains information about the server and serves as a container for OPC group
objects.  
The OPC group object maintains information about itself and provides the mechanism for containing and logically organizing OPC items.  

Some of the information listed in this Chapter was taken from the publications and technical specifications of the __OPC Foundation__. Current information about the OPC Foundation can be found on the website <http://www.opcfoundation.org>

The OPC specification is for the following type of data:  
- __Online Data Access__, i.e., the efficient __reading and writing of data__ between an application and a process
control device flexibly and efficiently.
- __Alarm and Event Handling__, i.e., the mechanisms for OPC Clients to be __notified__ of the occurrence of specified events and alarm conditions.

Although OPC is primarily designed for accessing data from a networked server, OPC interfaces can be used in many places within an application. At the lowest level they can get raw data from the physical devices into a SCADA or DCS or from the SCADA or DCS system into the application. The architecture and design makes it possible to construct an OPC Server which allows a client application to access data from many OPC Servers provided by many different OPC vendors running on different nodes via __a single object__(***what does objects here means?***).






