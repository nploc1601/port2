import re
with open('c:/Users/ASUS/Downloads/port2/index.html', 'r', encoding='utf-8') as f:
    html = f.read()

# Fix 1: Stray </section> at 1204
html = html.replace('<!-- DEPARTMENT PROJECTS MODAL (NYF & TNTH) -->\n     </section>', '<!-- DEPARTMENT PROJECTS MODAL (NYF & TNTH) -->')

# Fix 2: Another stray </section> around 1317
html = html.replace('</div>    \n        </section>', '</div>    ')

# Fix 3: Stray </i> at 1568
html = html.replace('<img id="tool-brevo" src="logo brevo.png" class="w-4 h-4"></i>', '<img id="tool-brevo" src="logo brevo.png" class="w-4 h-4">')

# Fix 4: Add missing alt to <img>
def add_alt(match):
    tag = match.group(0)
    if 'alt=' not in tag.lower():
        if tag.endswith('/>'):
            return tag[:-2] + ' alt="" />'
        elif tag.endswith('>'):
            return tag[:-1] + ' alt="">'
    return tag

html = re.sub(r'<img\s+[^>]+>', add_alt, html, flags=re.IGNORECASE)

with open('c:/Users/ASUS/Downloads/port2/index.html', 'w', encoding='utf-8') as f:
    f.write(html)

print("Done fixing index.html")
