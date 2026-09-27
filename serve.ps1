$port = 3000
$prefix = "http://localhost:$port/"
$root = $PSScriptRoot
if (-not $root) { $root = "D:\X3DSolidProjects\XMat3DSolidWork-blog" }

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add($prefix)
try {
    $listener.Start()
} catch {
    Write-Host "포트 $port 시작 실패: $_"
    exit 1
}

Write-Host "=========================================================="
Write-Host "  XMat3DSolidWork 블로그 로컬 서버가 시작되었습니다!"
Write-Host "  주소: $prefix"
Write-Host "  종료하려면 이 창을 닫거나 Ctrl+C 를 누르세요."
Write-Host "=========================================================="

Start-Process $prefix

try {
    while ($listener.IsListening) {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response

        $urlPath = $request.Url.LocalPath.TrimStart('/')
        if ([string]::IsNullOrEmpty($urlPath) -or $urlPath -eq '/') {
            $urlPath = "index.html"
        }
        $urlPath = [System.Uri]::UnescapeDataString($urlPath)
        $localFile = [System.IO.Path]::Combine($root, $urlPath.Replace('/', [System.IO.Path]::DirectorySeparatorChar))

        if ([System.IO.File]::Exists($localFile)) {
            $bytes = [System.IO.File]::ReadAllBytes($localFile)
            $ext = [System.IO.Path]::GetExtension($localFile).ToLowerInvariant()
            $contentType = switch ($ext) {
                ".html" { "text/html; charset=utf-8" }
                ".md"   { "text/markdown; charset=utf-8" }
                ".js"   { "application/javascript; charset=utf-8" }
                ".css"  { "text/css; charset=utf-8" }
                ".png"  { "image/png" }
                ".jpg"  { "image/jpeg" }
                ".jpeg" { "image/jpeg" }
                ".svg"  { "image/svg+xml" }
                default { "application/octet-stream" }
            }
            $response.ContentType = $contentType
            $response.ContentLength64 = $bytes.Length
            $response.AddHeader("Access-Control-Allow-Origin", "*")
            $response.OutputStream.Write($bytes, 0, $bytes.Length)
        } else {
            $response.StatusCode = 404
            $msg = [System.Text.Encoding]::UTF8.GetBytes("404 Not Found")
            $response.OutputStream.Write($msg, 0, $msg.Length)
        }
        $response.OutputStream.Close()
    }
} finally {
    $listener.Stop()
}
