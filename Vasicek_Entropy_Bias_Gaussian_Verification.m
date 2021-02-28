% ------------ Random Gaussian Distribution Entropi Calculator ---------------

clc;
clear all;
clear vars;

x = [-5:.1:5];

% % Var = 1 Datasets
gaussian_ran_dist_1_20_100 = normrnd(0,1,20,100); %var = 1, 20x100 dataset
gaussian_ran_dist_1_20_200 = normrnd(0,1,20,200); %var = 1, 20x200 dataset
gaussian_ran_dist_1_20_500 = normrnd(0,1,20,500); %var = 1, 20x500 dataset
gaussian_ran_dist_1_20_100_pdf = normpdf(x,0,1); %var = 1 pdf


% % Var = 2 Datasets
gaussian_ran_dist_2_20_100 = normrnd(0,sqrt(2),20,100); %var = 1, 20x100 dataset
gaussian_ran_dist_2_20_200 = normrnd(0,sqrt(2),20,200); %var = 2, 20x200 dataset
gaussian_ran_dist_2_20_500 = normrnd(0,sqrt(2),20,500); %var = 2, 20x500 dataset
gaussian_ran_dist_2_20_100_pdf = normpdf(x,0,sqrt(2));


% % Var = 5 Datasets
gaussian_ran_dist_5_20_100 = normrnd(0,sqrt(5),20,100); %var = 5, 20x100 dataset
gaussian_ran_dist_5_20_200 = normrnd(0,sqrt(5),20,200); %var = 5, 20x200 dataset
gaussian_ran_dist_5_20_500 = normrnd(0,sqrt(5),20,500); %var = 5, 20x500 dataset
gaussian_ran_dist_5_20_100_pdf = normpdf(x,0,sqrt(5));

figure(1)
subplot(231)
plot(gaussian_ran_dist_1_20_100);
subplot(234)
plot(x,gaussian_ran_dist_1_20_100_pdf);
subplot(232)
plot(gaussian_ran_dist_2_20_100);
subplot(235)
plot(x,gaussian_ran_dist_2_20_100_pdf);
subplot(233)
plot(gaussian_ran_dist_5_20_100);
subplot(236)
plot(x,gaussian_ran_dist_5_20_100_pdf);

% % Var = 1 Datasets' Entropies
vas_ent_bias_1_20_100 = Vasicek_bias_function(gaussian_ran_dist_1_20_100,20);
vas_ent_bias_1_20_200 = Vasicek_bias_function(gaussian_ran_dist_1_20_200,20);
vas_ent_bias_1_20_500 = Vasicek_bias_function(gaussian_ran_dist_1_20_500,20);

% % Var = 2 Datasets' Entropies
vas_ent_bias_2_20_100 = Vasicek_bias_function(gaussian_ran_dist_2_20_100,20);
vas_ent_bias_2_20_200 = Vasicek_bias_function(gaussian_ran_dist_2_20_200,20);
vas_ent_bias_2_20_500 = Vasicek_bias_function(gaussian_ran_dist_2_20_500,20);

% % Var = 5 Datasets' Entropies
vas_ent_bias_5_20_100 = Vasicek_bias_function(gaussian_ran_dist_5_20_100,20);
vas_ent_bias_5_20_200 = Vasicek_bias_function(gaussian_ran_dist_5_20_200,20);
vas_ent_bias_5_20_500 = Vasicek_bias_function(gaussian_ran_dist_5_20_500,20);

