%% setting
clear;clc;close all;

extension = '.ply';
data_folder = 'D:\Data\Apple_Orchard\Lailiang_Cheng\LLC_04022022\Xiangtao_Segment\row 16\processed\name'; % folder storing original point cloud
save_folder = fullfile(data_folder, '..'); % folder storing extracted skeleton

files = dir([data_folder '\' '*' extension]);
files = natsortfiles(files);

if ~exist(save_folder, 'dir')
    mkdir(save_folder);
end

for i = 29:length(files)
    file = files(i);
    [filepath, name, ext] = fileparts(file.name);
    pc = pcread(fullfile(file.folder, file.name));
    pcwrite(pc, fullfile(save_folder, ['tree', name '.ply']), PLYFormat="binary");
end