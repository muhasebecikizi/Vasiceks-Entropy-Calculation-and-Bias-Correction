function Vasicek_ent_bias = Vasicek_bias_function(M,Mrow)
asil_matrix = M;
a = asil_matrix;
n = length(asil_matrix);
%satýrlardaki elemanlarý küçükten büyüðe sýralýyoruz
a = sort(a,2);
% açýk fonksiyonu da çalýþýyor
% for row = 1:Mrow
% for i= 1:length(a)-1
%     enk = a(row,i);
%     enk_indis = i;
%     for j=i+1:length(a)
%         if a(row,j) < enk
%             enk = a(row,j);
%             enk_indis = j;
%         end         
%     end 
%     depo = a(row,i);
%     a(row,i) = a(row,enk_indis);
%     a(row,enk_indis) = depo;    
% end
% end

% % % % % Vasicek Entropi hesabý
% % % % % Her bir satýrdaki iþlem baþlangýcýnda
% % % % % i=1 için 0ýncý eleman olamayacaðý için fark_ilk deðiþkenini
% % % % % kendimiz tanýmlayýp, bir toplam oluþturuyoruz
for row2 = 1:Mrow
bolum_ilk(row2) = n/2;
fark_ilk(row2) = a(row2,2)-a(row2,1);
carpim_ilk(row2) = bolum_ilk(row2).*fark_ilk(row2);
V_ent_ilk_top(row2) = log(carpim_ilk(row2));
end

V_ent_1son = V_ent_ilk_top;

for row3 = 1:Mrow
for j = 2:1:(n-1) %column counter
    bolum(row3,j) = n/2;
    fark(row3,j) =  a(row3,j+1) - a(row3,j-1); 
    carpim(row3,j) = bolum(row3,j).*fark(row3,j);
    V_ent_1(row3,j) = log (carpim(row3,j));
    V_ent_1son(row3) = V_ent_1son(row3) + V_ent_1(row3,j);
    V_ent_1sonn(row3) = (1/n) * V_ent_1son(row3);
    end
end

V_ent_1son_1_toplam = 0;
for k = 1:Mrow
    V_ent_1son_1_toplam = V_ent_1son_1_toplam + V_ent_1sonn(k);
    V_ent_1son_1_ortalama = V_ent_1son_1_toplam / Mrow;
end

vas_ent = V_ent_1son_1_ortalama;

% % % % % Vasicek Bias Corrected Entropi Hesabý
digamma1 = psi(2);
digamma2 = psi(n+1);
digamma3 = psi(1);


for i = 1:Mrow
    for j = 1:1:(n-1) %column counter
        V_bias_1(i) = V_ent_1sonn(i) - log(n)+ log(2) - ((1-(2/n)) * psi(2)) + psi(n+1) - ((2/n)*psi(1));
    end
end

V_bias_1_toplam = 0;
for z = 1:Mrow
    V_bias_1_toplam = V_bias_1_toplam + V_bias_1(z);
    V_bias_1_ortalama = V_bias_1_toplam / Mrow;
end
vas_bias_cor = V_bias_1_ortalama;
SS_bias = std(V_bias_1);
mean_bias = mean(V_bias_1);

Vasicek_ent_bias = [vas_ent vas_bias_cor SS_bias mean_bias];
end
