function [x, time, errore_relativo, memory_used_preResolution, memory_used_postResolution] = CholeskySolve(matrix)
   
fprintf(strcat('\n-- Stato memoria pre risoluzione sistema:\n'))
memory
memory_used_preResolution = memory;

%---risoluzione sistema lineare---
% Dimensione della matrice
n = size(matrix, 1);

fprintf(strcat('\n-- Numeri di non zero:\n'))
nnz(matrix)

% Inizializza il termine noto b come un vettore come il prodotto tra A e un vettore di tutti 1
b = matrix*ones(size(matrix,1),1); 
%per il valore vero ci hanno suggerito di mettere \ ma non sembra funzionare

tic
% Calcola la matrice triangolare inferiore R di A utilizzando il metodo di Cholesky
R = chol(matrix, 'lower'); %A = R' R con R triangolare sup.
%R = chol(ex15_matrix); 
%If S is a symmetric (or Hermitian), positive definite, sparse matrix, the statement R = chol(S) returns a sparse, upper triangular matrix R so that R'*R = S.

% Risolvi il sistema Ly = b utilizzando \
y = R\b; %fare sostituzione in indietro perchè R' è tringolare superiore 

% Risolvi il sistema L'x = y utilizzando \
x = R'\y; %fare sostituzione in avanti perchè R' è tringolare inferiore 

time = toc;


fprintf('\n-- Tempo necessario per risolvere il sistema con Cholesky in secondi:\n%s\n ', num2str(time));
% todo in doc specificare perchè ad ogni esecuzione non impiega esattamente
%  lo stesso tempo in secondi

% Misura l'utilizzo di memoria RAM
fprintf(strcat('\n-- Stato memoria post risoluzione sistema:\n'))
memory
memory_used_postResolution = memory;

% Da usare per misurare l'utilizzo di memoria del processo matlab usando
% Linux, capire come usarlo e mettere una condizione per capire che sistema
% operativo si sta utilizzando
% [tmp pid] = system('pgrep MATLAB');
% [tmp mem_usage] = system(['cat /proc/' strtrim(pid) '/status | grep VmSize']);
%fprintf("%i MB\n", round(str2num(strtrim(extractAfter(extractBefore(mem_usage, ' kB'), ':'))) / 1000));


% Calcola l'errore relativo tra x e xe utilizzando la norma euclidea
xe = ones(n, 1); % Assumiamo xe come un vettore di tutti 1 per semplicità nell'esempio
norm_xe = norm(xe, 2); % Calcola la norma euclidea di xe
errore_relativo = norm(x - xe, 2) / norm_xe; % Calcola l'errore relativo
fprintf('\n-- Errore relativo tra x e xe:%s ', num2str(errore_relativo));

% Creazione del grafico
figure;
semilogy(n, time, '-o', 'DisplayName', 'Tempo'); % Tempo sulla scala delle ordinate con simboli a forma di cerchio
hold on;
semilogy(n, errore_relativo, '-x', 'DisplayName', 'Errore Relativo'); % Errore relativo sulla scala delle ordinate con simboli a forma di x
semilogy(n, memory_used_postResolution.MemUsedMATLAB, '-s', 'DisplayName', 'Memoria Utilizzata'); % Memoria utilizzata sulla scala delle ordinate con simboli a forma di quadrato
xlabel('Dimensione della Matrice'); % Etichetta dell'asse delle ascisse
ylabel('Valore'); % Etichetta dell'asse delle ordinate
title('Grafico Tempo, Errore Relativo, e Memoria Utilizzata'); % Titolo del grafico
legend('show'); % Mostra la legenda con i nomi delle curve
grid on; % Mostra una griglia nel grafico
hold off;

end







    
    
  

    
    
    
    
    
      





% Capire se serve verifica se la matrice è simmetrica e poi continua
%if isequal(matrix, matrix')
    %disp('La matrice è simmetrica.');
%else
   % disp('La matrice non è simmetrica.');
%end
% Verifica se la matrice è definita positiva
%if all(eig(ex15_matrix) > 0)
   % disp('La matrice è definita positiva.');
%else
    %disp('La matrice non è definita positiva.');
%end
%oppure
% Verifica se una matrice A è definita positiva utilizzando il criterio di Sylvester
%if all(det(ex15_matrix(1:i, 1:i)) > 0)
 %   fprintf('La matrice è definita positiva.\n');
%else
 %   fprintf('La matrice non è definita positiva.\n');
%end
%in entrambi i casi da errore "out of memory"







