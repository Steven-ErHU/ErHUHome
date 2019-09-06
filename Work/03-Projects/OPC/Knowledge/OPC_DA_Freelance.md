# Freelance OPC DA Server

## Reference
Design Document For Freelance OPC DA Server

## High Level Architecture

### Goals and System Objectives

__OPC__ is primarily designed for __accessing data__ from a networked server, OPC interfaces can be used in many places within an application.

The main goal is to have standardized way to connect to data __of different process systems__. The architecture and design makes it possible to develop an __OPC Server__ which allows a client application to access data from OPC Server.

### Design Considerations

OPC client/server interaction is performed by __OPC-specified interfaces__ for DA.

The __OPC-Server__ is a stand-alone program which is installed on any PC within the system network. An __OPC type gateway__(_What is OPC gateway and where it is_) is configured in the __Control Builder F__ project. During commissioning __the data__ that is to be made available to the remote system __is downloaded to the gateway station__.

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

Although OPC is primarily designed for accessing data from a networked server, OPC interfaces can be used in many places within an application. At the lowest level they can get raw data from the physical devices into a SCADA or DCS or from the SCADA or DCS system into the application. The architecture and design makes it possible to construct an OPC Server which allows a client application to access data from many OPC Servers provided by many different OPC vendors running on different nodes via __a single object__(_what does objects here means?_).

![The architecture and design of OPC Service.](/assets/images/freelance_opc_da_server/architecture_and_design-01.png "The architecture and design of OPC Service")


### Overview

#### OPC Data Access (DA) Server

OPC is a Published Industrial Standard for system Interconnectivity. The OPC stands for __OLE for Process Control__. It uses the __Microsoft COM and DCOM technology__ to enable the application to exchange data on one or more computers using __client/server architecture__.

OPC defines a common set of interfaces. So applications retrieve data in exactly same format regardless of the data source. __The use of OPC Server in Freelance is to interact with Third party tools__. OPC Server interacts with Freelance CBF via __OPC gateway__. The OPC Server is represented in Freelance by the __gateway object__. Configuring the gateway object as OPC Server __makes it possible for the other clients to connect to the process data of the freelance system__. The other way round, it is possible to configure an OPC-S object in Freelance. This could be seen a mediator (OPC Client) to __make it possible for the freelance system to connect to other 3rd party OPC Server__.

The OPC Data access Specification specifies COM interfaces (what the interfaces are), not the implementation (not the how of the implementation) of those interfaces. It specifies the behavior that the interfaces are expected to provide to the client applications that use them.

At a high level, an OPC Data Access Server is comprised of several objects:

![High level objects.](/assets/images/freelance_opc_da_server/high_level_objects.png "High level objects")

__OPC Server Object:__

The OPC server object maintains information about the server and serves as a __container__ for OPC group objects.  
The OPC group object maintains information about itself and provides the mechanism for containing and logically
organizing OPC items.

__OPC Group:__

The OPC Groups provide a way for clients to __organize data__. For example, the group might represent items in a particular operator display or report. Data can be read and written. __Exception__ based connections can also be created between the client and the items in the group and can be enabled and disabled as needed. An OPC client can configure the __rate__ that an OPC server should provide the data changes to the OPC client.

![Relation between Server and Groups](/assets/images/freelance_opc_da_server/relation_server_group.png "relation between Server and Groups")

__OPC Item:__

Within each Group the client can define one or more OPC Items. The OPC Items represent __connections to data sources__ within the server. An OPC Item, from the custom interface perspective, is __not accessible__ as an object by an OPC Client. Therefore, there is __no external interface defined for an OPC Item__. All access to OPC Items is __via an OPC Group object__ that "contains" the OPC item, or simply where the OPC Item is defined.

![Relation between Group and Items](/assets/images/freelance_opc_da_server/relation_group_item.png "relation between group and items")

__Associated with__ each item is a __Value, Quality__ and __Time Stamp__. The value is in the form of a VARIANT, and the Quality is similar to that specified by __FieldBus__. __The items are not the data sources - they are just connections to them__. For example, the tags in a controller exist regardless of whether an OPC client is currently accessing them. 

> __The OPC Item should be thought of as simply specifying the address of the data, not as the actual physical source of the data that the address references.__


#### Custom and Automation Interfaces

OPC specifications always contain two sets of interfaces - __Custom Interfaces__ and __Automation interfaces__.

There are several unique considerations in implementing an OPC Server. The main issue is the frequency of data transfer over non-sharable communications paths to physical devices. Thus, we expect that the OPC Server will either be a local or remote EXE which includes code that is responsible for __efficient data collection from a physical device__.

An OPC client application communicates to an OPC server through the specified custom and automation interfaces. OPC servers __must implement__ the custom interface, and __optionally may implement__ the automation interface. Automation interfaces are required to be implemented if the OPC Server intends to support clients written in Visual Basic or Delphi languages.

![Custom and Automation Interfaces](/assets/images/freelance_opc_da_server/custom_automation_interface.png "Custom and Automation Interfaces")

It is also expected that the server will consolidate and optimize data accesses requested by the various clients to promote efficient communications with the physical device.  For inputs (Reads), data returned by the device is buffered for asynchronous distribution or synchronous collection by various OPC clients.  For outputs (writes), the OPC Server updates the physical device data on behalf of OPC Clients.

