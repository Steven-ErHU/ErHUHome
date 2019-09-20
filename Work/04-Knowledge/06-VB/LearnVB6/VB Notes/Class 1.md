# Learn Visual Basic 6

## Introduction to the Visual Basic Environment

### Preview

In this first class, we will do a quick overview of how to build an application in Visual Basic.  You’ll learn a new vocabulary, a new approach to programming, and ways to move around in the Visual Basic environment.  You will leave having written your first Visual Basic program.

### Course Objectives

- Understand the benefits of using Microsoft Visual Basic 6 as an application tool
- Understand the Visual Basic event-driven programming concepts, terminology, and available tools
- Learn the fundamentals of designing, implementing, and distributing a Visual Basic application
- Learn to use the Visual Basic toolbox 
- Learn to modify object properties
- Learn object methods
- Use the menu design window
- Understand proper debugging and error-handling procedures
- Gain a basic understanding of database access and management using databound controls
- Obtain an introduction to ActiveX controls and the Windows Application Programming Interface (API)


### What is Visual Basic?

- Visual Basic is a tool that allows you to develop Windows (Graphic User Interface - GUI) applications.  The applications have a familiar appearance to the user.  As you develop as a Visual Basic programmer, you will begin to look at Windows applications in a different light. You will recognize and understand how various elements of Word, Excel, Access and other applications work.  You will develop a new vocabulary to describe the elements of Windows applications.
	
- Visual Basic is **event-driven**, meaning code remains idle(空闲的) until called upon to respond to some event (button pressing, menu selection, ...).  Visual Basic is governed by an event processor.  Nothing happens until an event is detected.  Once an event is detected, the code corresponding to that event (event procedure) is executed.  Program control is then returned to the event processor.

![event-driven](/Work/04-Knowledge/06-VB/LearnVB6/assets/vb_event_driven.PNG "event-driven")

All Windows applications are event-driven.  For example, nothing happens in Word until you click on a button, select a menu option, or type some text.  Each of these actions is an event. 

- The event-driven nature of Visual Basic makes it very easy to work with.  As you develop a Visual Basic application, __event procedures can be built and tested individually__, saving development time.  And, often event procedures are similar in their coding, allowing re-use (and lots of copy and paste).

__Some Features of Visual Basic__:
- Full set of controls - you 'draw' the application
- Lots of icons and pictures for your use
- Response to mouse and keyboard actions
- Clipboard and printer access
- Full array of mathematical, string handling, and graphics functions
- Can handle fixed and dynamic variable and control arrays
- Sequential and random access file support
- Useful debugger and error-handling facilities
- Powerful database access tools
- ActiveX support
- Package & Deployment Wizard makes distributing your applications simple

### Visual Basic 6 versus Other Versions of Visual Basic

- The original Visual Basic for DOS and Visual Basic For Windows were introduced in 1991.
- Visual Basic 3 (a vast improvement over previous versions) was released in 1993.
- Visual Basic 4 released in late 1995 (added 32 bit application support).
- Visual Basic 5 released in late 1996.  New environment, supported creation of ActiveX controls, deleted 16 bit application support.
- And, now Visual Basic 6 - some identified new features of Visual Basic 6:
    - Faster compiler
    - New ActiveX data control object
    - Allows database integration with wide variety of applications
    - New data report designer
    - New Package & Deployment Wizard
    - Additional internet capabilites
- Applications built using Visual Basic 6 will run with Windows 95, Windows 98, Windows 2000, or Windows NT.

### Structure of a Visual Basic Application

Project (.VBP, .MAK)
![Structure of a Visual Basic Application](/Work/04-Knowledge/06-VB/LearnVB6/assets/Structure_of_a_Visual_Basic_Application.PNG "Structure of a Visual Basic Application")

#### Application (Project) is made up of:

- __Forms__ - Windows that you create for user interface
- __Controls__ - Graphical features drawn on forms to allow user interaction (text boxes, labels, scroll bars, command buttons, etc.) (Forms and Controls are objects.)
- __Properties__ - Every characteristic of a form or control is specified by a property.  Example properties include names, captions, size,  color, position, and contents.  Visual Basic applies default properties.  You can change properties at design time or run time.
- __Methods__ - Built-in procedure that can be invoked to impart some action to a particular object.
- __Event Procedures__ - Code related to some object.  This is the code that is executed when a certain event occurs.
- __General Procedures__ - Code not related to objects.  This code must be invoked by the application.
- __Modules__ - Collection of general procedures, variable declarations, and constant definitions used by application. 

### Steps in Developing Application

- The Visual Basic development environment makes building an application a straightforward process.  There are three primary steps involved in building a Visual Basic application: 
    1. Draw the user interface by placing controls on the form
    2. Assign properties to controls
    3. Attach code to control events (and perhaps write other procedures)
    These same steps are followed whether you are building a very simple application or one involving many controls and many lines of code.

