Attribute VB_Name = "M�dulo2"
Sub stocks():
 
'Recorrido de las pesta�as
 For Each ws In Worksheets
     Dim LastRow As Long
    Dim LastColumn As Long
    Dim i As Long 'Recorrer las filas
    Dim j As Long '�ndice de la fila donde se colocar� el nuevo ticker
    Dim index_min As Long
    Dim index_max As Long
    Dim index_volume As Long
    Dim header(1 To 4) As String
    Dim header_summary(1 To 2)
    'Dim row_summary(1 To 3) As String
    Dim min_sup As String
    Dim max_sup As String
    Dim minim As Long
    Dim maxim As Long
    Dim volume As Double
    Dim increase_percent As Double
    Dim decrease_percent As Double
    Dim greatest_volume As Double

 
    header(1) = "Ticker"
    header(2) = "Yearly change"
    header(3) = "Percent change"
    header(4) = "Total stock volume"
    header_summary(1) = "Ticker"
    header_summary(2) = "Value"
    'row_summary(1) = "Greatest % Increase"
    'row_summary(2) = "Greatest % Decrease"
    'row_summary(3) = "Greatest Total Volume"
    ws.Range("I1:L1") = header
    ws.Range("P1:Q1") = header_summary
    ws.Range("O2") = "Greatest % Increase"
    ws.Range("O3") = "Greatest % Decrease"
    ws.Range("O4") = "Greatest Total Volume"
 
    LastRow = ws.Cells(Rows.Count, 1).End(xlUp).Row
    LastColumn = ws.Cells(1, Columns.Count).End(xlToLeft).Column

    'Range("I2") = Cells(2, 1).Value
 
    j = 2

    min_sup = ws.Cells(2, 2).Value
    max_sup = ws.Cells(2, 2).Value
    'MsgBox (min_sup)
    'MsgBox (max_sup)
    minim = CLng(min_sup)
    'MsgBox (minim)
    maxim = CLng(max_sup)
    'MsgBox (maxim)
    volume = 0
    index_min = 2
    index_max = 2
 
    For i = 2 To LastRow
        'Obtiene el mes y el a�o de inter�s a evaluar.
        'month = CInt(Mid(Cells(i, 2).Value, 5, 2))
        'day = CInt(Mid(Cells(i, 2).Value, 7, 2))
          
        'If Cells(i + 1, 1) <> Cells(i, 1) Then
             'Cells(j, 9) = Cells(i, 1).Value
            'j = j + 1
        'ElseIf Cells(i + 1, 2) < Cells(i, 2) Then
        'Cells(j, 10) = Cells(i, 3).Value
        'End If
     
     If ws.Cells(i + 1, 1) <> ws.Cells(i, 1) Then
            ws.Cells(j, 9) = ws.Cells(i, 1).Value
            If CLng(ws.Cells(i, 2)) < minim Then
             minim = CLng(ws.Cells(i, 2).Value)
             index_min = i
            'MsgBox (index_min)
            'MsgBox (minim)
            ElseIf CLng(ws.Cells(i, 2)) > maxim Then
                maxim = CLng(ws.Cells(i, 2).Value)
                index_max = i
                'MsgBox (maxim)
            End If
            volume = volume + CDbl(ws.Cells(i, 7).Value)
            'Cells(j, 10) = minim
            'Cells(j, 11) = maxim
            'Cells(j, 12) = Cells(index_min, 3).Value
            'Cells(j, 13) = Cells(index_max, 6).Value
            'Yearly change
            ws.Cells(j, 10) = -(CDbl(ws.Cells(index_min, 3).Value) - CDbl(ws.Cells(index_max, 6).Value))
                
            If CDbl(ws.Cells(index_min, 3) <> 0) Then
                ws.Cells(j, 11) = CStr((CDbl(ws.Cells(index_max, 6).Value) - CDbl(ws.Cells(index_min, 3).Value)) / CDbl(ws.Cells(index_min, 3).Value) * 100) + "%"
            Else
                ws.Cells(j, 11) = 0
            End If
            If CDbl(ws.Cells(j, 10)) < 0 Then
                ws.Cells(j, 10).Interior.ColorIndex = 3
            Else
                ws.Cells(j, 10).Interior.ColorIndex = 4
            End If
            ws.Cells(j, 12) = volume
            
            'ws.Cells(j, 13) = minim
            'ws.Cells(j, 14) = maxim
            'ws.Cells(j, 15) = Cells(index_min, 3).Value
            'ws.Cells(j, 16) = Cells(index_max, 6).Value
            'ws.Cells(j, 17) = index_min
            'ws.Cells(j, 18) = index_max
            j = j + 1
            minim = CLng(ws.Cells(i + 1, 2).Value)
            maxim = CLng(ws.Cells(i + 1, 2).Value)
            index_min = i + 1
            index_max = i + 1
            volume = 0
        ElseIf CLng(ws.Cells(i, 2)) < minim Then
            minim = CLng(ws.Cells(i, 2).Value)
            'MsgBox (minim)
            index_min = i
            'MsgBox (index_min)
            ElseIf CLng(ws.Cells(i, 2)) > maxim Then
                maxim = CLng(ws.Cells(i, 2).Value)
                'MsgBox (maxim)
                index_max = i
            End If
            volume = volume + CDbl(ws.Cells(i, 7).Value)
        'If month = "12" And day = "30" Or month = "12" And day = "31" Then
        'Cells(j - 1, 11) = Cells(i, 6).Value
        'End If
    Next i
 
    'increase_percent = CDbl(ws.Cells(2, 11))
    'decrease_percent = CDbl(ws.Cells(2, 11))
    'greatest_volume = CDbl(ws.Cells(2, 12))
    'index_max = 1
    'index_min = 1
    'index_volume = 1
 
    'For i = 2 To j
        'If CDbl(ws.Cells(i, 11)) < decrease_percent Then
            'decrease_percent = CDbl(ws.Cells(i, 11).Value)
            'index_min = i
        'ElseIf CDbl(ws.Cells(i, 11)) > increase_percent Then
            'increase_percent = CDbl(ws.Cells(i, 11).Value)
            'index_max = i
        'End If
    
        'If CLng(ws.Cells(i, 12) > greatest_volume) Then
            'greatest_volume = CDbl(ws.Cells(i, 12).Value)
            'index_volume = i
        'End If
   
    'Next i

    'ws.Range("Q2") = CStr(increase_percent * 100) + "%"
    'ws.Range("Q3") = CStr(decrease_percent * 100) + "%"
    'ws.Range("Q4") = greatest_volume
    'ws.Range("P2") = ws.Cells(index_max, 9)
    'ws.Range("P3") = ws.Cells(index_min, 9)
    'ws.Range("P4") = ws.Cells(index_volume, 9)
    
  Next ws
  
End Sub








