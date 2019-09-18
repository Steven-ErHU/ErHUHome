# Freelance OPC Server Traces, Tools & Others

## Reference

Design Document For Freelance OPC Server Traces, Tools & Others

## Definitions, Acronyms and Abbreviations

| Definition / Abbreviation | Explanation / Description                                  |
|:------------------------- |:----------------------------------------                   |
| AE                        | OPC Alarms and Events                                      | 
| COM                       | Component Object Model                                     |
| CBF                       | Freelance 800F engineering tool Control Builder F          |      
| CVS                       | Concurrent Versioning System                               |
| DA                        | Data Access                                                |
| DCOM                      | Distributed Component Object Model                         |
| DCS                       | Distributed Control System                                 |
| DMS                       | Digimatic Message Specification                            |
| FB                        | Fieldbus                                                   |
| FF-Block                  | Resource Block, transducer block function of an H1-device  |                  
| OLE                       | Object Linking and Embedding                               |
| OPC                       | OLE for Process Control                                    |
| SCADA                     | Supervisory Control and Data Acquisition                   |
| VB                        | Visual Basic                                               |    

## High Level Architecture

### Goals and System Objectives

Freelance OPC Server Traces & Tools is primarily designed to __collect trace information__ about the Freelance OPC __Server__ to help the developers to __diagnose__ the Freelance OPC Server related issues.

### Design Considerations

The Freelance OPC Server Traces & Tools are __add-on utilities__ to help diagnosing the Freelance OPC Server. The OPC Server Trace tool gets installed with the installation of Freelance Software.

### Design Approach

OPC Server Trace tool is a __standalone EXE application__ developed in __Visual Basic__. It uses OPC
Interfaces to retrieve certain information from the __OPC Server__. At the high level, it just contains one __Visual Basic Form__ and the __Keywords__ for Traces in the form of a __Tree Control__.

### Overview

#### Tracing Tool

- The Tracing Tool could be used to do initial debugging problems __on a customers' site__.
- It is possible to check the __configuration__ of the OPC Server.
- __Groups__ that are added to the server and __items__ in the groups could be checked as well.
- It is possible to __list__ all active items on the OPC Server.
- All information is dumped into __a text file__.
- To trace data even if the OPC Server is restarted, it is possible to save the trace keys in the registry.

The Tracing can be done in two ways:
- __Text File Tracing (Using KeywordTrace.exe)__
- __Terminal Tracing (Using OPSSRVD.dll)__

##### Text File Tracing

The tracing functionality is implemented in OPC Server at _CKeywordTrace_ class. This class contains one pointer to _CKeyword_ object. The _CKeyword_ class contains one container class object for itself as given below.

<details>
<summary>Object KeywordList CKeyword Class</summary>
<pre><code>

```CPP
    typedef CTypedPtrList<CPtrList, CKeyword*> KeywordList;
```
</code></pre>
</details>


This class objects holds all the keywods supported by OPC Server. The OPC Server supporetd keywords are defined in a macro KEYWORDS in the header file _trace.h_. Each keyword is an object of the structure _KEYWORD_MAP_ which is defined as below:

<details>
<summary>Struct KEYWORD_MAP</summary>
<pre><code>

```CPP
    typedef struct tagKEYWORD_INFO {
        unsigned int KeywordID;
        TCHAR KeywordName[KEYWORD_LEN];
        int ParentID;
    } KEYWORD_MAP;
```
</code></pre>
</details>

All the keyword data is mapped to the structure _SchluesselWort_ defined in the _cgen.h_. The structure is define
as below.

<details>
<summary>Struct SchluesselWort in cgen.h</summary>
<pre><code>

```CPP
typedef struct
{
    int Wert;
    int Menue;
    char const FAR *Name;
} SchluesselWort;
```
</code></pre>
</details>

The array of 85 keywords for above structure is defined in _cgwnt.d_ (digimat\common\cgen) file.

The functionality of the text file tracing and switching the keyword is implemented here and the same can be exposed to KeywordTrace.exe apllication through _ITrace_ interfce. This interface is implemented in _COPCServer_ class. The methods exposed by _ITrace_ interface are given below:

- get__NewEnum
- GotoKeyword
- WriteSettingsToRegistry
- STDMETHODCALLTYPE GetKeywordName
- EnableKeyword
- DisableKeyword
- IsKeywordEnabled
- HRESULT STDMETHODCALLTYPE DumpConfiguration
- HRESULT STDMETHODCALLTYPE DumpServers
- HRESULT STDMETHODCALLTYPE DumpGroups
- HRESULT STDMETHODCALLTYPE DumpItems
- HRESULT STDMETHODCALLTYPE DumpActiveItems
- HRESULT STDMETHODCALLTYPE get_TraceFilename
- HRESULT STDMETHODCALLTYPE put_TraceFilename
- HRESULT STDMETHODCALLTYPE get_TraceLevel
- HRESULT STDMETHODCALLTYPE put_TraceLevel
- HRESULT STDMETHODCALLTYPE get_TraceFileActive
- HRESULT STDMETHODCALLTYPE put_TraceFileActive
- HRESULT STDMETHODCALLTYPE get_TraceFileMaxSize
- HRESULT STDMETHODCALLTYPE put_TraceFileMaxSize
- HRESULT STDMETHODCALLTYPE get_TraceDebugActive
- HRESULT STDMETHODCALLTYPE put_TraceDebugActive
- HRESULT STDMETHODCALLTYPE get_TraceTelnetActive
- HRESULT STDMETHODCALLTYPE put_TraceTelnetActive