__Custom Interfaces:__

Interfaces for the OPC __Server__ Object:

- IOPCServer
- IOPCCommon
- IOPCItemProperties
- IConnectionPointContainer
- IOPCBrowseServerAddressSpace


Interfaces for the OPC __Group__ Object:

- IOPCGroupStateMgt
- IOPCItemMgt
- IDataObject (old)
- IOPCSyncIO
- IOPCAsyncIO (old)
- IOPCAsyncIO2
- IEnumOPCItemAttributes


__Automation Interfaces:__

- IOPCServerDisp
- IOPCGroupStateMgtDisp
- IOPCItemMgtDisp
- IOPCBrowseServerAddressSpaceDisp
- IOPCAsyncIODisp
- IOPCSyncIODisp
- IOPCItemDisp


Tree View of the OPC Interfaces is shown in the next page:

![Tree View of the OPC Interfaces](/assets/images/freelance_opc_da_server/tree_view_of_the_opc_interfaces.png "Tree View of the OPC Interfaces")

| __Data Access Server Required Interfaces__| 1.0	        | 2.0	        | 3.0	        | __Freelance OPC Server__  |
| :-------------------------------------    | :----         | :----         | :----         | :-------------------      |
| __OPC Server__                            |               |               |               |                           |
| IUnknown 	                                |  Required 	|    Required 	|   Required 	| Available                 |
| IOPCServer 	                            |  Required 	|    Required 	|   Required 	| Available                 |
| IOPCCommon 	                            |  N/A 	        |    Required 	|   Required 	| Available                 |
| IConnectionPointContainer 	            |  N/A 	        |    Required 	|   Required 	| Available                 |
| IOPCItemProperties 	                    |  N/A 	        |    Required 	|   N/A 	    | Available                 |
| IOPCBrowse 	                            |  N/A 	        |    N/A 	    |   Required 	|                           |
| IOPCServerPublicGroups 	                |  Optional 	|    Optional 	|   N/A 	    |                           |
| IOPCBrowseServerAddressSpace 	            |  Optional 	|    Optional 	|   N/A 	    | Available                 |
| IOPCItemIO 	                            |  N/A 	        |    N/A 	    |   Required 	|                           |
| __OPC Group__                             |               |               |               |                           |
| IUnknown 	                                |  Required 	|    Required 	|   Required 	| Available                 |
| IOPCItemMgt 	                            |  Required 	|    Required 	|   Required 	| Available                 |
| IOPCGroupStateMgt 	                    |  Required 	|    Required 	|   Required 	| Available                 |
| IOPCGroupStateMgt2 	                    |  N/A 	        |    N/A 	    |   Required 	|                           |
| IOPCPublicGroupStateMgt 	                |  Optional 	|    Optional 	|   N/A 	    |                           |
| IOPCSyncIO 	                            |  Required 	|    Required 	|   Required 	| Available                 |
| IOPCSyncIO2 	                            |  N/A 	        |    N/A 	    |   Required 	|                           |
| IOPCAsyncIO2 	                            |  N/A 	        |    Required 	|   Required 	| Available                 |
| IOPCAsyncIO3 	                            |  N/A 	        |    N/A 	    |   Required 	|                           |
| IOPCItemDeadbandMgt 	                    |  N/A 	        |    N/A 	    |   Required 	|                           |
| IOPCItemSamplingMgt 	                    |  N/A 	        |    N/A 	    |   Optional 	|                           |
| IConnectionPointContainer 	            |  N/A 	        |    Required 	|   Required 	|                           |
| IOPCAsyncIO 	                            |  Required 	|    Optional 	|   N/A 	    | Available                 |
| IDataObject 	                            |  Required 	|    Optional 	|   N/A 	    | Available                 |

__Interface Descriptions:__

__IOPCServer:__

This is the main interface to an OPC server. The OPC server is registered with the operating system as specified in the Installation and Registration. All operations that are carried out at the server, like
- Adding and removing groups
- Status of the OPC server

Information about the OPC server state:
- CheckServer
- GetNumberOfObjects
- GetLockStateOfGroup
- OPCServerManagement
- GetStart/CurrentTime

This interface must be provided, and all functions implemented as specified. _COPCServerCust_ class implements this interface.

> HRESULT	AddGroup(szName, bActive, dwRequestedUpdateRate, hClientGroup, pTimeBias, pPercentDeadband, dwLCID, phServerGroup,  pRevisedUpdateRate, riid, ppUnk)
> HRESULT	GetErrorString(dwError, dwLocale, ppString) 
> HRESULT	GetGroupByName(szName, riid, ppUnk)
> HRESULT	GetStatus(ppServerStatus)
> HRESULT	RemoveGroup(hServerGroup, bForce)
> HRESULT	CreateGroupEnumerator(dwScope, riid, ppUnk)

__IOPCCommon:__

It provides the ability to set and query a _LocaleID_ which would be in effect for the particular client/server session. That is, as with a Group definition, the actions of one client do not affect any other clients.

This interface must be provided, and all functions implemented as specified. _COPCServerCust_ class implements this interface.

> HRESULT SetLocaleID ([in] LCID dwLcid);
> HRESULT GetLocaleID ([out] LCID *pdwLcid);
> HRESULT QueryAvailableLocaleIDs ([out] DWORD *pdwCount,[out, sizeis(dwCount)] LCID **pdwLcid);
> HRESULT GetErrorString([in] HRESULT dwError,[out, string] LPWSTR *ppString);
> HRESULT SetClientName ([in, string] LPCWSTR szName );

