var katex = require("katex");

var text = "";

process.stdin.setEncoding("utf8");
process.stdin.on("readable", function() {
    while ((chunk = process.stdin.read()) !== null) {
      text += chunk;
    }
});
process.stdin.on("end", function() {
    var start = 0;
    var i = 0;
    while (i < text.length) {
        if (text.slice(i, i + 2) == "\\[") {
            process.stdout.write(text.slice(start, i));
            start = i + 2;
            i = start;
            while (text.slice(i, i + 2) != "\\]" && i < text.length) {
                i++;
            }
            process.stdout.write(katex.renderToString(text.slice(start, i), { output: "html", displayMode: true }));
            start = i + 2;
            i = start;
        } else if (text.slice(i, i + 2) == "\\(") {
            process.stdout.write(text.slice(start, i));
            start = i + 2;
            i = start;
            while (text.slice(i, i + 2) != "\\)" && i < text.length) {
                i++;
            }
            process.stdout.write(katex.renderToString(text.slice(start, i), { output: "html" }));
            start = i + 2;
            i = start;
        } else {
            i++;
        }
    }
    if (i > start) {
        process.stdout.write(text.slice(start, i));
    }
});
