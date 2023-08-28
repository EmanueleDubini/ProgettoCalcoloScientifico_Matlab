function [x, time, errore_relativo, memory_used_preResolution, memory_used_postResolution] = CholeskySolve(matrix)


memory_used_preResolution = get_memory_usage();
fprintf('\n-- Stato memoria pre risoluzione sistema: %d byte\n', memory_used_preResolution)


%---risoluzione sistema lineare---
% Numero di righe della matrice
n = size(matrix, 1);

% Inizializza il termine noto b come un vettore dato dal prodotto tra A e un vettore di tutti 1
b = matrix*ones(size(matrix,1),1); 

tic

% Calcola la matrice triangolare inferiore R di A utilizzando il metodo di Cholesky
%A = R' R con R triangolare sup.
R = chol(matrix); 
%Se S è una matrice sparsa simmetrica (o Hermitiana), definita positiva, l'istruzione R = chol(S) restituisce una matrice R sparsa e triangolare superiore in modo che R'*R = S.

% Risolvi il sistema R'y = b utilizzando \
%fare sostituzione in avanti perchè R' è tringolare inferiore
y = R'\b;   

% Risolvi il sistema R'x = y utilizzando \
%fare sostituzione in indietro perchè R è tringolare superiore 
x = R\y; 

time = toc;


% Stampa del tempo in secondi
fprintf('\n-- Tempo necessario per risolvere il sistema con Cholesky in secondi: %s \n ', num2str(time));


% Misura l'utilizzo di memoria RAM
% Serve per controllare mem su linux 
memory_used_postResolution = get_memory_usage();
fprintf('\n-- Stato memoria post risoluzione sistema: %d byte\n', memory_used_postResolution)

% Calcola l'errore relativo tra x e xe utilizzando la norma euclidea
% Assumiamo xe come un vettore di tutti 1 per semplicità
xe = ones(n, 1); 
% Calcola la norma euclidea di xe (vettore soluzioni esatte)
norm_xe = norm(xe, 2); 
% Calcola l'errore relativo
errore_relativo = norm(x - xe, 2) / norm_xe; 
% Stampa dell'errore relativo
fprintf('\n-- Errore relativo tra x e xe:%s\n ', num2str(errore_relativo));

end

function [memory_used] = get_memory_usage()
    if ispc() 
        % Se il sistema operativo è Windows
        m = memory();
        memory_used = m.MemUsedMATLAB;
    else
        % Se il sistema operativo è Linux
        [~, result] = system('free -b | grep Mem');
        memory_info = strsplit(result);
        memory_used = str2double(memory_info{3});
    end
end