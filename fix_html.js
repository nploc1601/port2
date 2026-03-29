const fs = require('fs');

try {
    let html = fs.readFileSync('c:/Users/ASUS/Downloads/port2/index.html', 'utf8');

    let count1 = 0;
    html = html.replace(/<!-- DEPARTMENT PROJECTS MODAL \(NYF & TNTH\) -->\s*<\/section>/is, () => { 
        count1++; 
        return '<!-- DEPARTMENT PROJECTS MODAL (NYF & TNTH) -->'; 
    });

    let count2 = 0;
    html = html.replace(/<\/div>\s*<\/section>\s*<!-- Academic Record -->/is, () => { 
        count2++; 
        return '</div>\n\n    <!-- Academic Record -->'; 
    });

    let count3 = 0;
    html = html.replace('<img id="tool-brevo" src="logo brevo.png" class="w-4 h-4"></i>', () => { 
        count3++; 
        return '<img id="tool-brevo" src="logo brevo.png" class="w-4 h-4">'; 
    });

    let count4 = 0;
    html = html.replace(/<img\s([^>]+)>/gi, (match, p1) => {
        if (!/alt\s*=/i.test(match)) {
            count4++;
            if (match.endsWith('/>')) {
                return `<img ${p1.slice(0, -1)} alt="" />`;
            } else {
                return `<img ${p1} alt="">`;
            }
        }
        return match;
    });

    fs.writeFileSync('c:/Users/ASUS/Downloads/port2/index.html', html);
    console.log(`Fixes applied: count1=${count1}, count2=${count2}, count3=${count3}, count4=${count4} (missing alt tags)`);
} catch (err) {
    console.error(err);
}
