# Đẩy bản mới nhất của portfolio lên GitHub (https://github.com/vutamhung/Portfolio).
# Tự tìm mọi video/ảnh trong media/ mà index.html đang dùng, nên video mới thêm vào trang sẽ tự được đưa lên;
# video gốc, file nén tạm và file không dùng thì giữ lại trên máy.
# Cách chạy: nháy đúp "Cap nhat GitHub.bat", hoặc trong PowerShell: .\cap-nhat-github.ps1 "ghi chú thay đổi"
param([string]$Message = "")

$ErrorActionPreference = "Stop"
Set-Location -LiteralPath $PSScriptRoot

$git = (Get-Command git -ErrorAction SilentlyContinue).Source
if (-not $git) { $git = "C:\Program Files\Git\cmd\git.exe" }
if (-not (Test-Path -LiteralPath $git)) { throw "Chưa cài Git. Cài bằng: winget install --id Git.Git -e" }

# 1. Danh sách file media mà trang đang dùng
$html = [IO.File]::ReadAllText((Join-Path $PSScriptRoot "index.html"))
$used = New-Object System.Collections.Generic.SortedSet[string]
foreach ($m in [regex]::Matches($html, 'media/[\w\-/]+\.(webp|mp4|jpg|png)')) { [void]$used.Add($m.Value) }
# video trong danh sách VIDEOS: { id: "...", file: "..." } -> media/<file|id>.mp4 + poster media/<id>.webp
foreach ($m in [regex]::Matches($html, '\{ id: "([\w-]+)"(, file: "([\w-]+)")?')) {
  $id = $m.Groups[1].Value
  $file = if ($m.Groups[3].Value) { $m.Groups[3].Value } else { $id }
  [void]$used.Add("media/$file.mp4")
  [void]$used.Add("media/$id.webp")
}

$missing = @($used | Where-Object { -not (Test-Path -LiteralPath (Join-Path $PSScriptRoot $_)) })
if ($missing.Count) { Write-Host "Cảnh báo, trang dùng nhưng không thấy file:" -ForegroundColor Yellow; $missing | ForEach-Object { "  $_" } }
foreach ($p in $used) {
  $f = Join-Path $PSScriptRoot $p
  if ((Test-Path -LiteralPath $f) -and (Get-Item -LiteralPath $f).Length -gt 100MB) { throw "$p lớn hơn 100 MB, GitHub không nhận. Hãy nén nhỏ lại." }
}

# 2. .gitignore: chặn tất cả, chỉ mở đúng các file trên
$lines = @(
  "# Tạo tự động bởi cap-nhat-github.ps1: chỉ đưa lên trang và media mà trang đang dùng.",
  "/*", "!/index.html", "!/README.md", "!/.gitignore", "!/cap-nhat-github.ps1", "!/Cap nhat GitHub.bat",
  "!/media/", "/media/*", "!/media/sv/", "/media/sv/*"
) + ($used | ForEach-Object { "!/$_" })
[IO.File]::WriteAllText((Join-Path $PSScriptRoot ".gitignore"), ($lines -join "`n") + "`n", (New-Object Text.UTF8Encoding $false))

# 3. Commit + push
& $git add -A
$changes = & $git status --porcelain
if (-not $changes) { Write-Host "Không có gì thay đổi, GitHub đã là bản mới nhất." -ForegroundColor Green; exit 0 }
Write-Host "Các thay đổi sẽ đưa lên:" -ForegroundColor Cyan
$changes | ForEach-Object { "  $_" }

if (-not $Message) { $Message = "Cập nhật portfolio " + (Get-Date -Format "dd/MM/yyyy HH:mm") }
& $git commit -q -m $Message
& $git push
if ($LASTEXITCODE -ne 0) { throw "Push không thành công, xem lỗi phía trên." }
Write-Host "Xong! Đã đưa lên https://github.com/vutamhung/Portfolio" -ForegroundColor Green
