VERSION 5.00
Begin VB.Form frmPizza 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Pizza Order"
   ClientHeight    =   3510
   ClientLeft      =   1140
   ClientTop       =   1515
   ClientWidth     =   5445
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   3510
   ScaleWidth      =   5445
   StartUpPosition =   2  'CenterScreen
   Begin VB.OptionButton optWhere 
      Caption         =   "Take Out"
      Height          =   495
      Index           =   1
      Left            =   3600
      TabIndex        =   17
      Top             =   2040
      Width           =   1215
   End
   Begin VB.OptionButton optWhere 
      Caption         =   "Eat In"
      Height          =   495
      Index           =   0
      Left            =   2160
      TabIndex        =   16
      Top             =   2040
      Value           =   -1  'True
      Width           =   1215
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "E&xit"
      Height          =   495
      Left            =   3000
      TabIndex        =   15
      Top             =   2760
      Width           =   1215
   End
   Begin VB.CommandButton cmdBuild 
      Caption         =   "&Build Pizza"
      Height          =   495
      Left            =   1200
      TabIndex        =   14
      Top             =   2760
      Width           =   1215
   End
   Begin VB.Frame Frame3 
      Caption         =   "Toppings"
      Height          =   1695
      Left            =   2040
      TabIndex        =   7
      Top             =   120
      Width           =   3255
      Begin VB.CheckBox chkTop 
         Caption         =   "Tomatoes"
         Height          =   255
         Index           =   5
         Left            =   1680
         TabIndex        =   13
         Top             =   1200
         Width           =   1335
      End
      Begin VB.CheckBox chkTop 
         Caption         =   "Green Peppers"
         Height          =   255
         Index           =   4
         Left            =   1680
         TabIndex        =   12
         Top             =   840
         Width           =   1455
      End
      Begin VB.CheckBox chkTop 
         Caption         =   "Onions"
         Height          =   375
         Index           =   3
         Left            =   1680
         TabIndex        =   11
         Top             =   360
         Width           =   1335
      End
      Begin VB.CheckBox chkTop 
         Caption         =   "Black Olives"
         Height          =   255
         Index           =   2
         Left            =   240
         TabIndex        =   10
         Top             =   1200
         Width           =   1215
      End
      Begin VB.CheckBox chkTop 
         Caption         =   "Mushrooms"
         Height          =   255
         Index           =   1
         Left            =   240
         TabIndex        =   9
         Top             =   840
         Width           =   1335
      End
      Begin VB.CheckBox chkTop 
         Caption         =   "Extra Cheese"
         Height          =   375
         Index           =   0
         Left            =   240
         TabIndex        =   8
         Top             =   360
         Width           =   1455
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "Crust Type"
      Height          =   975
      Left            =   120
      TabIndex        =   1
      Top             =   1680
      Width           =   1815
      Begin VB.OptionButton optCrust 
         Caption         =   "Thick Crust"
         Height          =   192
         Index           =   1
         Left            =   240
         TabIndex        =   6
         Top             =   600
         Width           =   1212
      End
      Begin VB.OptionButton optCrust 
         Caption         =   "Thin Crust"
         Height          =   255
         Index           =   0
         Left            =   240
         TabIndex        =   5
         Top             =   240
         Value           =   -1  'True
         Width           =   1095
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Size"
      Height          =   1455
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1815
      Begin VB.OptionButton optSize 
         Caption         =   "Large"
         Height          =   255
         Index           =   2
         Left            =   240
         TabIndex        =   4
         Top             =   960
         Width           =   1335
      End
      Begin VB.OptionButton optSize 
         Caption         =   "Medium"
         Height          =   255
         Index           =   1
         Left            =   240
         TabIndex        =   3
         Top             =   600
         Width           =   1335
      End
      Begin VB.OptionButton optSize 
         Caption         =   "Small"
         Height          =   255
         Index           =   0
         Left            =   240
         TabIndex        =   2
         Top             =   240
         Value           =   -1  'True
         Width           =   1335
      End
   End
End
Attribute VB_Name = "frmPizza"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim PizzaSize As String
Dim PizzaCrust As String
Dim PizzaWhere As String

Private Sub cmdBuild_Click()
'This procedure builds a message box that displays your pizza type
Dim Message As String
Dim I As Integer
Message = PizzaWhere + vbCr
Message = Message + PizzaSize + " Pizza" + vbCr
Message = Message + PizzaCrust + vbCr
For I = 0 To 5
  If chkTop(I).Value = vbChecked Then Message = Message + chkTop(I).Caption + vbCr
Next I
MsgBox Message, vbOKOnly, "Your Pizza"
End Sub

Private Sub cmdExit_Click()
End
End Sub



Private Sub Form_Load()
'Initialize pizza parameters
PizzaSize = "Small"
PizzaCrust = "Thin Crust"
PizzaWhere = "Eat In"
End Sub


Private Sub optCrust_Click(Index As Integer)
'Read crust type
PizzaCrust = optCrust(Index).Caption
End Sub

Private Sub optSize_Click(Index As Integer)
'Read pizza size
PizzaSize = optSize(Index).Caption
End Sub


Private Sub optWhere_Click(Index As Integer)
'Read pizza eating location
PizzaWhere = optWhere(Index).Caption
End Sub


