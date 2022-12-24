fid_input = fopen('병합.txt', 'r');
fid_output = fopen('병합_결과.txt', 'w');

% while 1
for i = 1:1269189
    line = fgets(fid_input);

    % 기록된 data 끝나면 종료
%     if line == -1
%         break
%     end

    raw = {};
    raw = strsplit(line,',');
    t_geton = raw{18};
    t_geton2 = str2double(t_geton(10:15));

    if t_geton2 > 050000 && t_geton2 < 100000
        RAW(i,:) = textscan(line(1:end),'%d64%d64%s%s%d64%d64%f%f%f%f%f%f%s%f%f%s%d64%d64%d64%d64%s%s%s%s%d64%d64','delimiter',',');

        fprintf(fid_output,'%f %f %f %f\n',cell2mat(RAW(i,7)), cell2mat(RAW(i,8)), cell2mat(RAW(i,11)), cell2mat(RAW(i,12)));
    end

end

fclose(fid_input);
fclose(fid_output);