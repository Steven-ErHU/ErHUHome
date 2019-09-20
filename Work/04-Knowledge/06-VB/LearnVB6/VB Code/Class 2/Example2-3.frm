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
   Begin VB.CommandButton cmdClear 
      Caption         =   "Clear &Boxes"
      Height          =   495
      Left            =   1680
      TabIndex        =   10
      Top             =   2520
      Width           =   1215
   End
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
      Left            =   240
      TabIndex        =   8
      Top             =   2520
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
Const vbKeyDecPt = 46

Private Sub cmdCalculate_Click()
Dim IntRate As Single
Dim IntNew As Single
Dim Fcn As Single, FcnD As Single
'Read the four text boxes
Deposit = Val(txtDeposit.Text)
Interest = Val(txtInterest.Text)
IntRate = Interest / 1200
Months = Val(txtMonths.Text)
Final = Val(txtFinal.Text)
'Determine which box is blank
'Compute that missing value and put in text box
If Trim(txtDeposit.Text) = "" Then
'Deposit missing
  Deposit = Final / (((1 + IntRate) ^ Months - 1) / IntRate)
  txtDeposit.Text = Format(Deposit, "#####0.00")
ElseIf Trim(txtInterest.Text) = "" Then
'Interest missing - requires iterative solution
  IntNew = (Final / (0.5 * Months * Deposit) - 1) / Months
  Do
    IntRate = IntNew
    Fcn = (1 + IntRate) ^ Months - Final * IntRate / Deposit - 1
    FcnD = Months * (1 + IntRate) ^ (Months - 1) - Final / Deposit
    IntNew = IntRate - Fcn / FcnD
  Loop Until Abs(IntNew - IntRate) < 0.00001 / 12
  Interest = IntNew * 1200
  txtInterest.Text = Format(Interest, "##0.00")
ElseIf Trim(txtMonths.Text) = "" Then
'Months missing
  Months = Log(Final * IntRate / Deposit + 1) / Log(1 + IntRate)
  txtMonths.Text = Format(Months, "###.0")
ElseIf Trim(txtFinal.Text) = "" Then
'Final value missing
  Final = Deposit * ((1 + IntRate) ^ Months - 1) / IntRate
  txtFinal.Text = Format(Final, "#####0.00")
End If
End Sub

Private Sub cmdClear_Click()
'Blank out text boxes
txtDeposit.Text = ""
txtInterest.Text = ""
txtMonths.Text = ""
txtFinal.Text = ""
End Sub

Private Sub cmdExit_Click()
End
End Sub



Private Sub txtDeposit_KeyPress(KeyAscii As Integer)
'Only allow number keys, decimal point, or backspace
If (KeyAscii >= vbKey0 And KeyAscii <= vbKey9) Or KeyAscii = vbKeyDecPt Or KeyAscii = vbKeyBack Then
  Exit Sub
Else
  KeyAscii = 0
  Beep
End If
End Sub

Private Sub txtFinal_KeyPress(KeyAscii As Integer)
'Only allow number keys, decimal point, or backspace
If (KeyAscii >= vbKey0 And KeyAscii <= vbKey9) Or KeyAscii = vbKeyDecPt Or KeyAscii = vbKeyBack Then
  Exit Sub
Else
  KeyAscii = 0
  Beep
End If
End Sub


Private Sub txtInterest_KeyPress(KeyAscii As Integer)
'Only allow number keys, decimal point, or backspace
If (KeyAscii >= vbKey0 And KeyAscii <= vbKey9) Or KeyAscii = vbKeyDecPt Or KeyAscii = vbKeyBack Then
  Exit Sub
Else
  KeyAscii = 0
  Beep
End If
End Sub

Private Sub txtMonths_KeyPress(KeyAscii As Integer)
If (KeyAscii >= vbKey0 And KeyAscii <= vbKey9) Or KeyAscii = 46 Or KeyAscii = vbKeyBack Then
  Exit Sub
Else
  KeyAscii = 0
  Beep
End If
End Sub



