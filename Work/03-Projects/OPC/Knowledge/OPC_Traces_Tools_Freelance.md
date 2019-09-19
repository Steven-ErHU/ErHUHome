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

    - __Item Object (Automation 1.0)__
        - IOPCItemDisp – To trace transactions to access item properties using automation interface(IOPCItemDisp)

    - __ServerObject (Automation 1.0)__
        - IOPCBrowseServerAddressSpaceDisp – To trace transactions to access server address space data using automation interfaces (IOPCBrowseServerAddressSpaceDisp, IEnumString and IEnumVARIANT)
        - IOPCServerDisp – To trace transactions to access server object’s properties using automation interface(IOPCServerDisp)

- __Data Access Custom Interfaces__ – Information on the Data Access specific interfaces
    - Client Interfaces
        - IAdviseSink – To trace cyclic operations for advised items
        - IOPCDataCallback – To trace callbacks to the client after finishing Read/Write jobs and when data changes for an adviced item.
        - IOPCShutdown – Not implemented

    - __Group Object__
        - IDataObject – To trace transactions through IDataObject interface
        - IEnumOPCItemAttributes – To trace accessing OPC Item attributes through interfaces IEnumOPCItemAttributes, IEnumString and IEnumVARIANT
        - IOPCAsyncIO – To trace asynchronous access of OPC Data through IOPCAsyncIO interface
        - IOPCAsyncIO2 – To trace asynchronous access of OPC Data through IOPCAsyncIO2 interface
        - IOPCGroupStateMgt – To trace transactions through IOPCGroupStateMgt interface
        - IOPCItemMgt – To trace transactions through IOPCItemMgt interface
        - IOPCSyncIO – To trace synchronous access of OPC Data through IOPCSyncIO interface

    - __IConnectionPointContainer__ – To trace Advise and Unadvise methods in COPCGroupCust class

    - __ServerObject__
        - IOPCBrowseServerAddressSpace – To trace transactions to access server address space data using IOPCBrowseServerAddressSpace interface
        - IOPCCommon – To trace transactions using IOPCCommon interface
        - IOPCItemProperties – To trace transactions using IOPCItemProperties interface
        - IOPCServer – To trace transactions to access server object’s properties using IOPCServer interface

- __Server Functionality__ – Information about Browsing, Item properties and the server state
    - OPC_Browsing – To trace browsing of OPC Items
    - OPC_CheckServer – Not Implemented
    - OPC_ItemProperties – To trace accessing OPC Item properties
    - OPC_Server – To trace OPC Server functionality

The user interface to enable/disable the Keywords for the Trace is shown below:

![The user interface.](/Work/03-Projects/OPC/Knowledge/assets/images/freelance_opc_trace_tool/the_user_interface-01.png "The user interface")

##### Terminal Trace Options

Tracing is also possible via a terminal. The ports for tracing are defined in the OPC Server directory of the Freelance OPC Server.

To find out which application used the port, use: _telnet localhost 866x_  
On command line, type:

    > telnet localhost 6660 for menu  
    > telnet localhost 7660 for OPC Server trace

To unlock the menu, use the password: _1106_  
Enable the telnet trace by using the _OPCSRVD_ menu 0.  
The Trace level must be set here: Debug=1, Information=2, Message = 3, Warning = 4, Error = 5, No Trace = 6

OPC Server keywords could be enabled via the menu.

The Terminal trace could be started using _OPCSRVD.dll_. The WinMain function of the OPC Server registers the following callback functions with the _OPCSRVD.dll_. By calling these functions Terminal tracing can be activated.

- RegisterConfDump(Dump_Configuration);
- RegisterSrvDump(Dump_Servers);
- RegisterGrpDump(Dump_Groups);
- RegisterItemDump(Dump_Items);
- RegisterActiveItemDump(Dump_ActiveItems);
- RegisterSetTraceLevel(SetTraceLevel);
- RegisterEnableFile(EnableFile);
- RegisterEnableDebugOutput(EnableDebugOutput);
- RegisterEnableTelnet(EnableTelnet);

If the flag _TraceTelnetActive_ is true the KeyTrace function will send the trace to the Terminal using *CGL_Duprintf* function.

__Trace Level:__

Any of the following Trace Level can be set for the Tracing:

- No Trace : No trace will be recorded in trace
- Error : All error traces will be recorded
- Warning : All warnings traces and keywords for which switch is on (*SW_EIN*)for errors will be recorded (No message, Information and debug traces will be recorded )
- Message : Keywords for which switch is on(*SW_EIN*) for Errors ,Warnings and Messages will be recorded (No Information and debug traces will be recorded)
- Information : Keywords for which switch is on(*SW_EIN*) for Errors ,Warnings, Messages and Information will be recorded(No debug traces will be recorded)
- Debug : All traces will be recorded if the keyword switch (*SW_EIN*) is on.

