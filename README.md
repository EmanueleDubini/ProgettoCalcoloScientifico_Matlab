# Progetto Metodi del Calcolo Scientifico - Matlab

>  Progetto MATLAB per la risoluzione con il metodo di Choleski di sistemi lineari con matrici sparse e definite positive di grandi dimensioni

## Introduzione

Questo Repository contiene il programma Matlab necessario per completare il progetto di Metdi del Calcolo Scientifico. All'interno del progetto vengono utiliizzate le funzioni native, offerte da Matlab,
per la risoluzione di un sistema lineare associato ad una matrice sparsa, simmetrica e definita positiva utilizzando la decomposizione di Cholesky

## Documentazione utilizzata
Link utile per visionare la documentazione Matlab delle funzioni utilizzate durante l'implementazione del progetto:
- Documentazione Matlab: https://it.mathworks.com/help/matlab/

## Note Generali
Il file *Main.m* contiene il codice per eseguire la decomposizione di Cholesky e la risoluzione 
del sistema lineare *Ax=b* per gran parte delle matrici richieste dalla consegna.

### Matrici supportate

| Nomi Matrici | Stato | Dimensione (in KB) |
|-----------|-----------|-----------|
| ex15.mat  | :white_check_mark:   |  555 |
| shallow_water1.mat    | :white_check_mark:   | 2263 |
| apache2.mat   | :white_check_mark:    | 8302 |
| parabolic_fem.mat  | :white_check_mark:    | 13116 |
| G3_circuit.mat   | :white_check_mark:    | 13833 |
| cfd1.mat   | :white_check_mark:    | 14164 |
| cfd2.mat   | :white_check_mark:    | 23192 |
| StocF-1465.mat   | :x:    | 178368 |
| Flan_1565.mat   | :x:    | 292858 |
