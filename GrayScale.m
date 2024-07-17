
% Ana klasör yolunu belirtin
ana_klasor_yolu = 'C:\Users\salih\Desktop\DATASET KÜÇÜK2';
yeni_ana_klasor_yolu = 'C:\Users\salih\Desktop\gggggKÜÇÜK2';

% Fonksiyonu çağır
alt_klasorleri_oku_ve_isle_gray(ana_klasor_yolu, yeni_ana_klasor_yolu);


function alt_klasorleri_oku_ve_isle_gray(ana_klasor_yolu, yeni_ana_klasor_yolu)
    % Ana klasördeki tüm alt klasörleri al
    alt_klasor_listesi = dir(ana_klasor_yolu);
    alt_klasor_listesi = alt_klasor_listesi([alt_klasor_listesi.isdir]); % Sadece klasörleri al

    % Her bir alt klasör için döngü
    for i = 1:numel(alt_klasor_listesi)
        if ~strcmp(alt_klasor_listesi(i).name, '.') && ~strcmp(alt_klasor_listesi(i).name, '..')
            alt_klasor_adi = alt_klasor_listesi(i).name;
            alt_klasor_yolu = fullfile(ana_klasor_yolu, alt_klasor_adi);

            % Yeni alt klasör oluştur
            yeni_alt_klasor_yolu = fullfile(yeni_ana_klasor_yolu, alt_klasor_adi);
            mkdir(yeni_alt_klasor_yolu);

            % Alt klasördeki tüm dosyaları al
            dosya_listesi = dir(fullfile(alt_klasor_yolu, '*.jpg')); % ya da uygun dosya uzantısını kullanabilirsiniz

            % Her bir dosya için döngü
            for j = 1:numel(dosya_listesi)
                dosya_adi = dosya_listesi(j).name;
                dosya_yolu = fullfile(alt_klasor_yolu, dosya_adi);

                % Resmi oku ve gri tonlamaya çevir
                resim = imread(dosya_yolu);
                gray_resim = rgb2gray(resim);

                % Yeni dosya adını belirt
                yeni_dosya_adi = sprintf('gray_%s', dosya_adi);
                yeni_dosya_yolu = fullfile(yeni_alt_klasor_yolu, yeni_dosya_adi);

                % Gri tonlamalı görüntüyü kaydet
                imwrite(gray_resim, yeni_dosya_yolu);
            end

            % Eğer alt klasör içinde başka alt klasörler varsa, özyinelemeli olarak fonksiyonu çağır
            alt_klasorleri_oku_ve_isle_gray(alt_klasor_yolu, yeni_alt_klasor_yolu);
        end
    end
end
