VERSION 5.00
Begin VB.Form frmTemp 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Temperature Conversion"
   ClientHeight    =   3480
   ClientLeft      =   1470
   ClientTop       =   1515
   ClientWidth     =   4815
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   3480
   ScaleWidth      =   4815
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdExit 
      Cancel          =   -1  'True
      Caption         =   "E&xit"
      Height          =   495
      Left            =   3360
      TabIndex        =   5
      Top             =   2760
      Width           =   1215
   End
   Begin VB.VScrollBar vsbTemp 
      Height          =   2895
      LargeChange     =   10
      Left            =   2280
      Max             =   -60
      Min             =   120
      TabIndex        =   0
      Top             =   240
      Value           =   32
      Width           =   255
   End
   Begin VB.Label lblTempC 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Left            =   3360
      TabIndex        =   4
      Top             =   1320
      Width           =   255
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      Caption         =   "Celsius"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   2880
      TabIndex        =   3
      Top             =   960
      Width           =   1215
   End
   Begin VB.Label lblTempF 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "32"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Left            =   1110
      TabIndex        =   2
      Top             =   1320
      Width           =   435
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "Fahrenheit"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   720
      TabIndex        =   1
      Top             =   960
      Width           =   1215
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00FFFFFF&
      BackStyle       =   1  'Opaque
      FillColor       =   &H000000FF&
      FillStyle       =   7  'Diagonal Cross
      Height          =   3135
      Left            =   2040
      Shape           =   4  'Rounded Rectangle
      Top             =   120
      Width           =   735
   End
End
Attribute VB_Name = "frmTemp"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim TempF As Integer
Dim TempC As Integer

Private Sub cmdExit_Click()
End
End Sub

Private Sub vsbTemp_Change()
'Read F and convert to C
TempF = vsbTemp.Value
lblTempF.Caption = Str(TempF)
TempC = CInt((TempF - 32) * 5 / 9)
lblTempC.Caption = Str(TempC)
End Sub


Private Sub vsbTemp_Scroll()
'Read F and convert to C
TempF = vsbTemp.Value
lblTempF.Caption = Str(TempF)
TempC = CInt((TempF - 32) * 5 / 9)
lblTempC.Caption = Str(TempC)
End Sub


