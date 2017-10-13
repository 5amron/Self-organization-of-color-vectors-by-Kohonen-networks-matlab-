%% samanSadeghyan
% project Self organization of color vectors (Kohonen networks)
% first, you should add the somtoolbox2_Mar_17_2005 tool box in your path


%% disorder sample
sample = rand(25,25,3);
%image(sample)

%% setting variables and prameters
input = rand(10000,3);     %input for training
m_size = [25 25];           %using a square SOM array (lattice) of the size 25 by 25 nodes, which is defined by the vector msize =[25 25]
lattice = 'rect';          %SOM array as rectangular
radius_coarse = [10 7];
radius_fine = [7 5];
trainlen_coarse = 50;
trainlen_fine = 50;

%% training the network
smI = som_lininit(input,'msize',m_size,'lattice',lattice,'shape','sheet');
smC = som_batchtrain(smI,input,'radius',radius_coarse,'trainlen',trainlen_coarse,'neigh','gaussian');
sm = som_batchtrain(smC,input,'radius',radius_fine,'trainlen',trainlen_fine,'neigh','gaussian');

%% displaying the results
color_shades = sm.codebook; % color shades
out = zeros(25,25,3);       %creating space for output
for i = 1:25
    for j = 1:25
        n = 25*(i-1) + j;
        out(i,j,1) = color_shades(n,1);
        out(i,j,2) = color_shades(n,2);
        out(i,j,3) = color_shades(n,3);
    end
end

subplot(1,2,1), subimage(sample)
subplot(1,2,2), subimage(out)