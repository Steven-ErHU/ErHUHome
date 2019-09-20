VERSION 5.00
Begin VB.Form frmSavings 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Savings Account"
   ClientHeight    =   3915
   ClientLeft      =   1095
   ClientTop       =   1485
   ClientWidth     =   3150
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   8.25
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000008&
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   3915
   ScaleWidth      =   3150
   Begin VB.CommandButton cmdExit 
      Caption         =   "E&xit"
      Height          =   495
      Left            =   840
      TabIndex        =   9
      Top             =   3240
      Width           =   1215
   End
   Begin VB.CommandButton cmdCalculate 
      Caption         =   "&Calculate"
      Height          =   495
      Left            =   840
      TabIndex        =   8
      Top             =   2640
      Width           =   1215
   End
   Begin VB.TextBox txtFinal 
      Height          =   495
      Left            =   1560
      TabIndex        =   7
      Top             =   1920
      Width           =   1215
   End
   Begin VB.TextBox txtMonths 
      Height          =   495
      Left            =   1560
      TabIndex        =   6
      Top             =   1320
      Width           =   1215
   End
   Begin VB.TextBox txtInterest 
      Height          =   495
      Left            =   1560
      TabIndex        =   5
      Top             =   720
      Width           =   1215
   End
   Begin VB.TextBox txtDeposit 
      Height          =   495
      Left            =   1560
      TabIndex        =   4
      Top             =   120
      Width           =   1215
   End
   Begin VB.Label Label4 
      Caption         =   "Final Balance"
      Height          =   495
      Left            =   240
      TabIndex        =   3
      Top             =   1920
      Width           =   1215
   End
   Begin VB.Label Label3 
      Caption         =   "Number of Months"
      Height          =   495
      Left            =   240
      TabIndex        =   2
      Top             =   1320
      Width           =   1215
   End
   Begin VB.Label Label2 
      Caption         =   "Yearly Interest"
      Height          =   495
      Left            =   240
      TabIndex        =   1
      Top             =   720
      Width           =   1215
   End
   Begin VB.Label Label1 
      Caption         =   "Monthly Deposit"
      Height          =   495
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
End
Attribute VB_Name = "frmSavings"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim Deposit As Single
Dim Interest As Single
Dim Months As Single
Dim Final As Single

Private Sub cmdCalculate_Click()
Dim IntRate As Single
'Read values from text boxes
Deposit = Val(txtDeposit.Text)
Interest = Val(txtInterest.Text)
IntRate = Interest / 1200
Months = Val(txtMonths.Text)
'Compute final value and put in text box
Final = Deposit * ((1 + IntRate) ^ Months - 1) / IntRate
txtFinal.Text = Format(Final, "#####0.00")
End Sub

Private Sub cmdExit_Click()
End
End Sub




