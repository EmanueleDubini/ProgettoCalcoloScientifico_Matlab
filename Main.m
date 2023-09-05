clc
clear variables
close all


% Array contenente i nomi dei file delle matrici da caricare
matrixNames = {'ex15.mat', 'shallow_water1.mat', 'cfd1.mat','cfd2.mat'};
%matrixOutOfMemory = {'apache2.mat', 'Flan_1565.mat', 'Stocf-1465.mat', 'G3_circuit.mat', 'parabolic_fem.mat'};


array_time = zeros(1, length(matrixNames));
array_error = zeros(1, length(matrixNames));
array_memoryPre = zeros(1, length(matrixNames));
array_memoryPost = zeros(1, length(matrixNames));
array_memoryDiff = zeros(1, length(matrixNames));
array_matrixSize = zeros(1, length(matrixNames));

% Loop per caricare e analizzare le matrici una a una
for i = 1:length(matrixNames)

    % Carica la matrice dal file
    tmp = load(['Matrici/', matrixNames{i}]);
    matrix = tmp.Problem.A;
    clear tmp
    
    % Stampa il nome del file e le dimensioni della matrice
    fprintf('\n---------------------------- %s ----------------------------\n\n', matrixNames{i})
    whos matrix

    %funzione risoluzione sistema lineare
    [x, time, errore_relativo, memory_used_preResolution, memory_used_postResolution] = CholeskySolve(matrix);
    
    array_time(i) = time;
    array_error(i) = errore_relativo;
    array_memoryPre(i) = memory_used_preResolution;
    array_memoryPost(i) = memory_used_postResolution;
    array_memoryDiff(i) = memory_used_postResolution - memory_used_preResolution;      

    % Ottieni la dimensione del file mat
    file_info = dir(fullfile('Matrici/', matrixNames{i}));
    file_size = file_info.bytes;
   

    array_matrixSize(i) = file_size;  
end

fprintf('\n---------------------------- Risoluzione completata ----------------------------\n\n')

% Controlla se il programma viene usato su linux
if isunix() 
  filename = 'dati_matlab_linux.csv';
else
  filename = 'dati_matlab_windows.csv';
end

% Creazione delle tabelle con i dati
data = table(matrixNames' , array_matrixSize', array_memoryDiff', array_time', array_error', 'VariableNames', {'MatrixName', 'Size', 'MemoryDiff', 'Time', 'Error'});

% Scrive la tabella nel file CSV
writetable(data, filename);

fprintf('scrittura file csv completata')
fprintf('\n\n');