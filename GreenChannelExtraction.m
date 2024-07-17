% Ana klasör yolunu belirtin
ana_klasor_yolu = '..............';
yeni_ana_klasor_yolu = '............';

% Fonksiyonu çağır
alt_klasorleri_oku_ve_isle(ana_klasor_yolu, yeni_ana_klasor_yolu);


function alt_klasorleri_oku_ve_isle(ana_klasor_yolu, yeni_ana_klasor_yolu)
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

                % Resmi oku
                resim = imread(dosya_yolu);

                % Yeşil kanalı çıkar
                yesil_kanal = resim(:,:,2); % Yeşil kanal RGB görüntüde 2. kanal (MATLAB 1'den başlar)

                % Yeni dosya adını belirt
                yeni_dosya_adi = sprintf('greenC_%s', dosya_adi);
                yeni_dosya_yolu = fullfile(yeni_alt_klasor_yolu, yeni_dosya_adi);

                % Yeşil kanalı içeren görüntüyü kaydet
                imwrite(yesil_kanal, yeni_dosya_yolu);
            end

            % Eğer alt klasör içinde başka alt klasörler varsa, özyinelemeli olarak fonksiyonu çağır
            alt_klasorleri_oku_ve_isle(alt_klasor_yolu, yeni_alt_klasor_yolu);
        end
    end
end