There are three macro functions used for tracing:

- _KEY_TRACE_ : This function will call _KeyTrace_ function according to above trace level set
- _DUMP_TRACE_ : This function will call _KeyTrace_ if level is set other than No Trace. This trace will recorded as Debug trace. This function will be used at the time of dumping connections, configuration, groups, items and active items.
- *FORCE_TRACE*: This function will call *KeyTrace* if level is set other than No Trace. This trace will
recorded as Information trace.
- *TRACE_ALWAYS* : This function will call *KeyTrace* regardless of level and trace will be recoded as actual
level sent with caller.


### DCOM Settings
__Note__: This configuration is obsolete in the newer versions where the OPC Server Tunnel is available.

- For the user account that runs the OPC Server you must configure for the launch and access permissions allow access.
- If the remote PC is assigned to a different domain or a different workgroup, then Everyone should be entered under User with allow access. This should avoid problems with user authentification.
- The DCOM settings must be done for both OPC Servers , Data access and Alarms & Events. Both have and entry in the DCOM Configuration.

### OPC Server Tunnel
- The OPC Server Tunnel is used to __avoid DCOM problems__ with different users and workgroups when the OPC Server is running on a remote machine.
- The OPC Server Tunnel uses a __TCP/IP connection__ for connecting to the OPC Server. This avoids user authentication problems.

More detailed information about OPC Server Tunnel is available in *OPCTunnel_TechnDescr_en.pdf* in the following Proman path:
*\Freelance 800F\Documents\Technical Bulletins\Technical Descriptions\OPCTunnel_TechnDescr_en.pdf*

### Registry Settings

#### Registering the OPC Server with Resource ID

The Registration of the OPC Server with __resource ID__ is needed to make the __OPC Server__ available for the __OPC clients__. We can do this with two ways as explained below.

- __Using Command Prompt__  
    - For registering Freelance OPC server manually use a command prompt in Freelance install directory and type: *opcsrv.exe /&#60;ResID&#62; /regserver*
    - To unregister Freelance OPC Server type: *opcsrv.exe /&#60;ResID&#62; /unregserver*

- __Using Configure Window__  
    - In this method we can do the same with configure window by selecting Freelance OPC-Server Options tab.
    - Here we can Register and Unregister with Add and Remove buttons respectively.

    ![Configure Tool.](/Work/03-Projects/OPC/Knowledge/assets/images/freelance_opc_trace_tool/configure_tool-01.png "Configure Tool")

    - During registering for both OPC Servers Data Access and Alarms & Events __AppId__ and __ClassID__ of the server is added.
    - The ClassID is depending on the OPC Servers resource ID.  
      For Data Access it is {F822DE8F-207C-11D1-BAD4-006097385xxx}.  
      The xxx indicates the Resource Id of the OPC Server.

    - The AppID is __Freelance2000OPCServer__ for Data Access and __Freelance2000OPCAEServer__ for Alarms&Events

#### Registry settings for the OPC Server
- Registry keys for the OPC Server could be found in:  
HKEY_LOCAL_MACHINE\Software\Hartmann & Braun\Freelance\OPCServer
    
All information about OPC server configuration could be found here. Especially switches and keys for tracing and debugging the OPC Server. The other significant OPC Server data available here are given below

- MaxVarlist: Maximum Number of Variable List for Controller Connection
- OptimisticDataTypeConversion: Switches on OPC Compliance Mode for Data Type Conversion
- PPAConnectivity: Switching on this will set the OPC Server state to “Communication Failure” if the OPC Server is not able to connect to the controller
- RedToggleQualityGood : Used for Redundancy toggle. If set the timeout time could be set with RedToggleTimeOut
- RedToggleTimeOut : Number of cycles to wait before a redundancy toggle is performed.
- TaskBarEntry : A Taskbar entry is created for the OPC Server
- TraceTelnetActive: Activates Tracing for OPC Server
- UpdateCycleTime : Minimum Cycle Time for updating OPC Server items
- __AeDumpConfigurationTrace : not used__
- __AeObjectTrace : not used__
- ConfigureRemoteOPC : OPC Server is running on a remote machine
- ConfigureRemoteTrd : Trend Server is running on a remote machine
- DomainPath : Freelance OPC Server install directory.

### Performance Monitoring

