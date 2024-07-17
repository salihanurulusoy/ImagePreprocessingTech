% Dosya yolu
dosya_yolu = 'C:\Users\salih\Desktop\DATASET KÜÇÜK3\val\1'; % Klasörün yolunu buraya girin
dosya_uzantisi = '.jpg'; % Dosya uzantısını buraya girin

% Klasördeki dosyaları al
dosyalar = dir(fullfile(dosya_yolu, ['*', dosya_uzantisi]));

% Her bir dosya için rastgele zoom uygula ve kaydet
for i = 1:numel(dosyalar)
    % Dosya adını al
    dosya_adi = dosyalar(i).name;
    
    % Resmi oku
    resim = imread(fullfile(dosya_yolu, dosya_adi));
    
    % Rastgele zoom faktörü oluştur
    zoom_faktoru = rand(1) * 0.5 + 1; % 1 ile 1.5 arasında rastgele bir zoom
    
    % Zoom yap
    zoomlu_resim = imresize(resim, zoom_faktoru);
    
    % Yeni dosya adı
    yeni_dosya_adi = ['zoom_', dosya_adi];
    
    % Zoom yapılmış resmi kaydet
    imwrite(zoomlu_resim, fullfile(dosya_yolu, yeni_dosya_adi));
end
