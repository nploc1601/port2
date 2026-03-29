const fs = require('fs');

try {
    const html = fs.readFileSync('c:/Users/ASUS/Downloads/port2/index.html', 'utf8');

    const countOpen = (tag) => (html.match(new RegExp(`<${tag}(>|\\s)`, 'gi')) || []).length;
    const countClose = (tag) => (html.match(new RegExp(`</${tag}>`, 'gi')) || []).length;

    const tagsToCheck = ['div', 'section', 'span', 'i', 'p', 'h1', 'h2', 'h3', 'a', 'button'];
    
    console.log("Tag matching check:");
    let allGood = true;
    for (const tag of tagsToCheck) {
        const open = countOpen(tag);
        // Special case for self-closing or empty ones
        const close = countClose(tag);
        
        if (open !== close) {
            console.log(`Mismatch for <${tag}>: Open=${open}, Close=${close}`);
            allGood = false;
        } else {
            console.log(`Match for <${tag}>: ${open}`);
        }
    }
    if (allGood) console.log("All checked tags are perfectly balanced!");
} catch (e) {
    console.error(e);
}