The Performance Monitoring for the OPC Server counters with PerfMon is implemented in the class _CPerformanceData_. This class has one thread function _PerformanceThread_ which is responsible to collecting the performance data every 1000ms.The _WinMain_ method of the OPC Server starts this thread at the beginning of application by calling _Start_ method of _CPerformanceData_ class. This thread stops when _Winmain_ calls _Stop_ method at end.

The _Winmain_ function registers the function _GetPerformanceData_, of _CPerformanceData_ class,
with __DGMOPCS__ module with the following call.

- DGM_OpcInitEx(PerformanceData.GetPerformanceData);

The __PerfMon__ tool will call this callback function to get the performance data. The Class _CPerformanceData_ contains one member of the structure _OPC_PERFCOUNTER_ which contains the OPC Server counters. The description for _OPC_PERFCOUNTER_ is provided below.

<details>
<summary>Struct SchluesselWort in cgen.h</summary>
<pre><code>

```CPP
typedef struct
{
    unsigned long ItemNo; /* Configured items: Number of configured items */
    unsigned long EventNo;/* Configured events: Number of configured event points */
    unsigned long ConnNo;/* Client connections: Number of OPC Data Access client connections */
    unsigned long GroupNo; /* Groups: Number of OPC Groups */
    unsigned long ActiveItemNo; /* Active items: Number of active OPC items */
    unsigned long AddFailBandwidth; /* AddItem failures (Bandwidth) */
    unsigned long AddFailInteract; /* AddItem failures (Interaction) */
    unsigned long AddFailConfi; /* AddItem failures (configuration) */
    unsigned long PendingJobs; /* Pending acyclic jobs */
    unsigned long AcyclicReadErrors; /* Acyclic read errors */
    unsigned long AcyclicWriteErrors; /* Acyclic write errors */
    double ChangesPerSecond; /* Changed cyclic items/second */
    double AcyclicReadsPerSecond;/* Acyclic reads/second */
    double WritesPerSecond; /* Writes/second */
    unsigned short StationNo[SUPPORTED_STATIONS]; /* Station No. for Station n */
    unsigned short StationBandwidth[SUPPORTED_STATIONS]; /* % cyclic bandwidth in use for station n */
} OPC_PERFCOUNTER;
```
</code></pre>
</details>


### Trend Server

__Freelance 2000 Trend Server is created by renaming the OPC Server executable to trnsrv.exe__. During registration the OPC Server specific Component Categories will be removed from the registry (OPC Data Access Servers Version 1.0 and 2.0). These changes for the trend server are done in _winMain_ function in _OPCsrv.cpp_. This makes it possible to run the OPC Server, but no 3rd party client is able to browse it. The trend server is configured in __Control Builder F__ as __separate gateway__. To use the trend server add a __trend display__ in DigiVis and add variables that should be read via the trend server. Use the option variable acquisition and add the OPC Name of the variables and we can adjust the sample time if needed. __We need to download all changes to the DigiVis station and to the trend server.__

### AE Map

The AE map is a mapping component for the alarms and events between the Freelance OPC Server and the Tag importer of Process Portal B. All conditions and sub conditions of a Freelance OPC Server could be found here. A mapping for Priority and severity is done here. The information is updated during the code generation of the OPC Server in Control Builder F. 


## System Architecture

### Block diagram

![Block diagram.](/Work/03-Projects/OPC/Knowledge/assets/images/freelance_opc_trace_tool/block_diagram-01.png "Block diagram")

### Classes/Structures

#### Class Diagram for OPC Trace Tool

TODO

### Process View

__Text File Traces__: The series of actions while using Key Word Traces are captures in the sequence diagram given below:

![Process View.](/Work/03-Projects/OPC/Knowledge/assets/images/freelance_opc_trace_tool/sequence_diagram_text_file.png "Process View")

__Terminal Traces__: The series of actions while using Tel Net Traces are captures in the sequence diagram given below:

![Process View.](/Work/03-Projects/OPC/Knowledge/assets/images/freelance_opc_trace_tool/sequence_diagram_terminal.png "Process View")

__Performance Monitoring__: The series of actions while monitoring performance of OPC counters using PerfMon tool of Windows are captures in the sequence diagram given below:

![Process View.](/Work/03-Projects/OPC/Knowledge/assets/images/freelance_opc_trace_tool/sequence_diagram_perf_mon.png "Process View")



#### Deployment view

![Deployment View.](/Work/03-Projects/OPC/Knowledge/assets/images/freelance_opc_trace_tool/deployment_view.png "Deployment View")