__IOPCItemProperties:__

This interface can be used by clients to browse the available properties associated with an _ITEMID_ and to read the current values of these properties.

This interface allows a flexible and convenient way to browse, locate and read this related information without imposing any particular design structure on the underlying system.

It also allows such information to be read without the need to create and manage OPCGroups.  
So, the general intent of this interface is to provide a way, given an _ITEMID_ of any one of a number of related its properties, to identify the other related properties.

This interface is implemented by the class _COPCServerCust_.

> HRESULT QueryAvailableProperties(szItemID, pdwCount, ppPropertyIDs, ppDescriptions, ppvtDataTypes);
> HRESULT GetItemProperties (szItemID, dwCount, pdwPropertyIDs, ppvData, ppErrors );
> HRESULT LookupItemIDs( szItemID, dwCount, pdwPropertyIDs, ppszNewItemIDs, ppErrors );

__IConnectionPointContainer:__

This is a Microsoft specific interface for COM implementation. This is not being documented here as the complete
information about this interface is available at Microsoft’s online msdn at the following link:

<http://msdn.microsoft.com/en-us/library/ms683857(VS.85).aspx>

__IOPCBrowseServerAddressSpace:__

This interface provides a way for clients to browse the available data items in the server, giving the user a list of the valid definitions for an _ITEM ID_. This interface is implemented by the class _COPCServerCust_. The list of methods of this interface is as follows:

> HRESULT QueryOrganization(pNameSpaceType);
> HRESULT ChangeBrowsePosition(dwBrowseDirection, szString);
> HRESULT BrowseOPCItemIDs(dwBrowseFilterType, szFilterCriteria, vtDataTypeFilter, dwAccessRightsFilter, ppIEnumString);
> HRESULT GetItemID(szItemDataID, szItemID);
> HRESULT BrowseAccessPaths(szItemID, ppIEnumString);

__IOPCGroupStateMgt:__

IOPCGroupStateMgt allows the client to manage the overall state of the group. Primarily this allows changes to the update rate and active state of the group. This interface is implemented by the class _COPCGroupCust_. Following are the methods of this interface:

> HRESULT GetState(pUpdateRate, pActive, ppName, pTimeBias, pPercentDeadband, pLCID, phClientGroup, phServerGroup)
> HRESULT SetState(pRequestedUpdateRate, pRevisedUpdateRate, pActive, pTimeBias, pPercentDeadband, pLCID, hClientGroup)
> HRESULT SetName(szName);
> HRESULT CloneGroup(szName, riid, ppUnk);

__IOPCItemMgt:__

IOPCItemMgt allows a client to add, remove and control the behavior of the items in a group. This interface is implemented by the class _COPCGroupCust_. Methods of this interface are as follows:

> HRESULT AddItems(dwCount, pItemArray, ppAddResults, ppErrors)
> HRESULT ValidateItems(dwCount, pItemArray, bBlobUpdate, ppValidationResults, ppErrors)
> HRESULT RemoveItems(dwCount, phServer, ppErrors)
> HRESULT SetActiveState(dwCount, phServer, bActive, ppErrors)
> HRESULT SetClientHandles(dwCount, phServer, phClient, ppErrors)
> HRESULT SetDatatypes(dwCount, phServer, pRequestedDatatypes, ppErrors)
> HRESULT CreateEnumerator(riid, ppUnk)

__IDataObject:__

<div class="alert alert-info">
  <i class="fas fa-info-circle"></i> <strong>Note:</strong> This interface was part of DA 1.0. This interface is replaced with IConnectionPointContainer in DA 2.05. The support of this interface by the OPC Server is optional.
</div>

_IDataObject_ is implemented on the OPC Group rather than on the individual items. This allows the creation of an Advise connection between the client and the group using the OPC Data Stream Formats for the efficient data transfer. This interface is implemented by the class _COPCGroupCust_. This interface has the following 2 methods:

> HRESULT Dadvise(pFmt, adv, pSnk, pConnection);
> HRESULT Dunadvise(Connection);

__IOPCSyncIO:__

IOPCSyncIO allows a client to perform synchronous read and write operations to a server. These operations will run to completions. This interface is implemented by the class _COPCGroupCust_. The 2 methods of this interface are as follows:

> HRESULT Read(dwSource, dwCount, phServer, ppItemValues, ppErrors)
> HRESULT Write(dwCount, phServer, pItemValues, ppErrors)

__IOPCASyncIO:__

<div class="alert alert-info">
  <i class="fas fa-info-circle"></i> <strong>Note:</strong> This interface was part of DA 1.0. This interface is replaced with IOPCASyncIO2 in DA 2.05. The support of this interface by the OPC Server is optional.
</div>

IOPCASyncIO allows a client to perform asynchronous read and write operations to a server. This interface is implemented by the class _COPCGroupCust_. Methods of this interface are as follows:

> HRESULT Read(dwConnection, dwSource, dwCount, phServer, pTransactionID, ppErrors)
> HRESULT Write(dwConnection, dwCount, phServer, pItemValues, pTransactionID, ppErrors);
> HRESULT Cancel (dwTransactionID);
> HRESULT Refresh(dwConnection, dwSource, pTransactionID);

