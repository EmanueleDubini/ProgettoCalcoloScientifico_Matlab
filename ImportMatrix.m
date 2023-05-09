clc
clear variables
close all

%DA AGGIUNGERE UNA VOLTA PROVATE TUTTE LE MATRICI E LASCIATO NELLA CARTELLA
%MATRICI SOLO QUELLE CHE NONO VANNO IN OUT OF MEMORY

% Ottieni la lista dei nomi dei file nella cartella 'Matrici'
%folder = 'Matrici';
%files = dir(fullfile(folder, '*.mat'));
% Loop per caricare e analizzare le matrici una a una
%array_time = zeros(1, length(files));
%array_error = zeros(1, length(files));
%array_memoryPre = zeros(1, length(files));
%array_memoryPost = zeros(1, length(files));
%for i = 1:length(files)
    % Carica la matrice dal file
 %   tmp = load(fullfile(folder, files(i).name));
  %  matrix = tmp.Problem.A;
   % clear tmp;
    % Altri comandi per analizzare la matrice
%end




% Array contenente i nomi dei file delle matrici da caricare
matrixNames = {'ex15.mat', 'cfd2.mat', 'cfd1.mat',  'shallow_water1'}; %'apache2.mat' aggiungere anche apache, ci mette tanto ad elaborare
%matrixOutOfMemory = {'Flan_1565.mat', 'Stocf-1465.mat', 'G3_circuit.mat', 'parabolic_fem.mat'};
% Loop per caricare e analizzare le matrici una a una

array_time = zeros(1, length(matrixNames));
array_error = zeros(1, length(matrixNames));
array_memoryPre = zeros(1, length(matrixNames));
array_memoryPost = zeros(1, length(matrixNames));
array_memoryDiff = zeros(1, length(matrixNames));


for i = 1:length(matrixNames)

    % Carica la matrice dal file
    %tmp = load(matrixNames{i});
    tmp = load(['Matrici/', matrixNames{i}]);
    matrix = tmp.Problem.A;
    clear tmp
    
    
    %stampa testo divisorio che mostra il nome della matrice da analizzare
    str_div = '----------------------------';
    str = strcat('\n', str_div, matrixNames{i}, str_div, '\n'); % Utilizzo della funzione strcat per concatenare le stringhe
    fprintf(str);

    strDimension = strcat('\n', '-- Dimensione matrice: ', '\n');
    fprintf(strDimension)
    whos matrix

    %funzione risoluzione sistema lineare
    [x, time, errore_relativo, memory_used_preResolution, memory_used_postResolution] = CholeskySolve(matrix);

    %disp(x)
    %disp(time)
    %disp(errore_relativo)
    %disp(memory_used_preResolution)
    %disp(memory_used_postResolution)

    array_time(i) = time;
    array_error(i) = errore_relativo;
    array_memoryPre(i) = memory_used_preResolution.MemUsedMATLAB;
    array_memoryPost(i) = memory_used_postResolution.MemUsedMATLAB;
    array_memoryDiff(i) = memory_used_postResolution.MemUsedMATLAB - memory_used_preResolution.MemUsedMATLAB;
    disp(memory_used_postResolution.MemUsedMATLAB);
end


% Creazione delle tabelle con i dati
data = table(matrixNames', array_memoryPre', array_memoryPost', array_memoryDiff', array_time', array_error', 'VariableNames', {'MatrixName', 'MemoryPre', 'MemoryPost', 'MemoryDif in Byte', 'Time', 'Error'});

% Scrive la tabella nel file CSV
writetable(data, 'dati.csv');

fprintf('\n\n');
fprintf('%.6f', array_time)

% Genera il grafico
%figure
%loglog(array_time, 'o-', 'LineWidth', 2, 'MarkerSize', 8)
%hold on
%loglog(array_error, 's-', 'LineWidth', 2, 'MarkerSize', 8)
%loglog(array_memoryPost, 'd-', 'LineWidth', 2, 'MarkerSize', 8)
%grid on
%xlabel('Dimensione della matrice (n)')
%ylabel('Tempo, Errore, Memoria utilizzata')
%legend('Tempo', 'Errore', 'Memoria utilizzata dopo risoluzione')
%set(gca, 'XTick', 1:length(matrixNames), 'XTickLabel', matrixNames)
%xtickangle(45)
%title('Risultati della risoluzione di sistemi lineari')

% Creazione del grafico a barre
%figure;
%barWidth = 0.2; % larghezza delle barre

% Barre per il tempo
%bar(1:length(matrixNames), log10(array_time), barWidth, 'b'); 
%hold on;

% Barre per l'errore
%bar((1:length(matrixNames)) + barWidth, log10(array_error), barWidth, 'g'); 
%hold on;

% Barre per la memoria post-risoluzione
%bar((1:length(matrixNames)) + 2*barWidth, log10(array_memoryDiff), barWidth, 'r'); 
%hold off;

% Assegnazione delle etichette sull'asse x
%xticks(1:length(matrixNames)*3); 
%xticklabels(matrixNames);
%xtickangle(45); % Angolo di inclinazione delle etichette sull'asse x

% Etichette sull'asse x, y e titolo del grafico
%xlabel('Matrice'); 
%ylabel('Valore (log10)'); 
%title('Grafico a barre delle informazioni di tempo, errore e memoria utilizzata');

% Legenda
%legend('Tempo', 'Errore', 'Memoria post-risoluzione', 'Location', 'northwest'); 