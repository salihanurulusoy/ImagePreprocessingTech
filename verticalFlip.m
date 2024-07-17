
% Dosya yolu
dosya_yolu = 'C:\Users\salih\Desktop\G1020-1\Original\TrainSet\1'; % Klasörün yolunu buraya girin
dosya_uzantisi = '.jpg'; % Dosya uzantısını buraya girin

% Klasördeki dosyaları al
dosyalar = dir(fullfile(dosya_yolu, ['*', dosya_uzantisi]));

% Her bir dosya için dikey flip yap ve kaydet
for i = 1:numel(dosyalar)
    % Dosya adını al
    dosya_adi = dosyalar(i).name;
    
    % Resmi oku
    resim = imread(fullfile(dosya_yolu, dosya_adi));
    
    % Dikey flip yap
    dikey_flip_resim = flipud(resim);
    
    % Yeni dosya adı
    yeni_dosya_adi = ['verticalF_', dosya_adi];
    
    % Dikey flip yapılmış resmi kaydet
    imwrite(dikey_flip_resim, fullfile(dosya_yolu, yeni_dosya_adi));
end