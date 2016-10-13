	% Problema "Amigas na escola"
	%
	% Descubra qual a matéria preferida, o animal de estimação,
	%  o suco que mais gostam, a cor da mochila e a cidade brasileira que as
	%5 amigas pretendem visitar nas próximas férias.
	%
	%https://rachacuca.com.br/logica/problemas/amigas-na-escola/
	%
    % Joana gosta de suco de Abacaxi.
    % A menina que tem Hamsters gosta de estudar Artes.
    % O suco favorito de Ana é de Limão
    % Jéssica está a esquerda da Renata.
    % Pati é a primeira da esquerda.
    % A menina da direita gosta de estudar Artes.
    % Quem toma suco de Laranja gosta de Cavalos
    % A pessoa que gosta de suco de Limão está no meio.
    % A mochila da Jéssica é Verde.
    % A menina à esquerda da do meio viajará Florianópolis.
    % Quem quer viajar pra Recife tem a mochila Amarela.
    % A menina que gosta do suco de Abacaxi senta ao lado da que viajará para Fernando de Noronha.
    % A dona da mochila Vermelha vai viajar para Fernando de Noronha.
    % A primeira da esquerda usa uma mochila Amarela.
    % A menina da mochila Azul tem Cachorros.
    % Quem gosta de Biologia senta ao lado da menina que tem Hamsters.
    % A garota que senta à direita de quem gosta de História prefere Matemática.
    % Quem gosta de suco de Laranja senta ao lado de quem gosta de suco de Maracujá.
    % Viajará para o Rio de Janeiro a menina que tem a mochila Preta.
    % A garota que gosta de suco de Morango tem Pássaros como animal de estimação.
    % A menina que gosta de Biologia senta ao lado da que gosta de Português.
    % Jéssica viajará para Salvador nas férias.
	%nome mochila materia animal lugar suco

	%para definir  esta ao lado, se nao conseguir
	% casar que esta na direita vai casar que esta na esquerda
	ao_lado(X, Y, List) :- a_direita(X, Y, List).
	ao_lado(X, Y, List) :- a_direita(Y, X, List).

	%coloca X na direita de Y de forma recursiva
	a_direita(X, Y, [Y | [X | _]]).
	a_direita(X, Y, [_ | Restante]) :- a_direita(X, Y, Restante).

	%solução coloca todas as condiçoes dos problema,
	%cada cada menida é da forma (nome,mochila,materia,animal,lugar,suco)
	% menber é true se menina for elemento da lista Meninas
	% o operado "=" é usado para unificação
	solucao(Meninas) :-
		Meninas = [_,_,_,_,_],
		member(menina(joana,_,_,_,_,abacaxi),Meninas),
		member(menina(_,_,artes,hamsters,_,_),Meninas),
		member(menina(ana,_,_,_,_,limao),Meninas),
		a_direita(menina(renata,_,_,_,_,_),menina(jessica,_,_,_,_,_),Meninas),
		[menina(pati,_,_,_,_,_),_,_,_,_] = Meninas,
		[_,_,_,_,menina(_,_,artes,_,_,_)]= Meninas,
		member(menina(_,_,_,cavalos,_,laranja),Meninas),
		[_,_,menina(_,_,_,_,_,limao),_,_]=Meninas,
		member(menina(jessica,verde,_,_,_,_),Meninas),
		[_,menina(_,_,_,_,florianopolis,_),_,_,_]=Meninas,
		member(menina(_,amarela,_,_,recife,_),Meninas),
		ao_lado(menina(_,_,_,_,_,abacaxi),menina(_,_,_,_,fernando_de_noronha,_),Meninas),
		member(menina(_,vermelha,_,_,fernando_de_noronha,_),Meninas),
		[menina(_,amarela,_,_,_,_),_,_,_,_]= Meninas,
		member(menina(_,azul,_,cachorro,_,_),Meninas),
		ao_lado(menina(_,_,biologia,_,_,_),menina(_,_,_,hamsters,_,_),Meninas),
		a_direita(menina(_,_,matematica,_,_,_),menina(_,_,historia,_,_,_),Meninas),
		ao_lado(menina(_,_,_,_,_,laranja),menina(_,_,_,_,_,maracuja),Meninas),
		member(menina(_,preta,_,_,rio_de_janeiro,_),Meninas),
		member(menina(_,_,_,passaro,_,morango),Meninas),
		ao_lado(menina(_,_,biologia,_,_,_),menina(_,_,portugues,_,_,_),Meninas),
		member(menina(jessica,_,_,_,salvador,_),Meninas).
