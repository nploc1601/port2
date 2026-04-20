# Fix the small logo icons for MER.MAR and 200Lab certs
$bytes = [System.IO.File]::ReadAllBytes('c:\Users\ASUS\Downloads\port2\index.html')
$content = [System.Text.Encoding]::UTF8.GetString($bytes)

# Fix MER.MAR logo (replace cert image with a styled text icon)
$oldMermarLogo = @'
                        <div class="w-7 h-7 bg-black rounded-full p-[3px] shadow-[0_0_10px_rgba(255,255,255,0.2)]">
                            <img src="mermar.png" alt="MER.MAR" class="w-full h-full object-contain rounded-full">
                        </div>
                        <p class="text-[10px] text-gray-300 font-black tracking-widest uppercase text-center">MER.MAR</p>
'@

$newMermarLogo = @'
                        <div class="w-7 h-7 bg-gradient-to-br from-gray-800 to-black rounded-full flex items-center justify-center shadow-[0_0_10px_rgba(255,255,255,0.2)] border border-white/20">
                            <span class="text-[6px] font-black text-white tracking-tight">M.M</span>
                        </div>
                        <p class="text-[10px] text-gray-300 font-black tracking-widest uppercase text-center">MER.MAR</p>
'@

# Fix 200Lab logo
$oldLabLogo = @'
                        <div class="w-7 h-7 bg-white rounded-full p-[3px] shadow-[0_0_10px_rgba(255,255,255,0.2)]">
                            <img src="Nguy&#7877;n Ph&#250;c L&#7897;c_Certificate_DA05_200Lab.jpg" alt="200Lab" class="w-full h-full object-contain rounded-full">
                        </div>
                        <p class="text-[10px] text-gray-300 font-black tracking-widest uppercase text-center">200Lab</p>
'@

$newLabLogo = @'
                        <div class="w-7 h-7 bg-gradient-to-br from-emerald-600 to-emerald-800 rounded-full flex items-center justify-center shadow-[0_0_10px_rgba(255,255,255,0.2)] border border-emerald-400/30">
                            <span class="text-[5px] font-black text-white">200</span>
                        </div>
                        <p class="text-[10px] text-gray-300 font-black tracking-widest uppercase text-center">200Lab</p>
'@

$oldMermarLogo = $oldMermarLogo.Replace("`r`n", "`n")
$oldLabLogo = $oldLabLogo.Replace("`r`n", "`n")
$newMermarLogo = $newMermarLogo.Replace("`r`n", "`n")
$newLabLogo = $newLabLogo.Replace("`r`n", "`n")

if ($content.Contains($oldMermarLogo)) {
    $content = $content.Replace($oldMermarLogo, $newMermarLogo)
    Write-Host "1) Fixed MER.MAR logo icon"
} else { Write-Host "1) WARNING: MER.MAR logo not found" }

if ($content.Contains($oldLabLogo)) {
    $content = $content.Replace($oldLabLogo, $newLabLogo)
    Write-Host "2) Fixed 200Lab logo icon"
} else { Write-Host "2) WARNING: 200Lab logo not found" }

# Also fix the 200Lab cert src to use the actual UTF-8 filename instead of HTML entities
# The src attribute needs the real filename
$oldSrc = 'src="Nguy&#7877;n Ph&#250;c L&#7897;c_Certificate_DA05_200Lab.jpg"'
$newSrc = 'src="Nguy' + [char]0x1EC5 + 'n Ph' + [char]0x00FA + 'c L' + [char]0x1ED9 + 'c_Certificate_DA05_200Lab.jpg"'
if ($content.Contains($oldSrc)) {
    $content = $content.Replace($oldSrc, $newSrc)
    Write-Host "3) Fixed 200Lab src to use UTF-8 filename"
} else { Write-Host "3) Src already correct or not found" }

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText('c:\Users\ASUS\Downloads\port2\index.html', $content, $utf8NoBom)
Write-Host "`nDone! All cert changes applied."
