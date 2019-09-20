VERSION 5.00
Begin VB.Form frmPassword 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Password Validation"
   ClientHeight    =   2550
   ClientLeft      =   4845
   ClientTop       =   4260
   ClientWidth     =   5790
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   2550
   ScaleWidth      =   5790
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdExit 
      Cancel          =   -1  'True
      Caption         =   "E&xit"
      Height          =   372
      Left            =   3480
      TabIndex        =   3
      Top             =   1800
      Width           =   972
   End
   Begin VB.CommandButton cmdValid 
      Caption         =   "&Validate"
      Default         =   -1  'True
      Height          =   372
      Left            =   1320
      TabIndex        =   2
      Top             =   1800
      Width           =   972
   End
   Begin VB.TextBox txtPassword 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   480
      IMEMode         =   3  'DISABLE
      Left            =   1800
      PasswordChar    =   "*"
      TabIndex        =   0
      Tag             =   "LouTylee"
      Top             =   960
      Width           =   2292
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Please Enter Your Password:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   372
      Left            =   600
      TabIndex        =   1
      Top             =   240
      Width           =   4572
   End
End
Attribute VB_Name = "frmPassword"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdExit_Click()
End
End Sub


Private Sub cmdValid_Click()
'This procedure checks the input password
Dim Response As Integer
If txtPassword.Text = txtPassword.Tag Then
'If correct, display message box
  MsgBox "You've passed security!", vbOKOnly + vbExclamation, "Access Granted"
Else
'If incorrect, give option to try again
  Response = MsgBox("Incorrect password", vbRetryCancel + vbCritical, "Access Denied")
  If Response = vbRetry Then
    txtPassword.SelStart = 0
    txtPassword.SelLength = Len(txtPassword.Text)
  Else
    End
  End If
End If
txtPassword.SetFocus
End Sub


Private Sub Form_Activate()
txtPassword.SetFocus
End Sub

