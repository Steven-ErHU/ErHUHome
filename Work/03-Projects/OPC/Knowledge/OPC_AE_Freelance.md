# Freelance OPC AE Server

## Reference
Design Document For Freelance OPC AE Server

### Acronyms and Abbreviations

| Definition / Abbreviation      |        Explanation / Description                                     |
|:---------------------------    | :-----------------------------------------------------------------   |
| AE                             |        OPC Alarms and Events                                         |
| COM                            |        Component Object Model                                        |
| CBF                            |        Freelance 800F engineering tool Control Builder F             | 
| CVS                            |        Concurrent Versioning System                                  |
| DA                             |        Data Access                                                   |
| DCOM                           |        Distributed Component Object Model                            | 
| DCS                            |        Distributed Control System                                    |   
| DMS                            |        Digimatic Message Specification                               |
| FB                             |        Fieldbus                                                      |
| FBBFF                          |        Fieldbus Builder Foundation Fieldbus                          |        
| FF-Block                       |        Resource Block, transducer block function of an H1-device     |                 
| HSE                            |        High – Speed Ethernet                                         |
| LD                             |        Linking Device (FF – Linking Device)                          |
| OLE                            |        Object Linking and Embedding                                  |
| OPC                            |        OLE for Process Control                                       |
| SCADA                          |        Supervisory Control and Data Acquisition                      |  
| VB                             |        Visual Basic                                                      


## High Level Architecture

### Goals and System Objectives

OPC is primarily designed for accessing data from a networked server, __OPC interfaces__ can be used in many places within an application.

The main goal is to provide a standardized mechanism for the OPC clients to get the __Alarms & Events information__ from Freelance Controllers.

### Design Considerations

Alarm and event subsystems have been used to indicate areas of the process that require __immediate attention__. Areas of interest include (but are not limited to); safety limits of equipment, event detection, and abnormal situations. In addition to operators, other client applications may collect and record alarm and event information for later audit or correlation with other historical data.

Alarm and event engines today produce an added stream of information that must be distributed to users and software clients that are interested in this information. Currently most alarming/event systems use their own proprietary(专有的) interfaces for dissemination(传播) and collection of data. There is no capability to augment(增加) existing alarm solutions with other capabilities in a plug-n-play environment. This requires the developer to recreate the same infrastructure for their products as all other vendors have had to develop independently with no interoperability with any other systems.

In keeping with the desire to integrate data at all levels of a business, alarm information can be considered to be another type of data. This information is a valuable component of the information architecture outlined in the OPC Data specification.

### Design Approach

To support Alarms and Events in Freelance OPC Server the __Softing AE Toolkit v1.10__ is used. This handles the access of OPC AE clients with the OPC Server.

Event notification and handling of the message queue is done by the Freelance OPC Server to provide the toolkit with the appropriate alarm information the configuration of the alarms.

### Overview

OPC is a Published Industrial Standard for system Interconnectivity. The OPC stands for __OLE for Process Control__. It uses the Microsoft __COM and DCOM__ technology to enable the application to exchange data on one or more computers using __client/server__ architecture.

OPC defines a common set of interfaces. So applications retrieve data in exactly same format __regardless of the data source__. The use of OPC Server in Freelance is to interact with Third party clients. The __Softing AE toolkit__ which is integrated with __Freelance 2000 OPC Server__ enables the any third party OPC A&E clients to get the Alarms & Events information from controllers. __Gateway__ is the mediator between OPC and CBF. Freelance 2000 OPC Server uses __DMS__ (Digimatic Message Specification) to interact with controllers.


## System Architecture

### Block diagram

![Block diagram](/Work/03-Projects/OPC/Knowledge/assets/images/freelance_opc_trace_tool/opc_ae_block_diagram.png "Block diagram")

### Sub System Architecture

#### Logical View

![Logical View](/Work/03-Projects/OPC/Knowledge/assets/images/freelance_opc_trace_tool/opc_ae_logic_view.png "Logical View")

To support Alarms and Events in Freelance OPC Server the Softing AE Toolkit v1.10 is used. This handles the access of OPC AE clients with the OPC Server.

Event notification and handling of the message queue is done by the Freelance OPC Server to provide the toolkit with the appropriate alarm information the configuration of the alarms.

At present Freelance supports Alarms & Events __only for the Controller__. Support for __FieldBus protocol__ should be supported in the future but here an __acquisition layer is also implemented__ to support FieldBus Protocols (FF) in future.

__Softing OPC AE Toolkit v1.10__

