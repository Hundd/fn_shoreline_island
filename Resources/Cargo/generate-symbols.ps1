# Original geometric cargo artwork. Regenerate the two 512px import sources.
Add-Type -AssemblyName System.Drawing
$navy = [Drawing.Color]::FromArgb(255, 12, 34, 48)
$white = [Drawing.Color]::FromArgb(255, 246, 246, 228)
foreach ($symbol in @('leaf', 'gear')) {
    $bitmap = New-Object Drawing.Bitmap 512,512
    $graphics = [Drawing.Graphics]::FromImage($bitmap)
    $graphics.SmoothingMode = [Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $graphics.Clear($navy)
    $fill = New-Object Drawing.SolidBrush $white
    $cutout = New-Object Drawing.SolidBrush $navy
    $pen = New-Object Drawing.Pen $navy,14
    $outline = New-Object Drawing.Pen $white,10
    try {
        $graphics.DrawRectangle($outline, 24, 24, 464, 464)
        if ($symbol -eq 'leaf') {
            $leaf = New-Object Drawing.Drawing2D.GraphicsPath
            try {
                $leaf.AddBezier(118,380,85,155,220,90,393,103)
                $leaf.AddBezier(393,103,405,290,300,410,118,380)
                $graphics.FillPath($fill,$leaf)
                $graphics.DrawLine($pen,113,394,345,151)
                $graphics.DrawLine($pen,208,295,195,215)
                $graphics.DrawLine($pen,263,237,331,237)
            } finally { $leaf.Dispose() }
        } else {
            $points = New-Object 'System.Collections.Generic.List[Drawing.PointF]'
            for ($tooth=0; $tooth -lt 10; $tooth++) {
                foreach ($corner in @(0,1,2,3)) {
                    $angle = (($tooth*4+$corner)*9-90)*[Math]::PI/180
                    $radius = if ($corner -eq 1 -or $corner -eq 2) { 172 } else { 133 }
                    $points.Add([Drawing.PointF]::new(256+$radius*[Math]::Cos($angle),256+$radius*[Math]::Sin($angle)))
                }
            }
            $graphics.FillPolygon($fill,$points.ToArray())
            $graphics.FillEllipse($cutout,191,191,130,130)
        }
        $bitmap.Save((Join-Path $PSScriptRoot ('signal_' + $symbol + '.png')), [Drawing.Imaging.ImageFormat]::Png)
    } finally {
        $outline.Dispose(); $pen.Dispose(); $cutout.Dispose(); $fill.Dispose()
        $graphics.Dispose(); $bitmap.Dispose()
    }
}
