VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.1#0"; "COMDLG32.OCX"
Begin VB.Form Form1 
   Caption         =   "Common Dialog Examples"
   ClientHeight    =   2040
   ClientLeft      =   1140
   ClientTop       =   1515
   ClientWidth     =   6555
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   2040
   ScaleWidth      =   6555
   Begin MSComDlg.CommonDialog cdlExample 
      Left            =   240
      Top             =   120
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   327680
      DefaultExt      =   "bmp"
      DialogTitle     =   "Save As Example"
      Filter          =   "Bitmaps (*.bmp)|*.bmp|Icons (*.ico)|*.ico|Metafiles (*.wmf)|*.wmf|GIF Files (*.gif)|*.gif|JPEG Files (*.jpg)|*.jpg|"
   End
   Begin VB.CommandButton cmdDisplay 
      Caption         =   "&Display Box"
      Height          =   495
      Left            =   2760
      TabIndex        =   1
      Top             =   1440
      Width           =   1215
   End
   Begin VB.Label lblExample 
      BorderStyle     =   1  'Fixed Single
      Height          =   495
      Left            =   600
      TabIndex        =   0
      Top             =   720
      Width           =   5655
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdDisplay_Click()
cdlExample.ShowSave
lblExample.Caption = cdlExample.FileName
End Sub


