VERSION 5.00
Begin VB.Form frmFlight 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Flight Planner"
   ClientHeight    =   3465
   ClientLeft      =   1140
   ClientTop       =   1515
   ClientWidth     =   6150
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   3465
   ScaleWidth      =   6150
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdExit 
      Caption         =   "E&xit"
      Height          =   495
      Left            =   3240
      TabIndex        =   7
      Top             =   2760
      Width           =   1215
   End
   Begin VB.CommandButton cmdAssign 
      Caption         =   "&Assign"
      Height          =   495
      Left            =   1680
      TabIndex        =   6
      Top             =   2760
      Width           =   1215
   End
   Begin VB.ComboBox cboMeal 
      Height          =   1740
      Left            =   4200
      Style           =   1  'Simple Combo
      TabIndex        =   2
      Top             =   600
      Width           =   1815
   End
   Begin VB.ComboBox cboSeat 
      Height          =   315
      Left            =   2280
      Style           =   2  'Dropdown List
      TabIndex        =   1
      Top             =   600
      Width           =   1815
   End
   Begin VB.ListBox lstCities 
      Height          =   2010
      Left            =   120
      Sorted          =   -1  'True
      TabIndex        =   0
      Top             =   600
      Width           =   2055
   End
   Begin VB.Label Label3 
      Caption         =   "Meal Preference"
      Height          =   375
      Left            =   4200
      TabIndex        =   5
      Top             =   120
      Width           =   1215
   End
   Begin VB.Label Label2 
      Caption         =   "Seat Location"
      Height          =   375
      Left            =   2280
      TabIndex        =   4
      Top             =   120
      Width           =   1215
   End
   Begin VB.Label Label1 
      Caption         =   "Destination City"
      Height          =   375
      Left            =   120
      TabIndex        =   3
      Top             =   120
      Width           =   1215
   End
End
Attribute VB_Name = "frmFlight"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdAssign_Click()
'Build message box that gives your assignment
Dim Message As String
Message = "Destination: " + lstCities.Text + vbCr
Message = Message + "Seat Location: " + cboSeat.Text + vbCr
Message = Message + "Meal: " + cboMeal.Text + vbCr
MsgBox Message, vbOKOnly + vbInformation, "Your Assignment"
End Sub

Private Sub cmdExit_Click()
End
End Sub

Private Sub Form_Load()
'Add city names to list box
lstCities.Clear
lstCities.AddItem "San Diego"
lstCities.AddItem "Los Angeles"
lstCities.AddItem "Orange County"
lstCities.AddItem "Ontario"
lstCities.AddItem "Bakersfield"
lstCities.AddItem "Oakland"
lstCities.AddItem "Sacramento"
lstCities.AddItem "San Jose"
lstCities.AddItem "San Francisco"
lstCities.AddItem "Eureka"
lstCities.AddItem "Eugene"
lstCities.AddItem "Portland"
lstCities.AddItem "Spokane"
lstCities.AddItem "Seattle"
lstCities.ListIndex = 0

'Add seat types to first combo box
cboSeat.AddItem "Aisle"
cboSeat.AddItem "Middle"
cboSeat.AddItem "Window"
cboSeat.ListIndex = 0

'Add meal types to second combo box
cboMeal.AddItem "Chicken"
cboMeal.AddItem "Mystery Meat"
cboMeal.AddItem "Kosher"
cboMeal.AddItem "Vegetarian"
cboMeal.AddItem "Fruit Plate"
cboMeal.Text = "No Preference"
End Sub


