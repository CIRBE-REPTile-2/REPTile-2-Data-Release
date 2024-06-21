trange = ['2023-04-19';'2024-04-15'];
start_datenum = datenum(trange(1,:));
end_datenum = datenum(trange(2,:));

for i = start_datenum:end_datenum
    file_datestring = datestr(i,"yyyy_mm_dd");
    file_path_1 = ['CIRBE_L1_combined_science_',file_datestring,'_V0.nc'];
    fileID_CIRBE_1 = fopen(file_path_1);
    if fileID_CIRBE_1 > 0
        datestring = datestr(i,'yyyymmdd');
        Datafilename = join(["CIRBE_REPTile-2_L1_",datestring,"v1_1.nc"],"");
        ncid = netcdf.create(Datafilename,'CLOBBER');
    end
end
