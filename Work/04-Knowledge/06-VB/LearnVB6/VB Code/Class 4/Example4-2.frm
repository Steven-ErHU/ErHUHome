VERSION 5.00
Begin VB.Form frmImage 
   Caption         =   "Image Viewer"
   ClientHeight    =   4140
   ClientLeft      =   1140
   ClientTop       =   1545
   ClientWidth     =   6690
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   4140
   ScaleWidth      =   6690
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdExit 
      Caption         =   "E&xit"
      Height          =   375
      Left            =   5640
      TabIndex        =   7
      Top             =   3600
      Width           =   975
   End
   Begin VB.CommandButton cmdShow 
      Caption         =   "&Show Image"
      Height          =   375
      Left            =   4200
      TabIndex        =   6
      Top             =   3600
      Width           =   1215
   End
   Begin VB.DriveListBox drvImage 
      Height          =   315
      Left            =   2280
      TabIndex        =   5
      Top             =   3720
      Width           =   1575
   End
   Begin VB.FileListBox filImage 
      Height          =   2820
      Left            =   120
      Pattern         =   "*.bmp;*.ico;*.wmf;*.gif;*.jpg"
      TabIndex        =   1
      Top             =   1080
      Width           =   2055
   End
   Begin VB.DirListBox dirImage 
      Height          =   2055
      Left            =   2280
      TabIndex        =   0
      Top             =   1080
      Width           =   1575
   End
   Begin VB.Image imgImage 
      BorderStyle     =   1  'Fixed Single
      Height          =   2895
      Left            =   4440
      Stretch         =   -1  'True
      Top             =   360
      Width           =   1935
   End
   Begin VB.Shape Shape2 
      BackColor       =   &H00FFFFFF&
      BackStyle       =   1  'Opaque
      FillColor       =   &H0000FF00&
      Height          =   2895
      Left            =   4440
      Top             =   360
      Width           =   1935
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00FFFF00&
      BackStyle       =   1  'Opaque
      FillColor       =   &H00FF0000&
      FillStyle       =   4  'Upward Diagonal
      Height          =   3375
      Left            =   4200
      Shape           =   4  'Rounded Rectangle
      Top             =   120
      Width           =   2415
   End
   Begin VB.Label lblImage 
      BackColor       =   &H0080FFFF&
      BorderStyle     =   1  'Fixed Single
      Height          =   375
      Left            =   120
      TabIndex        =   8
      Top             =   120
      Width           =   3735
   End
   Begin VB.Line Line1 
      BorderWidth     =   3
      X1              =   4080
      X2              =   4080
      Y1              =   120
      Y2              =   3960
   End
   Begin VB.Label Label3 
      Caption         =   "Drives:"
      Height          =   375
      Left            =   2280
      TabIndex        =   4
      Top             =   3360
      Width           =   1215
   End
   Begin VB.Label Label2 
      Caption         =   "Directories:"
      Height          =   375
      Left            =   2280
      TabIndex        =   3
      Top             =   720
      Width           =   1215
   End
   Begin VB.Label Label1 
      Caption         =   "Files:"
      Height          =   375
      Left            =   120
      TabIndex        =   2
      Top             =   720
      Width           =   1215
   End
End
Attribute VB_Name = "frmImage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


Private Sub cmdExit_Click()
End
End Sub

Private Sub cmdShow_Click()
'Put image file name together and
'load image into image box
Dim ImageName As String
'Check to see if filename blank
If filImage.filename = "" Then Exit Sub
'Check to see if at root directory
If Right(filImage.Path, 1) = "\" Then
  ImageName = filImage.Path + filImage.filename
Else
  ImageName = filImage.Path + "\" + filImage.filename
End If
lblImage.Caption = ImageName
imgImage.Picture = LoadPicture(ImageName)
End Sub

Private Sub dirImage_Change()
'If directory changes, update file path
filImage.Path = dirImage.Path
End Sub

Private Sub drvImage_Change()
'If drive changes, update directory
dirImage.Path = drvImage.Drive
End Sub


Private Sub filImage_DblClick()
Call cmdShow_Click
End Sub