To support Alarms and Events in Freelance OPC Server the Softing AE Toolkit v1.10 is used. This handles the access of OPC AE clients with the OPC Server. This toolkit has 3 main modules:
- SOCmn
- SOSrv
- SOAeS

__SOCmn__: This module implements the __general classes__ of the Toolkit. The classes can be divided into 2 groups:
1. __Auxiliary(辅助的) classes__: These are the classes implementing general objects such as strings and lists.
2. __Basic Classes__: These are the basic classes of the Toolkit which are elements of a tree structure。

__SOSrv__: This module implements the parts which are __identical__ for all Server Toolkits. This module is used by all
Server toolkits. The main functionalities are:
- __Entry Object of the Server Toolkits__: All Server toolkits have a central object by means of which the Server application has access to all the information of the Toolkit. The basis of this entry object is identical for all Server Toolkits.
- __COM basic classes__: All COM object implementations use these COM basic classes

__SOAeS__: This module implements all classes of the Toolkit which are required for an OPC Alarms & Event Server.


__OPC Alarms & Events__:

This section describes an overview of OPC A&E. The OPC Alarms and Events specification defines the following terms:

- __Alarm__ – An alarm is defined as an abnormal(反常的) condition.
- __Condition__ – The condition represents one alarm point that is available for a tag on a controller station. To identify which tag of the controller sends the alarm the alarm source (tag) is also provided in the alarm message.
- __Condition Class__ – The Condition Class is divided into __single condition class__ and __multi condition class__. A typical example for a multi condition class alarm could be a level alarm with the sub conditions High, Low, HighHigh, and LowLow. The typical example for a single condition class alarm would be a system alarm i.e. Connection lost.
- __Alarm Category__ – Categories are used for __grouping the alarms__ provided by a server. The definition of categories is server specific. The name of the category is provided in every event notification.
- __Alarm Attributes__ – Alarm attributes describe the alarm condition in more detail. According to the alarm category the attributes are defined for the alarm condition. Typical attributes are i.e. short text, long text, current value.
- __Alarm Messages__ – Alarm messages are texts to inform the user why the alarm appears. For freelance OPC Server A&E the alarm messages are __defined in the function blocks__ for the alarm points.

__Alarm Categories__

- __Level__ – Process alarms like Value HIGH, LOW, HIGHIGH, LOWLOW
- __RateOfChange__ – Alarms describing the speed on how a change appears with values like DH, DL, DHH, DLL
- __Deviation__ - Alarms describing the difference of the real value to the process values
- __Duration__ – Alarms where time limit exceeds
- __Discrete__ – State changes on function block i.e. from auto mode to manual mode
- __User__ – Alarms that could be defined by the user
- __Limit__ – alarms informing about limits i.e. task overload
- __System__ – system error messages
- __OPC Server__ – error messages of the OPC Server
- __Event Acknowledge (Tracking Event)__ – used if an alarm is acknowledged by the user


__Alarm Subscription – Overview__

During __start up of__ the OPC Server AE __an Alarm Callback__ is registered at the __DMSAPI__ with the method *DMSAPI_RegisterCltCB*. This call back function processes two service messages of *DMS_REC_SERVICE_TYPE* which are as follows:

- DMS_REC_CONN_TYPE (connection established or lost)
- DMS_REC_ALARMLIST_TYPE (Alarms and Event Notifications)

This Callback will inform the OPC Server AE about all changes on the alarm points of all configured controllers. When an alarm occurs this callback receives *DMS_REC_ALARMLIST_TYPE* notification, it creates an _CAlarmList_ object and copies the received data(Alarmlist data and connection handle). This _CAlarmList_ object will be added to _CAlarmQueue_ object _AlarmQueue_ which is created as global scope at the time of application started. This _CAlarmQueue_ class has one container object for _CCommonAlarmList_ which holds all the _CAlarmList_ objects. At the time of adding _CAlarmList_ objects it will fire an event for _ProcessAlarmListQueue_ which is started by the thread _AlarmListThread_ defined in _CAlarmQueue_ class. The alarm queue object is responsible for mapping with the configuration information (condition of alarm) of the alarm point. The _ProcessAlarmListQueue_ calls the _ActivateAlarmsInList_ of _CAlarmList_ object. This method get the connection data using connection handle by calling *DMSAPI_GetConnectionData* method. The station, tag and the condition data will be retrived here from the configuration object . Using this information the condition of the alarm is activated in the Softing Toolkit. The Toolkit sends an OPC event notification to an Alarm & Event Client. 

The sequence of actions is captured in the sequence diagram.

__Alarm Subscription – OnEventStruct__












