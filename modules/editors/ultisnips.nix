{ config, pkgs, ... }: {
  home.file."~/.vim/UltiSnips/tex.snippets".text = ''
    snippet template "basic template" b
    \\documentclass[11pt, a4paper]{article}

    \\usepackage[utf8]{inputenc}
    \\usepackage[T1]{fontenc}    
    \\usepackage{amsmath, amssymb} 
    \\usepackage{parskip}
    \\usepackage{graphicx}       
    \\usepackage{hyperref}       
    \\usepackage{geometry}       
    \\geometry{margin=1in}       

    \\title{$1}
    \\author{$2}
    \\date{\\today} 

    \\begin{document}

    \\maketitle 
    \\tableofcontents

    \\newpage

    $0

    \\end{document}

    endsnippet

    snippet beg "begin and end" bA
    \\begin{$1}
        $0
    \\end{$1}
    endsnippet

    snippet // "Fraction" iA
    \\\\frac{$1}{$2}$0
    endsnippet
  '';
}
