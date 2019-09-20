VERSION 5.00
Begin VB.Form frmStopWatch 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Stopwatch Application"
   ClientHeight    =   2505
   ClientLeft      =   5325
   ClientTop       =   4380
   ClientWidth     =   4890
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2505
   ScaleWidth      =   4890
   Begin VB.CommandButton cmdExit 
      Caption         =   "E&xit"
      Height          =   495
      Left            =   240
      TabIndex        =   2
      Top             =   1560
      Width           =   1215
   End
   Begin VB.CommandButton cmdEnd 
      Caption         =   "&End Timing"
      Height          =   495
      Left            =   240
      TabIndex        =   1
      Top             =   960
      Width           =   1215
   End
   Begin VB.CommandButton cmdStart 
      Caption         =   "&StartTiming"
      Height          =   495
      Left            =   240
      TabIndex        =   0
      Top             =   360
      Width           =   1215
   End
   Begin VB.Label lblElapsed 
      BorderStyle     =   1  'Fixed Single
      Height          =   495
      Left            =   3120
      TabIndex        =   8
      Top             =   1560
      Width           =   1215
   End
   Begin VB.Label lblEnd 
      BorderStyle     =   1  'Fixed Single
      Height          =   495
      Left            =   3120
      TabIndex        =   7
      Top             =   960
      Width           =   1215
   End
   Begin VB.Label lblStart 
      BorderStyle     =   1  'Fixed Single
      Height          =   495
      Left            =   3120
      TabIndex        =   6
      Top             =   360
      Width           =   1215
   End
   Begin VB.Label Label3 
      Caption         =   "Elapsed Time"
      Height          =   495
      Left            =   1680
      TabIndex        =   5
      Top             =   1560
      Width           =   1215
   End
   Begin VB.Label Label2 
      Caption         =   "End Time"
      Height          =   495
      Left            =   1680
      TabIndex        =   4
      Top             =   960
      Width           =   1215
   End
   Begin VB.Label Label1 
      Caption         =   "Start Time"
      Height          =   495
      Left            =   1680
      TabIndex        =   3
      Top             =   360
      Width           =   1215
   End
End
Attribute VB_Name = "frmStopWatch"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim StartTime As Variant
Dim EndTime As Variant
Dim ElapsedTime As Variant

Private Sub cmdEnd_Click()
'Find the ending time, compute the elapsed time
'Put both values in label boxes
EndTime = Now
ElapsedTime = EndTime - StartTime
lblEnd.Caption = Format(EndTime, "hh:mm:ss")
lblElapsed.Caption = Format(ElapsedTime, "hh:mm:ss")
End Sub

Private Sub cmdExit_Click()
End
End Sub


Private Sub cmdStart_Click()
'Establish and print starting time
StartTime = Now
lblStart.Caption = Format(StartTime, "hh:mm:ss")
lblEnd.Caption = ""
lblElapsed.Caption = ""
End Sub


