% Column 1 (Equipment):1 is WT901BLE68(e5:67:53:7a:26:25)(e5:67:53:7a:26:25)   2 is WT901BLE67(ea:e4:fd:d7:dc:2a)(ea:e4:fd:d7:dc:2a)   3 is WT901BLE67(cd:75:20:e1:ef:ef)(cd:75:20:e1:ef:ef)   
% Column 2:Chip Time   The interval (in seconds) between each piece of data and the start time, with the start time as the starting point
% Column 3:Angle X(°)
% 函数调用：a=readMatData;
function d = readMatData(file)

    if nargin<1
        disp('默认数据')
        file='data.mat';
    else
        disp(file);
    end

    disp('加载mat文件')
    load('data.mat')
    S=whos;
    len = length(S)-1;
    dend = eval(S(len).name);
    d1 = eval(S(1).name);
    len_m = length(d1);
    len_n = length(d1(1,:));

    d=zeros(len_m*(len-1)+length(dend),len_n);
    %h=waitbar(0,'数据合并中……');
    for i=1:len-1
        dTemp = eval(S(i).name);
        d(len_m*(i-1)+1:len_m*i,:)=[dTemp];
        m=len-1;
        %p=fix(i/(m)*len_m)/100; %这样做是可以让进度条的%位数为2位
        %str=['正在合并，目前进度为 ',num2str(p),' %，完成 ',num2str(i),'/',num2str(m)];%进度条上显示的内容
        %waitbar(i/m,h,str);
    end
    d(len_m*(len-1)+1:len_m*(len-1)+length(dend),:)=dend;

end