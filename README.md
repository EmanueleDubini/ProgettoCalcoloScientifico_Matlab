# Progetto Metodi del Calcolo Scientifico - Matlab

>  Progetto MATLAB per la risoluzione con il metodo di Cholesky di sistemi lineari con matrici sparse e definite positive di grandi dimensioni

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
Le Matrici simmetriche e definite positive considerate fanno parte della SuiteSparse Matrix Collection che colleziona matrici sparse derivanti da applicazioni di problemi reali 
(ingegneria strutturale, fluidodinamica, elettromagnetismo, termodinamica, computer graphics/vision, network e grafi). Disponibili al seguente link: https://sparse.tamu.edu/

| Nomi Matrici | Stato | Dimensione (in MB) |
|-----------|-----------|-----------|
| [ex15.mat](https://sparse.tamu.edu/FIDAP/ex15)  | :white_check_mark:   |  0,555 |
| [shallow_water1.mat](https://sparse.tamu.edu/MaxPlanck/shallow_water1)    | :white_check_mark:   | 2,263 |
| [apache2.mat](https://sparse.tamu.edu/GHS_psdef/apache2)   | Out of memory :x:    | 8,302 |
| [parabolic_fem.mat](https://sparse.tamu.edu/Wissgott/parabolic_fem)  | Out of memory :x:    | 13,116 |
| [G3_circuit.mat](https://sparse.tamu.edu/AMD/G3_circuit)   | Out of memory :x:    | 13,833 |
| [cfd1.mat](https://sparse.tamu.edu/Rothberg/cfd1)   | :white_check_mark:    | 14,164 |
| [cfd2.mat](https://sparse.tamu.edu/Rothberg/cfd2)   | :white_check_mark:    | 23,192 |
| [StocF-1465.mat](https://sparse.tamu.edu/Janna/StocF-1465)   | Out of memory :x:    | 178,368 |
| [Flan_1565.mat](https://sparse.tamu.edu/Janna/Flan_1565)   | Out of Memory :x:    | 292,858 |

## Descrizione del programma
All'interno del programma vengono sfruttate funzioni che sono implementate nativamente dall'ambiente Matlab e quindi non sono richieste librerie per completare i task richiesti dal progetto. 

Le funzioni che sono rese disponibili nativamente da *Matlab* sono molto efficienti; MATLAB, di fatto, è noto per le sue prestazioni ottimizzate per il calcolo numerico e scientifico e le sue librerie sono state sviluppate e ottimizzate per offrire elevate prestazioni computazionali
Per la realizzazione del programma in **Matlab** abbiamo utilizzato la funzione _chol_ con lo scopo di risolvere il sistema lineare *Ax=b* a seguito della decomposizione della matrice con il metodo di Cholesky. 
Il metodo _chol_ è presente nella libreria Matlab, e la dcoumentazione è disponibile al sito https://www.mathworks.com/help/matlab/ref/chol.html 

Il sito che contiene la documentazione Matlab permette di ottenere numerose informazioni riguardo alle funzioni che si vogliono utilizzare, oltre ad avere una sezione dedicata ad esempi di codice che implementano la particolare funzione che si vuole integrare nel proprio progetto. E' disponibile anche un forum con domande che possono essere scritte da utenti che riscontrano problemi durante l'implementazione delle funzioni. 

MATLAB è un software ampiamente utilizzato nel campo del calcolo scientifico e numerico, ed è costantemente aggiornato e sviluppato da MathWorks, l'azienda che lo produce. Inoltre, la licenza Matlab include anche l'assistenza diretta con un consulente esperto in caso di problemi oltre che a *Matlab Answers*, un forum online di domande e risposte per Matlab molto simile a StackOverflow. 

Prendere in considerazione tutti gli aspetti prima di decidere quale software utilizzare è fondamentale. Un software a pagamento come MATLAB offre alcuni vantaggi significativi: in primo luogo, viene fornita un'assistenza tecnica dedicata e professionale. Gli utenti possono contare su un supporto esperto per risolvere eventuali problemi o dubbi che potrebbero sorgere durante l'utilizzo del software. Questo può essere particolarmente utile quando si lavora su progetti critici o complessi.
Inoltre, i software a pagamento, come MATLAB, solitamente hanno un'alta affidabilità e sicurezza. Sono sottoposti a rigidi controlli di qualità e passano attraverso processi di test e verifica approfonditi per garantire la stabilità e la robustezza delle funzionalità offerte. Questo può essere un fattore cruciale in applicazioni che richiedono precisione e risultati accurati.

Tuttavia, è importante considerare anche i potenziali svantaggi: il costo di un software a pagamento come MATLAB, può essere significativo e potrebbe non essere sostenibile per tutte le aziende o organizzazioni, specialmente quelle con risorse finanziarie limitate. Pertanto, è necessario valutare attentamente il budget disponibile e confrontarlo con il costo del software prima di prendere una decisione.
Inoltre, è importante considerare l'alternativa di utilizzare software open-source, come le librerie Python per la risoluzione di sistemi lineari e la decomposizione di Cholesky. Questi software sono spesso gratuiti e disponibili per un'ampia comunità di sviluppatori. Anche se potrebbero mancare alcune delle caratteristiche avanzate e del supporto personalizzato offerto dai software a pagamento, possono essere soluzioni valide ed economicamente vantaggiose per molte aziende.

In conclusione, la scelta del software dipende da diversi fattori, tra cui l'affidabilità, la sicurezza, il supporto tecnico, il budget disponibile e le specifiche esigenze dell'azienda. È importante valutare attentamente tutte queste considerazioni prima di prendere una decisione informata.




