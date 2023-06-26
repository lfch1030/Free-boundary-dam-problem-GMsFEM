
nrow=10
ncol=5;
fid = fopen('table.txt', 'wt');

        fprintf(fid,'\\begin{table}[htb] \n');
        fprintf(fid,'\\centering \n');
        fprintf(fid,'\\begin{tabular}{|');
        for i=0:ncol
            fprintf(fid,'c|');
        end
        fprintf(fid,'}\\hline\n');
        fprintf(fid, ' $\\mu \\downarrow$ $n_i\\times n_i \\to$ ');

        for i=1:ncol
            fprintf(fid, '& $ \\times %d$ ',2^(i));
        end
        fprintf(fid, '\\\\ \\hline\n');
        for j=1:nrow
            fprintf(fid, ' $%g $ ', 2^j);
            for i=1:ncol
                fprintf(fid, '& %d (%.2f)',Siter(j,i), Scond(j,i));
            end
            fprintf(fid, '\\\\\n');
        end
        fprintf(fid,' \\hline\\hline \n');
        fprintf(fid,'\\end{tabular} \n');
        fprintf(fid, '\\caption{ PCG iterations count and condition number.\n');
        fprintf(fid, 'Here $contrast =% d$}, \n',M);
        fprintf(fid,'\\label{urlabelhere}\n');
        fprintf(fid,'\\end{table}');

fclose(fid)