__KeyWord Options for Text file Tracing__

Following keywords are available for the Keyword tracing. They are organized into groups as give below:

- __Alarms & Events__ – Information about Alarm creation and updating. Keywords under this group is:

 - OPC_AE – To trace all Alarm related information and events.
 - OPC_DMSEvent – To trace DMS related information and events.
 - OPC_TKEvent – To trace all Softing Toolkit Events
 - OPC_TKInternal – To trace all Softing Toolkit internal information.

- __Common Functionality__ – Information about OPC server configuration and OPC Server shelf. Keywords under this group are:

 - OPC_Common - To trace common OPC Server information
 - OPC_Configuration – To trace OPC Configuration related information and events
 - OPC_Shelf – To trace OPC Shelf related information and events.

- __DAL__ – Information about Reading/Writing Items
 - DAL Notification
  - OPC_DALCyclicNotification – To trace DAL related Cyclic Callback notifications
  - OPC_DALReadNotification – To trace DAL Read Callback notifications
  - OPC_DALWriteNotification – To trace DAL Write Callback notifications.
 - OPC_DALCyclicRead – To trace DAL Cyclic Read related information and events
 - OPC_DALJob – To trace DAL Read/Write transactions.

- __DMS__ – Information about Reading/Writing on controller Items.
 - OPC_DMSACyclic – To trace DMS Acyclic read/write related information and events
 - OPC_DMSCommon – To trace common DMS transactions
 - OPC_DMSCyclicRead – To trace DMS Cyclic read related information and events
 
- __Fieldbus__ – Information about Reading/Writing on Fieldbus Items
 - OPC_FBACyclic – To trace FieldBus Acyclic read/write related information and events
 - OPC_FBCommon – To trace common FieldBus transactions
 - OPC_FBCyclicRead – To trace FieldBus cyclic read related information and events

- __Group Functionality__ – Operations and notifications on groups
 - OPC_AsyncNotification – To trace Call back notifications for Async operation.
 - OPC_Group – To trace Group operations’ information and events.

- __Item Functionality__ – Configuration changes on items
 - OPC_Item – To trace OPC Item related information and events

- __Data Access Automation Interfaces V1.0__ – Information when client supports only V1.0 interfaces
 - Group Object (Automation 1.0)
  - IOPCAsyncIODisp – To trace asynchronous OPC Read/Write operations using automation interface(IOPCAsyncIODisp)
  - IOPCGroupStateMgtDisp – To trace transactions to manage group properties using automation interface  (IOPCGroupStateMgtDisp)
  - IOPCItemMgtDisp – To trace transactions to manage item properties using automation interface( IOPCItemMgtDisp)
  - IOPCSyncIODisp – To trace synchronous OPC Read/Write operations using automation interface(IOPCSyncIODisp)

 - Item Object (Automation 1.0)
  - IOPCItemDisp – To trace transactions to access item properties using automation interface(IOPCItemDisp)

 - ServerObject (Automation 1.0)
  - IOPCBrowseServerAddressSpaceDisp – To trace transactions to access server address space data using automation interfaces (IOPCBrowseServerAddressSpaceDisp, IEnumString and IEnumVARIANT)
  - IOPCServerDisp – To trace transactions to access server object’s properties using automation interface(IOPCServerDisp)

- Data Access Custom Interfaces – Information on the Data Access specific interfaces
 - Client Interfaces
  - IAdviseSink – To trace cyclic operations for advised items
  - IOPCDataCallback – To trace callbacks to the client after finishing Read/Write jobs and when data changes for an adviced item.
  - IOPCShutdown – Not implemented

 - Group Object
  - IDataObject – To trace transactions through IDataObject interface
  - IEnumOPCItemAttributes – To trace accessing OPC Item attributes through interfaces IEnumOPCItemAttributes, IEnumString and IEnumVARIANT
  - IOPCAsyncIO – To trace asynchronous access of OPC Data through IOPCAsyncIO interface
  - IOPCAsyncIO2 – To trace asynchronous access of OPC Data through IOPCAsyncIO2 interface
  - IOPCGroupStateMgt – To trace transactions through IOPCGroupStateMgt interface
  - IOPCItemMgt – To trace transactions through IOPCItemMgt interface
  - IOPCSyncIO – To trace synchronous access of OPC Data through IOPCSyncIO interface

 - IConnectionPointContainer – To trace Advise and Unadvise methods in COPCGroupCust class

 - ServerObject

  - IOPCBrowseServerAddressSpace – To trace transactions to access server address space data using IOPCBrowseServerAddressSpace interface
  - IOPCCommon – To trace transactions using IOPCCommon interface
  - IOPCItemProperties – To trace transactions using IOPCItemProperties interface
  - IOPCServer – To trace transactions to access server object’s properties using IOPCServer interface

- Server Functionality – Information about Browsing, Item properties and the server state
 - OPC_Browsing – To trace browsing of OPC Items
 - OPC_CheckServer – Not Implemented
 - OPC_ItemProperties – To trace accessing OPC Item properties
 - OPC_Server – To trace OPC Server functionality

The user interface to enable/disable the Keywords for the Trace is shown below:

![The user interface.](/Work/03-Projects/OPC/Knowledge/assets/images/freelance_opc_trace_tool/the_user_interface-01.png "The user interface")

##### Terminal Trace Options