- The event-driven nature of Visual Basic allows you to build your application in stages and test it at each stage.  You can build one procedure, or part of a procedure, at a time and try it until it works as desired.  This minimizes errors and gives you, the programmer, confidence as your application takes shape.  
- As you progress in your programming skills, always remember to take this sequential approach to building a Visual Basic application.  Build a little, test a little, modify a little and test again.  You’ll quickly have a completed application.  This ability to quickly build something and try it makes working with Visual Basic fun – not a quality found in some programming environments!  Now, we’ll start Visual Basic and look at each step in the application development process.

### Starting Visual Basic

- We assume you have Visual Basic 6 installed and operational on your computer.  If you don’t, you need to do this first.  To start Visual Basic:
    - Click on the Start button on the Windows task bar.
    - Select Programs, then Microsoft Visual Basic 6
    - Click on Visual Basic 6 
    (Some of the headings given here may differ slightly on your computer, but you should have no trouble finding the correct ones.)  

- Visual Basic will start and this dialog box appears:

![Starting Visual Basic](/Work/04-Knowledge/06-VB/LearnVB6/assets/vb_new_project.PNG "Starting Visual Basic")

For now, just click Open – we are starting a new project.  Later, once you have saved some projects, they can be opened using the Existing and Recent tabs.  The Visual Basic development environment will start.


### Drawing the User Interface and Setting Properties

Visual Basic operates in three modes.

- __Design mode__ - used to build application
- __Run mode__ - used to run the application
- __Break mode__ - application halted and debugger is available

We focus here on the design mode.

- Six windows appear when you start Visual Basic.  Each window can be viewed (made visible) by selecting menu options, depressing function keys or using the toolbar.  Use the method you feel most comfortable with.

    - The __Main Window__ consists of the title bar, menu bar, and toolbar.  The title bar indicates the project name, the current Visual Basic operating mode, and the current form.  The menu bar has drop-down menus from which you control the operation of the Visual Basic environment.  The toolbar has buttons that provide shortcuts to some of the menu options.  The main window also shows the location of the current form relative to the upper left corner of the screen (measured in twips) and the width and length of the current form.  Of particular interest is the Help menu item.  The Visual Basic on-line help system is invaluable as you build applications.  Become accustomed with its use.  Usually just pressing &#60F1&#62 can get you the help you need.

    ![design mode interface](/Work/04-Knowledge/06-VB/LearnVB6/assets/vb_tool_interface.PNG "design mode interface")

    - The __Form Window__ is central to developing Visual Basic applications.  It is where you draw your application.
    
    ![Form Window](/Work/04-Knowledge/06-VB/LearnVB6/assets/vb_form1.PNG "Form Window")

    - The __Toolbox__ is the selection menu for controls used in your application.  Help with any control is available by clicking the control and pressing &#60F1&#62.

    ![ToolBox](/Work/04-Knowledge/06-VB/LearnVB6/assets/vb_tool_bar.PNG "ToolBox")

    - The __Properties Window__ is used to establish initial property values for objects (controls).  The drop-down box at the top of the window lists all objects in the current form.  Two views are available:  Alphabetic and Categorized.  Under this box are the available properties for the currently selected object.  Help with any property can be obtained by highlighting the property of interest and pressing &#60F1&#62. 

    ![Property Form](/Work/04-Knowledge/06-VB/LearnVB6/assets/property_form.PNG "Property Form")

    - The Form __Layout Window__ shows where (upon program execution) your form will be displayed relative to your monitor’s screen:

    ![Layout Window](/Work/04-Knowledge/06-VB/LearnVB6/assets/layout_window.PNG "Layout Window")

    - The __Project Window__ displays a list of all forms and modules making up your application.  You can also obtain a view of the Form or Code windows (window containing the actual Basic coding) from the Project window.

    ![Project Window](/Work/04-Knowledge/06-VB/LearnVB6/assets/project_window.PNG "Project Window")

- As mentioned, the user interface is 'drawn' in the form window.  There are two ways to place controls on a form:
    1. Double-click the tool in the toolbox and it is created with a default size on the form.  You can then move it or resize it.
    2. Click the tool in the toolbox, then move the mouse pointer to the form window.  The cursor changes to a crosshair.  Place the crosshair at the upper left corner of where you want the control to be, press the left mouse button and hold it down while dragging the cursor toward the lower right corner.  When you release the mouse button, the control is drawn.
	
- To move a control you have drawn, click the object in the form window and drag it to the new location.  Release the mouse button.

- To resize a control, click the object so that it is select and sizing handles appear.  Use these handles to resize the object.

![Move and Resize Control](/Work/04-Knowledge/06-VB/LearnVB6/assets/control_move_resize.PNG "Move and Resize Control")










