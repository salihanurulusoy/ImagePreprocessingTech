% Dosya yolu
dosya_yolu = 'C:\Users\salih\Desktop\G1020-1\Cropped\TrainSet\1'; % Klasörün yolunu buraya girin
dosya_uzantisi = '.jpg'; % Dosya uzantısını buraya girin

% Klasördeki dosyaları al
dosyalar = dir(fullfile(dosya_yolu, ['*', dosya_uzantisi]));

% Her bir dosya için yatay flip yap ve kaydet
for i = 1:numel(dosyalar)
    % Dosya adını al
    dosya_adi = dosyalar(i).name;
    
    % Resmi oku
    resim = imread(fullfile(dosya_yolu, dosya_adi));
    
    % Yatay flip yap
    yatay_flip_resim = fliplr(resim);
    
    % Yeni dosya adı
    yeni_dosya_adi = ['horizontalF_', dosya_adi];
    
    % Yatay flip yapılmış resmi kaydet
    imwrite(yatay_flip_resim, fullfile(dosya_yolu, yeni_dosya_adi));
end