__IOPCASyncIO2:__

This interface is similar to IOPCASyncIO. This interface is intended to replace IOPCASyncIO. This interface is implemented by the class _COPCGroupCust_. It differs from IOPCASyncIO as follows:

- It is used to control a connection established with IConnectionPoint rather than IDataObject. ConnectionPoints have been found to be a much cleaner way to return data than IDataObject.
- The transaction ID logic has been changed. The previous (IOPCAsync) implementation did not work well in combination with COM marshalling.
- The async read from cache capability is removed. In practice this was just a slower and more complex form of a sync read from cache. Server design is simplified by removing this.

Supported methods of this interface are as follows:

> HRESULT Read(dwCount, phServer, dwTransactionID, pdwCancelID, ppErrors)
> HRESULT Write(dwCount, phServer, pItemValues, dwTransactionID, pdwCancelID, ppErrors);
> HRESULT Cancel2 (dwCancelID);
> HRESULT Refresh2(dwSource, dwTransactionID, pdwCancelID);
> HRESULT SetEnable(bEnable);
> HRESULT GetEnable(pbEnable);

__Read Method:__ The Values and Quality for the requested items are sent to the client through the _IOPCDataCallback::OnReadComplete_ method. The Value and Quality are the values that the server obtains from the DEVICE when this method is called. The CACHE of the server should be updated with the acquired value and quality.

__IEnumOPCItemAttributes:__

IEnumOPCItemAttributes allows a client to find out the contents (items) of a Group and the attributes of those items. Most of the returned information was either supplied by or returned to the client at the time it called AddItem.  
Methods of this interface are:
> HRESULT Next();
> HRESULT Skip();
> HRESULT Reset(void);
> HRESULT Clone(ppEnumItemAttributes);

<div class="alert alert-info">
  <i class="fas fa-info-circle"></i> <strong>Note:</strong> Interfaces required to be implemented by OPC Clients are not discussed here as it is out of scope of this design document.
</div>

#### Reading and Writing Data

__There are basically three ways to get data into a client (ignoring the 'old' _IDataObject/IAdviseSink_).__
- IOPCSyncIO::Read (from cache or device)
- IOPCAsyncIO2::Read (from device)
- IOPCCallback::OnDataChange() (exception based) which can also be triggered by IOPCAsyncIO2::Refresh.

__In general the three methods operate independently without 'side effects' on each other. There are two ways to write data out:__
- IOPCSyncIO::Write
- IOPCAsyncIO2::AsyncWrite

## System Architecture

### Block diagram

![Block diagram](/assets/images/freelance_opc_da_server/block_diagram.png "Block diagram")

__Description:__
The block diagram consists of the following major components:

1. The OPC Clients (CBF, DigiVis or any 3rd Party OPC Clients)
2. The Control Builder F (CBF) – the Engineering Station
3. The OPC Server
4. The Controllers and the Field Devices
(_what's the difference of CBF in 1. and CBF in 2.?_)

OPC Server will be described in more details in the following sections. The other components are not in the scope of this design document.

#### OPC Server:

An OPC server is used to make process data from a Control Builder F project available to other systems via the OPC interface.

The OPC server is a __stand-alone program__, which can be installed on any PC which is connected the control network. Within the Control Builder Project, those data, which should be available at a remote system, are configured. These configuration data is loaded to the OPC server via the OPC Gateway.

The OPC server consists of a __DMSAPI__ communication on the lower side as interface to the DMS and Controller communication. The DMSAPI covers also the needed configuration information to connect to the Controller.

Data from the AC 800F and Freelance 2000 process stations as well as the connected field bus instruments is transmitted to other systems with an OPC client interface via an OPC server interface.

- The OPC server shall be able to connect to Controller, using __Ethernet__.
- This Controller __has to be__ configured from the Control Builder F (CBF).
- It is __not possible__ to use this OPC server without a controller.
- Every value acquired via OPC has a time stamp and a status.
- OPC uses a block format for communication, and in a single call it can send several requests and receive several values.
- OPC allows client applications to specify required scan rates.
- The variables for a server can be viewed and selected using a browser.
- The concept of creating groups allows different sets of variables with different scan rates.

The interface to the OPC-Layer uses the following data structures:

- __Tag names__ represent __devices and addressable blocks__ in a hierarchical structure.
- Tag names possess(拥有，控制) __accessible components__.
- Accessible components consist of __names, data types__ and __access rights__.

The OPC-Layer passes a number of variable subscriptions to the layer DMSAPI. First the DMSAPI has to convert the item name to the physical address.


__Key functionalities__ of OPC Server:

The following sequence shows __the connection between OPC Client to Controller for accessing the data from Controller to OPC Server.__ the OPC Server can send the data to the OPC Client.

For accessing __data from the Controller__ the OPC Client has to __send OPC requests__ to the OPC Server. The OPC-Server converts these OPC-requests __to DMS__ and sends these __requests to the Field bus protocol__.

The Field bus converts these requests to DMS request and sends these requests to the Controller. The Controller handles these requests and sends to the __DMSOnl layer__.

The DMS converts this response and sends it to the OPC-Server. The OPC-Server converts the response to an __OPC-response__ and sends it back to the OPC Client.

The OPC Server consists of the following __sub-systems__:

- OPC Configuration
- Data Access (DA) Server
- Alarms and Events (AE) Server
- Data Acquisition Layer (DAL)
- DMS Protocol
- FieldBus (FB) Protocol

__Sub System Architecture:__

#### Logical View

<div class="alert alert-info">
  <i class="fas fa-info-circle"></i> <strong>Note:</strong> Freelance OPC Server support Data Access 2.05 only.
</div>


![Sub System Architecture](/assets/images/freelance_opc_da_server/sub_system_architectur.png "Sub System Architecture")

##### OPC Configuration

The Configuration is an essential part of the application (OPC Server) which makes the application to __get the respective CBF project's configuration through gateway station__. The gateway station in CBF is the representative of the OPC Server. It has the name gateway station only __because it is possible to create other gateways in the freelance system as well__. These configuration data is __required for__ OPC Server to __interact with__ the controller through DMS. This is achieved by _GetConfig_ thread which starts at the beginning of the application (OPC Server). This thread is __tightly coupled with__ the DMS callback. This thread terminates with the application, therefore __no__ end event needed. If there is already configuration data available with _opcsrv_ folder at installed path it configures the OPC Server, otherwise it waits until the _ConfigEvent_ sets fire by the DMS which happens after every GWY download
from CBF.

The __configuration process__ has three parts:

- Resource table configuration (More details in AE Design Document)
- Alarms & Events Configuration (More details in AE Design Document)
- Data Access Configuration

__Data Access Configuration__

The Freelance OPC Server interacts with controller or devices with the help of these two protocols:

- CDALProtocol_DMSONL
- CFBProtocol

The reading of configuration starts with _CConfiguration_ which in turn calls _CDataAquisitionLayer_ object’s method of _ReadConfiguration_. This class contains objects of above mentioned __protocol classes__. The protocol object contains one _CController_ vector object which size sets to 256. It configures __only if__ Operator Station of type is __MSR__(_what is MSR?_). For each Operator Station of type MSR it creates one _CController_ object and inserts in the vector object. All resource information (MSR type) and variable data reads from DMS and stores in _CConfiguration_ objects in the form of _CBranch_ and _CLeaf_ objects respectively. Similarly it reads Tag information and components of tags and stores as objects of _CBranch_ and _CLeaf_. To read the data from DMS the configuration methods uses the following DMS APIs:

- DMSAPI_GetFirstUniResourceInfo
- DMSAPI_GetNextUniResourceInfo
- DMSAPI_GetFirstUniVarInfo
- DMSAPI_GetNextUniVarInfo
- DMSAPI_GetFirstUniTagInfo
- DMSAPI_GetNextUniTagInfo
- DMSAPI_GetFirstUniInstCmpByTagName
- DMSAPI_GetNextUniInstCmpByTagName
- DMSAPI_GetFirstUniBasicCmpOfObjClass
- DMSAPI_GetNextUniBasicCmpOfObjClass
- DMSAPI_GetFirstUniResourceInfo
- DMSAPI_GetNextUniResourceInfo
- DMSAPI_FBGetFirstUniTagInfo
- DMSAPI_FBGetNextUniTagInfo
- DMSAPI_FBGetUniVarList
- DMSAPI_GetUniTagByAddr

##### OPC Data Access (DA)

The OPC DA Sub-System has 3 major modules and is shown in the following diagram:

![high level objects](/assets/images/freelance_opc_da_server/high_level_objects-02.png "high level objects")


__OPCServer Object:__

The OPCServer object is the primary object that an OPC server exposes. The interfaces that this object provides are shown in the following interface diagram:

![OPCServer object's interface diagram](/assets/images/freelance_opc_da_server/opcserver_object_interface_diagram.png "OPCServer object's interface diagram")

The functionality provided by each of the above interfaces is defined in the section __Custom and Automation Interfaces__

__OPC Group Object:__

- Groups are container for items
- To read items from an OPC Server a group needs to be defined first
- Items can only be added to an existing OPC Group
- All items in a group have the same group management properties
- For load balancing it could be useful to add several groups with different update rates
- Items that are added to different groups with different update rates will be read once, but with the smallest update rate
- Items and groups will be updated with live data when the Group/Item is advised.
- Advising a group with items or only a single item will mean that the OPC Items are moved to the OPC Shelf
- All items in the OPC Shelf will be read cyclically(周期地).
- If an item is already in the OPC Shelf the ref count of the item is increased and the update rate is adjusted if needed.
- Reading the items is based on the protocol information
- Controller items are added to the controller variable list and read cyclically. The OPC quality of the items is set here as well.
- Fieldbus items are read directly via the DMS layer
- Unadvising a group with items or only a single item will mean that the OPC items are removed from the OPC Shelf.
- If an item is in the OPC Shelf more than once the ref counts of the item is decreased.
- Controller items are deleted from the controllers variable list
- For FieldBus items the unadvice will cancel the DMS request by using the connection id.

The OPCGroup object is the primary object that an OPC server exposes. The interfaces that this object provides are shown in the following interface diagram:

![OPCGroup object's interface diagram](/assets/images/freelance_opc_da_server/opcgroup_object_interface_diagram.png "OPCGroup object's interface diagram")

__OPC Item Object:__

The OPCItem object is the primary object that an OPC server exposes. It is derived from _COPCItemDisp_ which in turn is derived from _COPCItemRoot_. Refer to the class diagram in section __Class Diagram for Item Object__ for the class hierarchy and the methods.  
The OPCItem Object is responsible to hold the following data to access the item's data through DMS:

- Name of the Item.
- Active state (Enable/Disable)
- OPCHANDLEs of the Client, Server, and Group
- Advice state (Advised/Unadvised)
- Access Rights(READ/WRITE/READWRITE/NOACCESS)
- Quality (Good/Bad)
- Timestamp
- Group (To which Item is associated)
- Protocol (To which Item is associated)
- Update rate (By which Item will be updated)
- Data Type of the Item

This object will be used for 2 different operations:

1. __Cyclic Operations:__ Cyclic read operations performs by advising a group with item(s) by moving into object of _COPCItemShelf_ which has been created as global object.
2. __Acyclic Operations:__ Acyclic operations (Sync/Async Reading/Writing) performs by issuing a new job to the internal Job list for group(s) or items(s).


##### Data Acquisition Layer (DAL)

The __Data Acquisition Layer (DAL)__ is the protocol layer within the OPC server which is positioned above the Field Bus protocols and the controller protocol (DMSOnl).  
The main functionalities of DAL are:

- Initialization of Protocols (It creates the one DMSONL protocol and one FB protocol and add them into protocol list)
- Configuration of Protocols (Explained in section __5.1.1.1	OPC Configuration__)
- Asynchronous operations (Async Read/Write)
- Synchronous operations (Sync Read/Write)
- Cyclic read operations (Advise/Unadvise)

Classes used for performing Read/Write operation are:

- DALReadJob (Sync/Async Read)
- DALWriteJob (Sync/Async Write)
- CDALProtocol_DMSONL/CFBProtocol (Cyclic Read)

The DAL object has following callback functions used by Async read/write jobs:

- Response(vector < READ_DATA* >): Which calls _ASyncReadResultsCB_ global for async read operations
- Response(vector < WRITE_DATA* >): Which calls _ASyncWriteResultsCB_ global for async write operations

Synchronous jobs do not call Response but fires an event as the application waits (40 sec) while reading through DMS.

The DAL has another callback function mentioned below for cyclic read operation, which is registered with both the protocols.

- CyclicCallback: Which calls ValueChangedCB global function for cyclic read operations

__Data Access Layer Protocol:__

The class _CDALProtocol_ declared the interfaces to implement the protocols. This class is an abstract class. This is the base class for __DMSONL__ (CDALProtocol_DMSONL) and __FB__ (CFBProtocol) protocols classes.

__DMS Protocol:__

The DMS protocol is used for communication from OPC server to the process stations. This protocol is implemented in *DALProtocol_DMSONL* class. At the time of creating this object it registers two callback functions with DMS. One is _DMSCallback_ for cyclic operations and the second one is _DMSACycleCb_ for acyclic operations.  
Both the functions belong to this object. This class contains the following data to access the data from DMS:

- Container class object for _CController_ (vector)
- Container class object for _CDMSJob_ and _Transaction ID_(map)
- Container class object for _DMS_CONN_HANDLE_ and _CController_(map)
- Container class object for _CCyclicItem_ and _CString(map)_ for cyclic items
- Object of internal class _CallbackHandler_

__CallbackHandler__: This internal class has one thread called CallbackThread which will be started at the time of instantiating the object. This thread is responsible for handling of callback functions.


Following are the functionalities of this protocol:

- Reading configuration of the CBF project( Explained in section 5.1.1.1)
- Adding controller information into CController* container object
- Read and Write operations.
- Information about the state of the process stations.
- Cyclic read actions, and connecting and de-connecting of process stations and variables.
- Cyclic information to value changes (Value Changed Callback).
- Log of asynchronous Read and Write Callbacks
- Adding and removing of OPC items.

__Cyclic Read Operation:__

Cyclic read operations are performed by advising a group with item(s) by moving into COPCItemShelf object. If an item is already in the OPC Shelf the reference count of the item is increased and the update rate is adjusted if needed. Reading an item is based on the protocol information.

It performs cyclic reading with CNamedItem container (map) object m_AdvisedItems by advising items. This object keeps track of all items advised for cyclic reading. While advising an Item( variable) it looks into the Configuration object and gets respective CDMSLeafVisitor object which contains Items’s resource number and object path by which it create one CNamedItem object, this will be added to the CController object with AddVariable method. This method adds this variable (Item) into CCyclicVariableList object which adds variable with DMS with DMSAPI_VLAddReadVarByAddr method.

__Acyclic Read/Write:__ 

It performs acyclic reading/writing with CDMSJob container (map) object m_RunningJobs. The CDMSJob object contains CACyclicVariableList* container object (vector) which looks into the Configuration object’s data for a respective Item and gets CDMSLeafVisitor object which contains the Items’s resource number, object path and DMS data type. With this data CDMSJob object creates a CWriteItem/CReadItem object and adds them into CACyclicVariableList object with AddVariable method. The CACyclicVariableList object class calls AddWriteVariable/ AddReadVariable method of CVariableList class that registers the item with DMS with DMSAPI_VLAddWriteVarByAddr /DMSAPI_VLAddReadVarByAddr methods.

<div class="alert alert-info">
  <i class="fas fa-info-circle"></i> <strong>Note:</strong> The mechanism for sync and Async operations are performed the same way but only difference is for sync Read/Write, the caller functions waits for a response. Sync/Async read/write is explained in detailed in
section Acyclic Access
</div>

Some of the main DMS API functions used in the Freelance OPC Server are as follows:

| Functions                            |     Descriptions                                                                                                                                                                                                  |
|:-------------------------------------|:----------------------------------------------------------------------     |
| DMSAPI_RegisterCltCB                 |     Registers a callback function with a specific CallbackId. <br>The registered Callback function is called when data are received. <br>On connecting and disconnecting all registered Callback functions are called     |
| DMSAPI_GetProjectInfo                |     Get current project version                                                                                                                                                                                   |
| DMSAPI_GetFirstUniResourceInfo       |     This procedure returns the details of the first resource <br>in the resource domain.                                                                                                                              |
| DMSAPI_GetNextUniResourceInfo        |     This procedure returns the details of the other resources <br>in the resource domain.                                                                                                                             |
| DMSAPI_GetFirstUniVarInfo            |     This procedure returns the details of the first variable <br>in the variable domain.                                                                                                                              |
| DMSAPI_GetFirstUniTagInfo            |     This procedure returns the details of the first tag <br>in the tag domain.                                                                                                                                        |
| DMSAPI_GetVarInfoByUniName           |     Converts a Freelance 800F address data item to <br>a variable name Transform Freelance address information into variable name                                                                                     |
| DMSAPI_GetFirstUniBasicCmpOfObjClass |     Requests the configuration information <br>for the first component of an object class. <br>Get configuration information for the first component of an object class                                                   |
| DMSAPI_GetNextUniBasicCmpOfObjClass  |     Requests the configuration information <br>for all other components of an object class.<br> Get configuration information for all remaining components of an object class                                             |
| DMSAPI_GetNextUniTagInfo             |     This procedure returns the details of all other tags in the tag domain.                                                                                                                                       |
| DMSAPI_ConnectByNo                   |     Establish connection to a DMS server                                                                                                                                                                          |
| DMSAPI_VLCreate                      |     Create variable list                                                                                                                                                                                          |
| DMSAPI_VLDelete                      |     Delete variable list                                                                                                                                                                                          |
| DMSAPI_VLAddReadVarByAddr            |     Add read variable                                                                                                                                                                                             |
| DMSAPI_VLAddWriteVarByAddr           |     Add write variable                                                                                                                                                                                            |
| DMSAPI_VLDelVar                      |     Delete variable from variable list                                                                                                                                                                            |
| DMSAPI_VLReadCycle                   |     Cyclical read of variable list                                                                                                                                                                                |
| DMSAPI_VLStopCycle                   |     Stop cyclical variable list                                                                                                                                                                                   |
| DMSAPI_VLRead                        |     One-time read of variable list                                                                                                                                                                                |
| DMSAPI_VLWrite                       |     One-time write to a variable list                                                                                                                                                                             |
| DMSAPI_GetVarLen                     |     Length required by a variable within a variable list                                                                                                                                                          |

__FB Protocol:__

Fieldbus protocols (Profibus, HART, and FF) are used for communication from OPC server to the field devices. At the time of creating this object it registers two callback functions with DMS. One is CyclicCallback for cyclic operations and the second one is ACyclicCallback for acyclic operations. Both the functions belong to this object.

Following are the tasks performed by this component:

- Reading configuration of the CBF project( Explained in section 5.1.1.1)
- Read and Write at the field bus.
- Cyclic operations ( Advise/Unadvise)
- Mapping of error numbers from Profibus or HART communication into OPC error numbers.
- Connecting and de-connecting of cyclic field bus variables.

__Read/Write OPC Items:__

Accessing OPC data are categorized two ways:
- Cyclic (Reads items cyclically)
- Acyclic (Reads/writes items non-cyclically)

__Cyclic Access:__

Cyclic read operations are performed by advising a group with item(s) by moving into COPCItemShelf object. If an item is already in the OPC Shelf the reference count of the item is increased and the update rate is adjusted if needed. Reading an item is based on the protocol information. Controller items are added to the controller’s variable list and reads cyclically. Fieldbus items are read directly via the DMS layer. The COPCItemShelf class has one container (CArray) object of COPCShelfEntry which handles the following data:

- Name of the Item.
- COPCValue object
- Advice state (Advised/Unadvised)
- Timestamp
- Protocol (To which Item is associated)
- Update rate (By which item will be updated)

__Acyclic Access__

The Acyclic read/write operation of OPC Items happens in two ways:

1. __Synchronous__: These operations are performed by starting a new thread and the main thread waits until it returns. The timeout is configured for 40 sec. Reading and Writing group(s) or item(s) will issue a new job to the internal Job List. If several items are there to read/write all related variable lists are started for reading/writing. Read/Write synchronously will be done asynchronously while the caller thread waits for a response.

2. __Asynchronous__: These operations are performed by starting a new thread but the client will not wait for the answer. It will be notified when the read/write is complete. Async Reading and Writing groups or items will issue a new Job to the internal Job List. . If several items are there to read/write all related variable lists are started for reading/writing. For every item, status is saved whether the read/write succeeded or not, this status is send to the client as well.


The reading/writing operations are implemented in the class CDALJob. It has two methods ExecuteSync and ExecuteASync which performs Sync and ASync read/write operations respectively. CDALJob class has one vector object for CDALProtocolBaseJob* which contains the protocol information for respective item. The CDALProtocolBaseJob object registers the read/write job with global object of CJobList with RegisterJob method, this method creates one CJobEntry object for each read/write job. The CJobList class contains one CJobEntry map object and one thread NotifyThread .This thread waits for the jab to be finished and process the results by calling JobFinished methos.The sequence of operations for reading/writing OPC Items are shown in sequence diagram section.

The classes involved in reading/writing OPC Items are as follows:

| Class Name	             | Description                                                                                              |
|:------------------------ | :------------------------------------------------------------------------------------------------------- |
| CDALBaseJob	             | Base class for CDALJob and CDALProtocolBaseJob|
| CDALJob	                 | It is a template class defined as template <class Req_T, class ProtJob_T> class CDALJob : public CDALBaseJob<br><br> this job represents a single OPC transaction (read, write and refresh(same as read))|
| CDALProtocolBaseJob	     | This object represents the part of a job/transaction for a specific protocol|
| CDALProtocolReadJob      | This class is derived from CDALProtocolBaseJob.|
| CDALProtocolWriteJob	   | This class is derived from CDALProtocolBaseJob.|
| DALWriteJob	             | typedef of CDALJob<WRITE_DATA, CDALProtocolWriteJob>|
| DALReadJob	             | typedef of CDALJob<READ _DATA, CDALProtocolReadJob>|
| COPCValue	               | Data Type for an OPC Item to support Interoperability|
| CDALProtocol_DMSONL      | The DMS protocol is used for communication from OPC server to the process stations.|
| CFBProtocol		           | Fieldbus protocols (Profibus, HART, and FF) are used for communication from OPC server to the field devices.|
| CJobList		             | Class to maintain list of jobs (reading/writing jobs)|
| CJobEntry		             | Maintains information about type of job (read/write) and protocol.|
| CDMSJob		               | Maintains the list of jobs (read/write) and is responsible for Starting the job.|
| CDMSItem		             | Maintains OPC Item Address (DMS_VAR_TYPE, DMS_OBJ_PATH, DMS_RES_NO)|
| COPCValueDMS		         | Data Type for an OPC Item to support Interoperability|
| CReadItem		             | acyclic ReadItem|
| CWriteItem		           | acyclic WriteItem|
| CVariableList		         | Base class for a variable list|
| CACyclicVariableList		 | Base class for acyclic variable list|
| CReadVariableList		     | a variable list for an acyclic read service|
| CWriteVariableList		   | a variable list for an acyclic write service|
| CController		           | Class representing a controller|
| READ_DATA		             | Maintains information about read item, e.g. Protocol, ItemID, access rights, value, timestamp etc etc.|
| WRITE_DATA		           | Maintains information about write item, e.g. Protocol, ItemID, access rights, value, timestamp etc etc.|
| NOTIFY_DATA		           | Used for Callback Notification.|

__Cyclic Read:__

Classes mentioned above are only for acyclic read and write operations. Cyclic Read will be performed by Advising items.

#### Classes/Structures

##### Class Diagram for OPC Server Object

![Class Diagram for OPC Server Object](/assets/images/freelance_opc_da_server/class_diaram_opc_server_object.png "Class Diagram for OPC Server Object")

##### Class Diagram for OPC Group Object

![Class Diagram for OPC Group Object](/assets/images/freelance_opc_da_server/class_diaram_opc_group_object.png "Class Diagram for OPC Group Object")

##### Class Diagram for Item Object

![Class Diagram for OPC Item Object](/assets/images/freelance_opc_da_server/class_diaram_opc_item_object-01.png "Class Diagram for OPC Item Object")

![Class Diagram for OPC Item Object](/assets/images/freelance_opc_da_server/class_diaram_opc_item_object-02.png "Class Diagram for OPC Item Object")

![Class Diagram for OPC Item Object](/assets/images/freelance_opc_da_server/class_diaram_opc_item_object-03.png "Class Diagram for OPC Item Object")

<div class="alert alert-info">
  <i class="fas fa-info-circle"></i> <strong>Note:</strong> COPCItemShelf is the friend class of COPCItemRoot
</div>

Methods of COPCItemRoot are shown in the following class diagrams:

![Class Diagram for COPCItemRoot](/assets/images/freelance_opc_da_server/class_diaram_copcitemroot.png "Class Diagram for COPCItemRoot")

##### Class Diagram for CConfiguration and Protocol classes

![Class Diagram for CConfiguration and Protocol classes](/assets/images/freelance_opc_da_server/class_diaram_cconfiguration_and_protocal_class-01.png "Class Diagram for CConfiguration and Protocol classes")

![Class Diagram for CConfiguration and Protocol classes](/assets/images/freelance_opc_da_server/class_diaram_cconfiguration_and_protocal_class-02.png "Class Diagram for CConfiguration and Protocol classes")

![Class Diagram for CConfiguration and Protocol classes](/assets/images/freelance_opc_da_server/class_diaram_cconfiguration_and_protocal_class-03.png "Class Diagram for CConfiguration and Protocol classes")

<div class="alert alert-info">
  <i class="fas fa-info-circle"></i> <strong>Note:</strong> Relation and working of the above classes are described in OPC Configuration Section
</div>

##### Class diagrams for Read/Write Operations


...................


#### Interface /Local Functions

#### Deployment View