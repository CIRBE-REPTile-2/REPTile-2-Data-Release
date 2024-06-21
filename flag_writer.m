tinfo  = double(ncread("CIRBE_L1_combined_science_2023_05_13_V0.nc","Epoch"));

flaginfo = zeros(length(tinfo),1);
flaginfo(2567:end) = 1;

ncwrite('CIRBE_REPTile-2_L1_20230513v1_1.nc','invalid_data_flag',flaginfo)

trange = ['2023-05-14';'2023-05-18'];
start_datenum = datenum(trange(1,:));
end_datenum = datenum(trange(2,:));

for i = start_datenum:end_datenum
    file_datestring = datestr(i,"yyyy_mm_dd");
    file_path = ['CIRBE_L1_combined_science_',file_datestring,'_V0.nc'];
    timeinfo = length(double(ncread(file_path,"Epoch")));
    finfo = ones(timeinfo,1);
    datestring = datestr(i,"yyyymmdd"); 
    file_path_2 = ['CIRBE_REPTile-2_L1_',datestring,'v1_1.nc'];
    ncwrite(file_path_2,'invalid_data_flag',finfo)
end

tinfo2 = datetime(double(ncread("CIRBE_L1_Nom_science_2023_05_19_V0.nc","time_ymdhms"))');
flaginfo2 = zeros(length(tinfo2),1);
flaginfo2(1032:end) = 1;

ncwrite('CIRBE_REPTile-2_L1_20230519v1_1.nc','invalid_data_flag',flaginfo2)

