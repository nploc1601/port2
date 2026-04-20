# Read the file preserving encoding
$bytes = [System.IO.File]::ReadAllBytes('c:\Users\ASUS\Downloads\port2\index.html')
$content = [System.Text.Encoding]::UTF8.GetString($bytes)
Write-Host "Original length: $($content.Length)"

# File uses LF line endings (0x0A), not CRLF
$LF = "`n"

# 1) Remove Spline preload links (using LF line endings)
$pattern1 = "    <!-- Preload Spline Scene for faster 3D loading -->${LF}    <link rel=`"preload`" href=`"https://unpkg.com/@splinetool/viewer@1.12.73/build/spline-viewer.js`" as=`"script`"${LF}        crossorigin=`"anonymous`">${LF}    <link rel=`"preload`" href=`"https://prod.spline.design/3GTIrLXVklUzgYva/scene.splinecode`" as=`"fetch`"${LF}        crossorigin=`"anonymous`">${LF}"

if ($content.Contains($pattern1)) {
    $content = $content.Replace($pattern1, '')
    Write-Host "1) Removed Spline preload links"
} else {
    Write-Host "1) WARNING: Pattern not found, trying alternative..."
    # Try just removing any line containing spline preload
    $content = $content.Replace("    <!-- Preload Spline Scene for faster 3D loading -->${LF}", '')
    $content = $content.Replace("    <link rel=`"preload`" href=`"https://unpkg.com/@splinetool/viewer@1.12.73/build/spline-viewer.js`" as=`"script`"${LF}        crossorigin=`"anonymous`">${LF}", '')
    $content = $content.Replace("    <link rel=`"preload`" href=`"https://prod.spline.design/3GTIrLXVklUzgYva/scene.splinecode`" as=`"fetch`"${LF}        crossorigin=`"anonymous`">${LF}", '')
    Write-Host "1) Removed preload lines individually"
}

# 2) Insert Karofi showcase modal before the <script> block
$showcaseHTML = @'

    <!-- KAROFI SHOWCASE MODAL -->
    <div id="karofi-showcase" data-lenis-prevent="true"
        class="fixed inset-0 z-[150] hidden bg-[#05050f]/95 backdrop-blur-sm overflow-y-auto transition-all duration-500 opacity-0 transform scale-105 custom-scroll">
        <div class="absolute top-[10%] left-[20%] w-96 h-96 bg-ai-cyan/20 rounded-full blur-[120px] pointer-events-none"></div>
        <div class="absolute bottom-[20%] right-[10%] w-[500px] h-[500px] bg-ai-purple/20 rounded-full blur-[150px] pointer-events-none"></div>
        <div class="max-w-7xl mx-auto px-4 py-16 relative">
            <button onclick="closeKarofiShowcase()" class="fixed top-8 right-8 z-[160] w-14 h-14 rounded-full glass-card flex items-center justify-center hover:bg-white/10 text-white transition-all group border border-white/10 shadow-[0_0_20px_rgba(0,0,0,0.5)]">
                <i class="fas fa-times text-2xl group-hover:rotate-90 transition-transform"></i>
            </button>
            <div class="text-center mb-24">
                <div class="inline-flex items-center justify-center gap-2 px-5 py-2.5 rounded-full glass-card border-white/10 mb-6">
                    <div class="w-2.5 h-2.5 rounded-full bg-ai-cyan animate-pulse shadow-[0_0_10px_#38bdf8]"></div>
                    <span class="text-ai-cyan text-xs font-black tracking-[0.5em] uppercase">From Helicopter to Detail-oriented</span>
                </div>
                <h2 class="text-5xl md:text-7xl font-black text-white tracking-tighter uppercase mb-6 drop-shadow-xl">Karofi Journey</h2>
                <div class="h-1.5 w-48 bg-gradient-to-r from-ai-cyan via-white to-ai-purple mx-auto rounded-full shadow-[0_0_20px_rgba(56,189,248,0.6)]"></div>
            </div>
            <div class="space-y-32">
                <!-- PILLAR 1: FACEBOOK COMMUNITY LISTENING -->
                <div class="glass-card p-8 md:p-14 rounded-[3rem] border border-white/10 shadow-2xl relative overflow-hidden group">
                    <div class="absolute top-0 right-0 w-[600px] h-[600px] bg-[#1877F2]/5 rounded-full blur-[120px] pointer-events-none group-hover:bg-[#1877F2]/10 transition-colors duration-700"></div>
                    <div class="flex flex-col lg:flex-row gap-12 lg:gap-16 items-center relative z-10">
                        <div class="lg:w-5/12 space-y-10">
                            <div class="flex items-center gap-6">
                                <div class="w-20 h-20 rounded-[2rem] glass-card border-[#1877F2]/30 flex items-center justify-center text-5xl shadow-[0_0_25px_rgba(24,119,242,0.2)] overflow-hidden p-2.5 bg-white/5">
                                    <i class="fab fa-facebook text-[#1877F2]"></i>
                                </div>
                                <div>
                                    <h3 class="text-3xl md:text-4xl font-black text-white uppercase tracking-tight mb-2">Community Listening</h3>
                                    <p class="text-[#1877F2] font-black uppercase tracking-[0.3em] text-[10px]">Facebook Group Automation</p>
                                </div>
                            </div>
                            <div class="space-y-6">
                                <div class="glass-card p-6 rounded-3xl border-l-4 border-l-[#1877F2] bg-white/[0.02] hover:bg-white/[0.05] transition-colors shadow-inner">
                                    <h4 class="text-white font-bold text-lg mb-2 flex items-center gap-3"><i class="fas fa-robot text-[#1877F2]"></i> n8n Automation</h4>
                                    <p class="text-sm text-gray-300 leading-relaxed text-justify">Built automated workflows using n8n + Apify to scrape posts and comments from large-scale Facebook Groups (2.6M+ members) for market intelligence.</p>
                                </div>
                                <div class="glass-card p-6 rounded-3xl border-l-4 border-l-[#1877F2] bg-white/[0.02] hover:bg-white/[0.05] transition-colors shadow-inner">
                                    <h4 class="text-white font-bold text-lg mb-2 flex items-center gap-3"><i class="fas fa-database text-[#1877F2]"></i> Structured Data Pipeline</h4>
                                    <p class="text-sm text-gray-300 leading-relaxed text-justify">Extracted and organized community discussions, user sentiments, and trending topics into structured Google Sheets for product team analysis.</p>
                                </div>
                                <div class="glass-card p-6 rounded-3xl border-l-4 border-l-[#1877F2] bg-white/[0.02] hover:bg-white/[0.05] transition-colors shadow-inner">
                                    <h4 class="text-white font-bold text-lg mb-2 flex items-center gap-3"><i class="fas fa-bullhorn text-[#1877F2]"></i> Market Intelligence</h4>
                                    <p class="text-sm text-gray-300 leading-relaxed text-justify">Monitored consumer conversations about home appliances to identify pain points, feature requests, and competitive insights for Livotec positioning.</p>
                                </div>
                            </div>
                        </div>
                        <div class="lg:w-7/12 w-full">
                            <div class="grid grid-cols-2 gap-5">
                                <div class="col-span-2 glass-card p-3 rounded-[2.5rem] cursor-pointer hover:-translate-y-2 transition-transform duration-500 upload-container shadow-[0_20px_40px_rgba(0,0,0,0.5)] h-72" onclick="openModal('karofi-fb-workflow')">
                                    <img id="karofi-fb-workflow" src="demo workflow FB.jpg" class="rounded-[2rem] w-full h-full object-cover" alt="n8n Facebook Scraping Workflow">
                                    <div class="absolute inset-0 flex items-center justify-center upload-overlay rounded-[2.5rem]"><i class="fas fa-search-plus text-white text-4xl"></i></div>
                                </div>
                                <div class="col-span-1 glass-card p-3 rounded-[2.5rem] cursor-pointer hover:-translate-y-2 transition-transform duration-500 upload-container shadow-2xl h-48 relative" onclick="openModal('karofi-fb-group')">
                                    <img id="karofi-fb-group" src="demo workflow FB 2.jpg" class="rounded-[2rem] w-full h-full object-cover" alt="Facebook Group Target">
                                    <div class="absolute inset-0 flex items-center justify-center upload-overlay rounded-[2.5rem]"><i class="fas fa-search-plus text-white text-2xl"></i></div>
                                    <span class="absolute bottom-5 left-5 bg-black/80 backdrop-blur-md px-4 py-1.5 rounded-lg border border-white/20 text-[9px] font-black text-white uppercase tracking-widest">Target Community</span>
                                </div>
                                <div class="col-span-1 glass-card p-3 rounded-[2.5rem] cursor-pointer hover:-translate-y-2 transition-transform duration-500 upload-container shadow-2xl h-48 relative" onclick="openModal('karofi-fb-data')">
                                    <img id="karofi-fb-data" src="demo workflow FB 3.jpg" class="rounded-[2rem] w-full h-full object-cover" alt="Scraped Data Output">
                                    <div class="absolute inset-0 flex items-center justify-center upload-overlay rounded-[2.5rem]"><i class="fas fa-search-plus text-white text-2xl"></i></div>
                                    <span class="absolute bottom-5 left-5 bg-black/80 backdrop-blur-md px-4 py-1.5 rounded-lg border border-white/20 text-[9px] font-black text-white uppercase tracking-widest">Data Output</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- PILLAR 2: WEB REVIEW SCRAPING & AI ANALYSIS -->
                <div class="relative">
                    <div class="absolute inset-0 bg-gradient-to-b from-ai-purple/5 to-ai-cyan/5 rounded-[3.5rem] blur-2xl pointer-events-none"></div>
                    <div class="glass-card p-10 md:p-16 rounded-[3.5rem] border-t-2 border-ai-purple shadow-[0_30px_60px_rgba(0,0,0,0.6)] relative overflow-hidden group">
                        <div class="text-center mb-20 relative z-10">
                            <div class="w-24 h-24 rounded-[2rem] glass-card border-ai-purple/30 flex items-center justify-center text-5xl shadow-[0_0_30px_rgba(167,139,250,0.3)] mx-auto mb-8">&#128269;</div>
                            <h3 class="text-4xl md:text-5xl font-black text-white uppercase tracking-tighter mb-4">Review Intelligence</h3>
                            <p class="text-ai-purple font-black uppercase tracking-[0.4em] text-xs">Web Scraping &amp; AI-Powered Analysis</p>
                        </div>
                        <div class="grid grid-cols-1 lg:grid-cols-12 gap-16 items-center relative z-10">
                            <div class="lg:col-span-5 space-y-8">
                                <div class="glass-card p-6 rounded-3xl border-l-4 border-ai-purple bg-white/[0.02]">
                                    <h4 class="text-white font-black text-lg mb-2 flex items-center gap-3"><i class="fas fa-code text-ai-purple"></i> Puppeteer Scraper</h4>
                                    <p class="text-sm text-gray-300 leading-relaxed text-justify">Developed custom Puppeteer scripts to scrape product reviews from &#272;i&#7879;n M&#225;y Xanh, handling JavaScript-rendered content and pagination for Karofi products.</p>
                                </div>
                                <div class="glass-card p-6 rounded-3xl border-l-4 border-ai-purple bg-white/[0.02]">
                                    <h4 class="text-white font-black text-lg mb-2 flex items-center gap-3"><i class="fas fa-brain text-ai-purple"></i> AI-Powered Insights</h4>
                                    <p class="text-sm text-gray-300 leading-relaxed text-justify">Integrated Gemini AI within n8n workflows to automatically classify and analyze raw customer reviews, extracting actionable product insights.</p>
                                </div>
                                <div class="glass-card p-6 rounded-3xl border-l-4 border-ai-purple bg-white/[0.02]">
                                    <h4 class="text-white font-black text-lg mb-2 flex items-center gap-3"><i class="fas fa-chart-bar text-ai-purple"></i> Data-Driven Decision</h4>
                                    <p class="text-sm text-gray-300 leading-relaxed text-justify">Transformed unstructured reviews into structured datasets (products, ratings, sentiments) enabling data-backed product development and positioning decisions.</p>
                                </div>
                            </div>
                            <div class="lg:col-span-7">
                                <div class="grid grid-cols-2 gap-5">
                                    <div class="col-span-2 glass-card p-3 rounded-[2.5rem] cursor-pointer hover:-translate-y-2 transition-transform duration-500 upload-container shadow-[0_20px_40px_rgba(0,0,0,0.5)] h-72" onclick="openModal('karofi-web-workflow')">
                                        <img id="karofi-web-workflow" src="demo workflow Web.jpg" class="rounded-[2rem] w-full h-full object-cover" alt="n8n Web Scraping Workflow">
                                        <div class="absolute inset-0 flex items-center justify-center upload-overlay rounded-[2.5rem]"><i class="fas fa-search-plus text-white text-4xl"></i></div>
                                    </div>
                                    <div class="col-span-1 glass-card p-3 rounded-[2.5rem] cursor-pointer hover:-translate-y-2 transition-transform duration-500 upload-container shadow-2xl h-48 relative" onclick="openModal('karofi-web-scraper')">
                                        <img id="karofi-web-scraper" src="demo workflow Web 2.jpg" class="rounded-[2rem] w-full h-full object-cover" alt="Puppeteer Scraper">
                                        <div class="absolute inset-0 flex items-center justify-center upload-overlay rounded-[2.5rem]"><i class="fas fa-search-plus text-white text-2xl"></i></div>
                                        <span class="absolute bottom-5 left-5 bg-black/80 backdrop-blur-md px-4 py-1.5 rounded-lg border border-white/20 text-[9px] font-black text-white uppercase tracking-widest">Puppeteer + DMX</span>
                                    </div>
                                    <div class="col-span-1 glass-card p-3 rounded-[2.5rem] cursor-pointer hover:-translate-y-2 transition-transform duration-500 upload-container shadow-2xl h-48 relative" onclick="openModal('karofi-web-data')">
                                        <img id="karofi-web-data" src="demo workflow Web 3.jpg" class="rounded-[2rem] w-full h-full object-cover" alt="Structured Review Data">
                                        <div class="absolute inset-0 flex items-center justify-center upload-overlay rounded-[2.5rem]"><i class="fas fa-search-plus text-white text-2xl"></i></div>
                                        <span class="absolute bottom-5 left-5 bg-black/80 backdrop-blur-md px-4 py-1.5 rounded-lg border border-white/20 text-[9px] font-black text-white uppercase tracking-widest">Review Dataset</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- LESSON LEARNED -->
                <div class="glass-card rounded-[3rem] border border-white/10 bg-[rgba(255,255,255,0.01)] relative overflow-hidden shadow-2xl">
                    <div class="absolute inset-0 bg-gradient-to-r from-ai-cyan/5 via-transparent to-ai-purple/5 opacity-50 pointer-events-none"></div>
                    <div class="grid grid-cols-1 lg:grid-cols-12 relative z-10 items-stretch">
                        <div class="lg:col-span-4 p-10 lg:p-14 flex flex-col justify-center bg-black/30 lg:border-r border-white/10">
                            <h4 class="text-3xl font-black text-white uppercase tracking-tighter mb-4 flex items-center gap-4"><i class="fas fa-lightbulb text-[#fb923c] drop-shadow-[0_0_10px_rgba(251,146,60,0.5)]"></i> Lesson Learned</h4>
                        </div>
                        <div class="lg:col-span-8 p-10 lg:p-12 grid grid-cols-1 md:grid-cols-2 gap-8">
                            <div class="space-y-4">
                                <div class="glass-card p-6 rounded-2xl border-white/10 hover:border-ai-cyan/40 transition-colors">
                                    <p class="text-ai-cyan font-black uppercase text-[10px] tracking-[0.2em] mb-2 flex items-center gap-2"><i class="fas fa-cogs text-sm"></i> Automation Mindset</p>
                                    <p class="text-sm text-gray-300 leading-relaxed italic text-justify">Leveraged no-code/low-code tools (n8n, Apify) to automate repetitive research tasks, freeing up time for strategic analysis.</p>
                                </div>
                                <div class="glass-card p-6 rounded-2xl border-white/10 hover:border-ai-purple/40 transition-colors">
                                    <p class="text-ai-purple font-black uppercase text-[10px] tracking-[0.2em] mb-2 flex items-center gap-2"><i class="fas fa-microscope text-sm"></i> Product Research</p>
                                    <p class="text-sm text-gray-300 leading-relaxed italic text-justify">Developed end-to-end market research pipelines combining web scraping, community listening, and AI analysis for data-driven product decisions.</p>
                                </div>
                            </div>
                            <div class="glass-card p-6 rounded-2xl border-white/10 hover:border-white/40 transition-colors h-full flex flex-col">
                                <p class="text-white font-black uppercase text-[10px] tracking-[0.2em] mb-3 flex items-center gap-2 border-b border-white/10 pb-3"><i class="fas fa-handshake text-sm"></i> Cross-functional Collaboration</p>
                                <p class="text-sm text-gray-300 leading-relaxed italic flex-1 text-justify">Strengthened ability to work across Sales, Design, and R&amp;D teams to translate market data into actionable product specifications.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-center mt-24 pb-10">
                <button onclick="closeKarofiShowcase()" class="px-16 py-6 glass-card bg-white/5 border border-white/20 text-white hover:bg-white/20 hover:scale-105 transition-all font-black uppercase tracking-[0.4em] text-xs shadow-[0_0_40px_rgba(255,255,255,0.1)] rounded-full"><i class="fas fa-times mr-2 text-lg"></i> Close Experience</button>
            </div>
        </div>
    </div>

'@

$karofiJS = @'
        function openKarofiShowcase() {
            const sc = document.getElementById('karofi-showcase');
            if (!sc) return;
            sc.classList.remove('hidden');
            document.body.style.overflow = 'hidden';
            setTimeout(() => { sc.classList.remove('opacity-0', 'scale-105'); sc.classList.add('opacity-100', 'scale-100'); }, 10);
        }
        function closeKarofiShowcase() {
            const sc = document.getElementById('karofi-showcase');
            if (!sc) return;
            sc.classList.add('opacity-0', 'scale-105');
            document.body.style.overflow = '';
            setTimeout(() => sc.classList.add('hidden'), 500);
        }
'@

# Use LF-only line endings to match the file
$showcaseHTML = $showcaseHTML.Replace("`r`n", "`n")
$karofiJS = $karofiJS.Replace("`r`n", "`n")

# Find the insertion point: "    <script>\n        function previewImage"
$marker = "    <script>`n        function previewImage"
$markerIdx = $content.IndexOf($marker)

if ($markerIdx -ge 0) {
    $replacement = $showcaseHTML + "    <script>`n" + $karofiJS + "`n        function previewImage"
    $content = $content.Substring(0, $markerIdx) + $replacement + $content.Substring($markerIdx + $marker.Length)
    Write-Host "2) Inserted Karofi showcase modal and JS functions"
} else {
    Write-Host "2) WARNING: Could not find insertion marker"
    Write-Host "Searching for alternative..."
    $alt = $content.IndexOf("<script>`n        function previewImage")
    Write-Host "Alt index: $alt"
}

# Write back with UTF-8 no BOM
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText('c:\Users\ASUS\Downloads\port2\index.html', $content, $utf8NoBom)

# Verify
$v = [System.IO.File]::ReadAllText('c:\Users\ASUS\Downloads\port2\index.html', [System.Text.Encoding]::UTF8)
Write-Host "`nVerification:"
Write-Host "Spline preload: $($v.Contains('Preload Spline Scene'))"
Write-Host "Spline section: $($v.Contains('3D SPLINE VIEWER SECTION'))"
Write-Host "Loading text: $($v.Contains('Loading...'))"
Write-Host "karofi-showcase div: $($v.Contains('karofi-showcase'))"
Write-Host "openKarofiShowcase fn: $($v.Contains('openKarofiShowcase'))"
Write-Host "closeKarofiShowcase fn: $($v.Contains('closeKarofiShowcase'))"
Write-Host "File length: $($v.Length) chars"
