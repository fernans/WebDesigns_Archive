VERSION 5.00
Object = "{D27CDB6B-AE6D-11CF-96B8-444553540000}#1.0#0"; "Flash9d.ocx"
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "La Aventura de la Biblia"
   ClientHeight    =   8820
   ClientLeft      =   150
   ClientTop       =   540
   ClientWidth     =   14685
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   8820
   ScaleWidth      =   14685
   StartUpPosition =   3  'Windows Default
   Begin ShockwaveFlashObjectsCtl.ShockwaveFlash Flash 
      Height          =   2775
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4335
      _cx             =   7646
      _cy             =   4895
      FlashVars       =   ""
      Movie           =   "delete.swf"
      Src             =   "delete.swf"
      WMode           =   "Window"
      Play            =   -1  'True
      Loop            =   -1  'True
      Quality         =   "High"
      SAlign          =   ""
      Menu            =   0   'False
      Base            =   ""
      AllowScriptAccess=   ""
      Scale           =   "ShowAll"
      DeviceFont      =   0   'False
      EmbedMovie      =   0   'False
      BGColor         =   ""
      SWRemote        =   ""
      MovieData       =   ""
      SeamlessTabbing =   -1  'True
      Profile         =   0   'False
      ProfileAddress  =   ""
      ProfilePort     =   0
      AllowNetworking =   "all"
      AllowFullScreen =   "false"
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
    Dim fso As Scripting.FileSystemObject
    Set fso = New Scripting.FileSystemObject
    Dim drv As Drive
    Dim cdencontrado As Boolean
    
    cdencontrado = False
    For Each drv In fso.Drives
        If drv.DriveType = CDRom Then
            CDPath = drv.Path
            If fso.FileExists(drv.Path & "Biblia.inc") Then
                cdencontrado = True
                Exit For
            End If
        End If
    Next drv
        
    Set drv = Nothing
    Set fso = Nothing
    
    If cdencontrado Then
        Flash.Movie = App.Path & "\delete.exe"
    Else
        MsgBox "Inserte el CD de 'La Aventura de la Biblia'", vbOKOnly, "La Aventura de la Biblia"
        End
    End If
End Sub

Private Sub Form_Resize()
    Flash.Top = 0
    Flash.Left = 0
    Flash.Width = Me.Width
    Flash.Height = Me.Height
End Sub
