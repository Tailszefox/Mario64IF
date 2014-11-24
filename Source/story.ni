The story title is "Super Mario 64 IF".
The story author is "Meuh".
The story headline is "Une adaptation libre de Super Mario 64 en fiction interactive".
The story description is "Une adaptation libre de Super Mario 64 en fiction interactive".
The story genre is "Fiction".
The release number is 1.
The story creation year is 2010.

Include Basic Screen Effects by Emily Short.
Include French by Eric Forgeot. 
Use French Language. 

Book 1 - Regles

Part 1 - Reglages et fonctions utiles

Release along with the "Parchment" interpreter, a "StandardPerso" website, cover art.

Use no scoring.
Use full-length room descriptions.
Use undo prevention.

Histoire lance is a number that varies. Histoire lance is 0.
Tutorial lance is a number that varies. Tutorial lance is 0.

Rule for printing the banner text when Histoire lance is 1 or Tutorial lance is 1:
	do nothing.

Total etoiles is a number that varies. Total etoiles is 0.

Etoile actuelle is a number that varies. Etoile actuelle is 0.
Objectif actuel is a text that varies. Objectif actuel is "".
Derniere salle is a room that varies.

To attendre espace:
	say "[line break]Appuyez sur Espace pour continuer.";
	[wait for the SPACE key;]
	
After reading a command (this is the removing dashes rule):
	let N be indexed text;
	let N be the player's command;
	replace the text "-" in N with "";
	change the text of the player's command to N

Check looking for the first time:
	rule fails;

Instead of drinking something, say "Vous n'avez pas particulièrement soif.".

To say total etoiles en mots:
	if total etoiles is 1, say "une";
	else say "[total etoiles in words]";
	
Understand "h" as up;
Understand "b" as down;
Understand the command "taper" as "attaquer".

Part 2 - Actions debug - Not for release

Going debug is an action applying to one thing.
Understand "debug_goto [any room]" as going debug.
Carry out going debug:
	now the player is in the noun.
	
Modifier total etoile is an action applying to a number.
Understand "Etoile [a number]" as modifier total etoile.
Carry out modifier total etoile:
	now total etoiles is the number understood.
	
Gagner etoile 1 is an action applying to a number.
Understand "Niveau 1 [a number]" as gagner etoile 1.
Carry out gagner etoile 1:
	repeat with N running from 1 to the number understood:
		now the Obtenue in row N of Table 4.1 is 1;

Part 3 - Actions ingame

Instead of jumping:
	say "Vous sautez sur place, vainement.[line break]Vous devriez peut-être plutôt préciser sur ou dans quoi vous désirez sauter...";

Jumping in is an action applying to one visible thing. Understand "sauter [something]" as jumping in. Understand "sauter dans/sur [something]" as jumping in. Understand "j [something]" as jumping in;

Report jumping in:
	say "Sauter sur [the noun] n'aurait pas grand intérêt.";

Understand "parler ->/à/a/au/aux/avec [something]" as talking to. Understand "p [something]" as talking to.

Instead of talking to:
	if the noun is the player:
		say "Vu qu'il n'y a personne d'intéressant dans le coin, vous vous parlez à vous-même. Mais vous n'avez pas grand chose à vous dire, en fait.";
	else if the noun is not a person:
		say "Malheureusement, [the noun] ne semble pas pouvoir vous répondre. En même temps, ce serait difficile puisqu'il s'agit d'un objet...";
	else:
		say "Vous tentez d'entamer une conversation, mais [the noun] semble vous ignorer."

Understand "parler [someone]" as a mistake ("À moins que [the noun] soit une langue, vous devriez plutôt utiliser la commande 'parler à'.").

inSwimming is an action applying to one visible thing. Understand "nager dans [something]" as inSwimming. Instead of inSwimming, try swimming.

Instead of swimming:
	say "Vous ne voyez aucun endroit qui vous permettrait de nager dans le coin."

Understand "mario" as yourself.
Instead of examining yourself, say "Vous ajustez votre salopette et votre moustache...Et c'est reparti !";

Instead of jumping in yourself, say "Cela risque d[']être difficile...";

Instead of taking someone:
	say "Que voulez-vous dire par 'prendre [the noun]' ?[line break]...En fait, je ne suis pas sûr de vouloir le savoir...";

Part 4 - Tutorial

Action tutorial is a stored action that varies.
Texte action tutorial is a text that varies.
Essai rate is a number that varies.

Region Tutorial is a region. Salle du tutorial is a room in Region Tutorial. "La salle dans laquelle vous vous trouvez est recouverte de blanc, donnant une étrange sensation d'infini. Vous avez beau chercher, vous ne trouvez à première vue aucune issue. Il va sans doute falloir suivre les instructions qu'on vous donne si vous voulez sortir d'ici.

La salle continue vers le nord."

To lancer tutorial:
    now tutorial lance is 1;
	remove la piece from play;
	remove le goomba from play;
	now action tutorial is the action of looking;
	if histoire lance is 0, now the right hand status line is "";
	say "Bienvenue dans le tutorial de Super Mario 64 IF ! Celui-ci vous permettra de connaitre toutes les commandes nécessaires pour jouer.

Dans une fiction interactive, vous contrôlez votre personnage à l'aide d'ordres que vous lui donnez, la plupart du temps sous la forme de verbe à l'infinitif. Il suffit pour cela de taper ce que vous voulez faire lorsque le jeu vous donne la main, et d'observer ensuite les conséquences de votre action.

Tout d'abord, laissons le jeu démarrer. Je vais vous déposer dans la salle du tutorial...";
	now the player is in Salle du tutorial;

	Report looking in Salle du tutorial:
		attendre espace;
		say "Ce que vous venez de voir est la description de l'endroit dans lequel vous vous trouvez. À chaque fois que vous changerez d'endroit en vous déplaçant, le jeu vous informera de votre position actuelle en vous donnant le nom de l'endroit où vous vous trouvez, une petite description, ainsi que ce que vous pouvez y voir d'autre.

Regardez la dernière phrase : cela vous indique la direction dans laquelle vous rendre. Dans une IF, presque tous les déplacements se font grâce aux points cardinaux. Puisque la salle continue vers le nord, vous pouvez tout simplement taper [bold type]nord[roman type] pour vous y rendre. Essayez ! Vous n'avez qu[']à taper [bold type]nord[roman type] puis appuyer sur Entrée.";
	now action tutorial is the action of going north;
	now texte action tutorial is "nord";

Nord de la salle du tutorial is a room in Region Tutorial. It is north of Salle du tutorial. "Après avoir avancé pendant quelques dizaines de mètres, vous voyez enfin quelque chose. Devant vous se trouve un gigantesque escalier, tellement haut que vous ne parvenez pas à en voir le sommet. Cela semble être votre meilleure option de sortie.

L'escalier mène vers le haut. Vous pouvez retourner à votre point de départ par le sud.";

After going to Nord de la salle du tutorial:
	now action tutorial is the action of looking;
	try looking;
	attendre espace;
	say "Voilà, vous venez de vous déplacer ! Pour bouger, il vous suffit donc d'indiquer la direction à suivre. Les directions disponibles sont nord, nord-est, est, sud-est, sud, sud-ouest, ouest, et nord-ouest. De plus, vous pouvez parfois taper haut et bas pour vous déplacer dans ces directions.

Dans tous les cas, inutile d'essayer d'aller n'importe où : le texte qui décrit chaque salle vous indique toujours les directions dans lesquelles vous pouvez aller. Pour cette fois, montez simplement l'escalier en allant vers le [bold type]haut[roman type].";
	now action tutorial is the action of going up;
		now texte action tutorial is "haut";
		
Sommet des escaliers is room in Region Tutorial. It is up of Nord de la salle du tutorial. "Vous avez arrêté de compter les marches après la centaine. Mais, enfin, devant vous se dresse...une immense plaine recouverte d'herbe. Vous ne comprenez pas vraiment comment c'est possible, mais l'important est que vous soyez (plus ou moins) sorti d'affaire.

Vous pouvez continuer d'avancer en allant vers le nord."

Plaine Tutorial is room in Region Tutorial. It is north of Sommet des escaliers.

la vache is in Sommet des escaliers. "Non loin de vous, une vache est en train de manger de l'herbe.". It has description "La vache continue de manger son herbe bruyamment. Elle ne semble pas énormément gênée par votre présence, bien qu'elle jette un ½il vers vous de temps en temps.". Understand "Meuh" as la vache.

After going to Sommet des escaliers:
	now action tutorial is the action of looking;
	try looking;
	say "--[line break]Bien ! Tout d'abord, sachez que presque toutes les commandes, y compris celles des déplacements, ont des abréviations afin de les taper plus vite. Ainsi, pour aller au nord, vous pouvez tout simplement taper n; pour aller au sud, s; pour aller au nord-est, ne, et ainsi de suite.

Mais bref, avant d'aller plus loin, regardons les alentours. Sachez que vous pouvez à tout moment revoir la description de la salle en tapant la commande [bold type]regarder[roman type] (abréviation r). Allez-y, essayez !";
	now texte action tutorial is "regarder";

After looking in Sommet des escaliers when texte action tutorial is "regarder" :
	say "-- [line break]Regardez la dernière ligne : le jeu vous indique également tout objet et personnage qui se trouve avec vous dans l'endroit actuel. Pour avoir plus d'information sur un objet ou un personnage, vous pouvez à tout moment le regarder de plus près avec la commande [bold type]examiner[roman type] (abréviation x).

Il y a une vache, par ici. Essayons de l'examiner : pour cela, il vous suffit de taper la commande suivie du nom de ce que vous voulez examiner. Vous n'avez pas besoin d'inclure les mots 'le', 'la', 'les', etc. ";
	now action tutorial is the action of examining la vache;
	now texte action tutorial is "examiner vache";

After examining la vache:
	say "--[line break]Observer les personnages et objets vous permettra souvent d'obtenir des indices supplémentaires, n'hésitez donc pas à regarder de plus près tout ce que vous croisez. Lisez bien les descriptions des salles pour ne rien manquer.

Maintenant, essayons d'interagir avec cette vache. Que diriez-vous d'essayer de lui parler ? On ne sait jamais...Pour cela, utilisez simplement la commande [bold type]parler à[roman type] (abréviation p). À vous !";
	now action tutorial is the action of talking to la vache;
	now texte action tutorial is "parler à la vache";

Instead of talking to la vache:
	say "Vous vous approchez de la vache. À votre grande surprise, c'est elle qui lance la conversation !

'Hé, salut ! Ça roule pour toi, le tutorial ? Oh, au fait, laisse-moi te donner un bon conseil : tu devrais utiliser la commande [bold type]aide[roman type] quand tu ne sais pas quoi faire, afin d'avoir quelques informations utiles.'

Hm, vous devriez peut-être écouter cette vache. Essayez la commande [bold type]aide[roman type], pour voir...";
	now action tutorial is the action of needing help;
	now texte action tutorial is "aide";

Carry out needing help when the player is in Region Tutorial:
	if the current action is not action tutorial, say "Inutile de compliquer les choses avec d'autres commandes. Il vous suffit de taper la commande [fixed letter spacing][texte action tutorial][variable letter spacing] !" instead;
	say "[directions disponibles][objets disponibles]";
	now action tutorial is the action of waiting;
	now texte action tutorial is "attendre";
	say "[line break]--[line break]Pas mal ! La commande aide vous permet à tout moment de savoir les directions que vous pouvez emprunter, et les objets et personnages avec lesquels vous pouvez agir. De plus, lorsque vous serez à la recherche d'une étoile, la commande vous indiquera également quoi faire si vous êtes perdu.

Bien, dans l'immédiat, il n'y a pas grand chose à faire, le chemin au nord ne semble mener nulle part. Mais peut-être que si vous attendez, quelque chose va se produire...

Dans une IF, le temps passe à chaque commande que vous entrez. Lorsque votre temps est compté, chaque commande compte donc comme une unité de temps. Par contre, tant que vous n'appuyez pas sur Entrée, rien ne se passera. Cela veut dire que vous pouvez réfléchir à votre prochaine commande, voire même faire une pause, aussi longtemps que nécessaire sans aucune conséquence.

Parfois, il vous faudra attendre qu'un évènement se produise. Dans ce cas, vous pouvez tout simplement utiliser la commande [bold type]attendre[roman type] (abréviation z). Celle-ci ne sert à rien, à part faire passer le temps. Essayons pour voir." instead;

le goomba is a man.

After waiting in Sommet des escaliers:
	now le goomba is in Sommet des escaliers;
	now action tutorial is the action of jumping in le goomba;
	now texte action tutorial is "sauter sur goomba";
	say "Au loin, vous pouvez voir un Goomba se rapprocher de vous. Au bout de quelques secondes, celui-ci arrive à votre hauteur.

Ah ah, un Goomba ! Voilà une chance d'utiliser la prochaine commande. Si vous connaissez Mario, il n'est même pas nécessaire de vous l'expliquer. Allez, essayer de sauter dessus avec la commande [bold type]sauter sur[roman type] (abréviation j). Précisez bien sur quoi vous voulez sauter, autrement vous sauterez sur place !"

la piece is a thing. Understand "piece" as la piece.

Instead of jumping in le goomba:
	say "Sprotch ! Vous sautez à pied joint sur le Goomba, qui s[']écrase d'un seul coup et laisse s[']échapper une pièce. Vous n'avez pas perdu la main (ou le pied).

Notez que la commande sauter fonctionne également pour sauter à l'intérieur de quelque chose. Vous pouvez donc utiliser à la fois 'sauter dans (quelque chose)' et 'sauter sur (quelque chose)'.

Oh, le Goomba a perdu la pièce qu'il transportait ! Essayez de la prendre : il n'y a pas de petit profit. Vous pouvez prendre des objets avec la commande [bold type]prendre[roman type].";
	now la piece is in Sommet des escaliers;
	now action tutorial is the action of taking la piece;
	now texte action tutorial is "prendre pièce";

Instead of taking la piece:
	say "Hop, vous prenez la pièce et la rangez dans votre poche.

Et voilà, nous avons fait le tour des commandes les plus répandues ! Notez qu'il en existe d'autres, mais vous apprendrez leur existence en temps voulu. Il existe aussi des commandes cachées qui peuvent vous fournir d'autres messages ou indices. À vous de les trouver.

Oh, avant de démarrer le jeu, il reste une commande très importante à connaitre : la commande [bold type]sauvegarder[roman type]. Celle-ci vous permet d'enregistrer la partie dans son état actuel pour y revenir quand vous voulez. Allez hop, essayez !";
	now action tutorial is the action of saving the game;
	now texte action tutorial is "sauvegarder";

Check saving the game in Sommet des escaliers:
	if the current action is not action tutorial, say "Inutile de compliquer les choses avec d'autres commandes. Il vous suffit de taper la commande [fixed letter spacing][texte action tutorial][variable letter spacing] !" instead;
	
Report saving the game in Sommet des escaliers:
	say "Remarquez que l'adresse de la page a changé : un tas de lettres, représentant votre sauvegarde, s'est rajouté. Vous pouvez maintenant mettre la page dans vos favoris, pour pouvoir accéder à votre sauvegarde à tout moment. Sachez qu[']à chaque sauvegarde, l'adresse de la page changera, ce qui veut dire qu[']à chaque sauvegarde, vous devrez mettre la page à nouveau dans vos favoris. Cela vous permet de garder autant de sauvegardes que vous voulez, à différents endroits du jeu.

Au fait, n'essayez jamais de changer tout ce qui se trouve après le # : vous risquez de corrompre votre sauvegarde et de perdre tout vos progrès !";
	attendre espace;
	say "Voilà, nous avons fait le tour pour cette fois. Avant de commencer, un petit rappel de tout ce que nous avons vu :

 [bold type]n/ne/e/se/s/so/o/no/haut/bas[roman type] : se déplacer dans la direction correspondante.[line break]
[bold type]regarder[roman type] : revoir la description de la salle.[line break]
[bold type]examiner (quelque chose)[roman type] : obtenir plus d'informations sur une personne ou un objet.[line break]
[bold type]parler à (quelqu'un)[roman type] : entamer une discussion avec une personne.[line break]
[bold type]sauter sur/dans (quelque chose)[roman type] : saute sur (ou dans) l'objet.[line break]
[bold type]prendre (quelque chose)[roman type] : prendre l'objet.[line break]
[bold type]attendre[roman type] : faire passer le temps.[line break]
[bold type]sauvegarder[roman type] : sauvegarde la partie.[line break] 
[bold type]aide[roman type] : obtenir de l'aide sur le lieu et votre objectif.

Pour finir, sachez que si vous avez une remarque en cours de jeu, vous pouvez tapez '!' suivi de votre remarque (par exemple [bold type]! la commande cecicela ne marche pas correctement[roman type]). Suivez les instructions du topic pour envoyer toutes vos remarques à Meuh.

C'est tout ! Sur ce, je vous laisse profiter du jeu. Amusez-vous bien !";
	attendre espace;
	now tutorial lance is 0;
	if Histoire lance is 1, now the player is in Salle principale;
	else demarrer jeu;

Before attacking or jumping in la vache:
	say "Laissez cette pauvre vache tranquille et concentrez-vous plutôt sur le jeu !";

Before doing something:
	if tutorial lance is 1:
		if the current action is not action tutorial:
			increase Essai rate by 1;
			if Essai rate is 1:
				say "Pour l'instant, veuillez suivre le tutorial et essayer la commande [fixed letter spacing][texte action tutorial][variable letter spacing]." instead;
			else if Essai rate is 2:
				say "Je sais que vous avez hâte de commencer le jeu, mais vous devez suivre le tutorial avant. Allez, utilisez la commande [fixed letter spacing][texte action tutorial][variable letter spacing]." instead;
			else if Essai rate is 3:
				say "Vous pourrez faire ça autant que vous voudrez une fois le tutorial terminé. Pour l'instant, utilisez la commande [fixed letter spacing][texte action tutorial][variable letter spacing] !" instead;
			else:
				say "Roh, et puis zut, si ça vous amuse de faire n'importe quoi. Si vous voulez avancer, n'oubliez pas que la commande à utiliser est [fixed letter spacing][texte action tutorial][variable letter spacing]." instead;

Rule for printing a parser error when tutorial lance is 1:
	say "Je n'ai pas compris ce que vous tentiez de faire. Vous devriez plutôt utiliser la commande [fixed letter spacing][texte action tutorial][variable letter spacing].";

Part 5 - Actions out of world

Launching tutorial is an action out of world.
Understand "tutorial" as launching tutorial.

Check launching tutorial when tutorial lance is 1:
	say "Petit malin, vous êtes déjà dans le tutorial !";
	rule fails.
	
Carry out launching tutorial:
	say "Après le tutorial, vous serez ramené au château. Si vous êtes dans un niveau, votre progression sera perdue. Lancer le tutorial ?";
	if the player consents, lancer tutorial;

Needing help is an action out of world.
Understand "aide" as needing help.

Carry out needing help:
	say "Cette version du jeu est loin d[']être complète, et est encore pleine de bugs et autres problèmes. Si vous rencontrez quelque chose qui ne va pas (commande non reconnue qui devrait l[']être, comportement incohérent, etc.) ou avez une suggestion, tapez '!' suivi de votre commentaire, puis une fois votre session de jeu terminée, copiez la en entier (Ctrl+A) puis suivez les instructions du premier post du topic pour l'envoyer à Meuh.[paragraph break]";
	say "Vous pouvez à tout moment faire ou refaire le tutorial en tapant [fixed letter spacing]tutorial[variable letter spacing].";
	say "Vous pouvez quitter le niveau actuel avec la commande [fixed letter spacing]quitter[variable letter spacing].";
	say "[directions disponibles][objets disponibles]";
	say "[if the player is not in Le Chateau]Pour obtenir l[']étoile : [bold type][objectif actuel][roman type][line break][end if]";

After reading a command (this is the ignore beta-comments rule):
	if the player's command matches the regular expression "^!":
		say "(C'est noté, merci de votre commentaire. N'oubliez pas d'envoyer votre session de jeu à Meuh, en suivant les instructions du premier post du topic, une fois que vous avez terminé.)";
		reject the player's command. 

Definition: a direction (called thataway) is viable if the room thataway from the location is a room.

To say directions disponibles:
    let count of exits be the number of viable directions;
	if the count of exits is 0, say "Vous ne pouvez aller nulle part pour l'instant.";    
	else say "Les directions que vous pouvez emprunter sont : [bold type][list of viable directions][roman type].";
	
To say objets disponibles:
	let count of objects be the number of visible things that are not the player in the location;
	if the player is not in a canon and the count of objects > 0, say "Les objets et personnages à votre disposition ici sont : [bold type][list of described things in the location][roman type]."
	
Understand the command "quitter" as something new.
Quitting level is an action out of world. Understand "quitter" as quitting level. Understand "quitter niveau" as quitting level.

Check quitting level:
	if tutorial lance is 1:
		say "N'essayez pas de taper n'importe quoi." instead;
	if the player is in Cour du chateau:
		say "Vous n[']êtes pas dans un niveau !" instead;
	else if the player is in Le Chateau:
		say "Vous n[']êtes pas dans un niveau !" instead;

Carry out quitting level:
		say "Vous vous concentrez très fort, et hop, vous voilà revenu au château !";
		attendre espace;
		now the player is in Salle principale;

Understand "suicider" as a mistake ("Allons, tout ne va pas si mal que ça.").
Understand "xyzzy" as a mistake ("On est un connaisseur, à ce que je vois.").

Report saving the game when tutorial lance is 0:
	try looking;

Part 6 - Objets

Chapter 1 - Porte etoilee

A porte etoilee is a kind of door. A porte etoilee has a number called nombre d'etoiles. A porte etoilee is always scenery. A porte etoilee is usually locked. A porte etoilee can be accessible or inaccessible. A porte etoilee is usually inaccessible. A porte etoilee is female.

Direction-relevance relates a porte etoilee (called X) to a direction (called Y) when the direction of X from the location is Y. The verb to be directionally-relevant to implies the direction-relevance relation. 

Understand "porte [something related by direction-relevance]" as a porte etoilee.
The printed name of a porte etoilee is "la porte [direction of the item described from the location]".

Opening with stars is an action applying to one visible thing.

Instead of examining a porte etoilee (called porte):
	if nombre d'etoiles of the porte is 0:
		say "Aucun chiffre n'est indiqué sur cette porte.";
	else:
		say "Sur la porte, '[nombre d'etoiles of the porte]' est inscrit par dessus un symbole représentant une étoile.";

Check opening a locked porte etoilee (called porte):
	if nombre d'etoiles of the porte > total etoiles:
		let etoiles manquantes be nombre d'etoiles of the porte - total etoiles;
		say "Puisque '[nombre d'etoiles of the porte]' est inscrit sur la porte, il vous faut sans doute [nombre d'etoiles of the porte] étoile[s]. Il vous en manque encore [etoiles manquantes]." instead;
	else if nombre d'etoiles of the porte > 0:
		if the porte is inaccessible:
			say "Coucou, ici Meuh. Techniquement vous avez assez d[']étoiles pour entrer, mais le niveau n'est pas encore créé. Désolé !" instead;
		else:
			say "Grâce à la puissance des étoiles, la porte s'ouvre doucement...";
			now the porte is unlocked;

Chapter 2 - Peinture

A peinture is a kind of thing. A peinture is always scenery. A peinture has a room called destination. A peinture has a table name called liste des etoiles.
The printed name of a peinture is "une peinture". Understand "tableau" as a peinture. Understand "tableau" as "[peinture]".

Instead of entering a peinture:
	try jumping in the noun.

Instead of jumping in a peinture (called peinture):
	choose a row with Obtenue of 0 in liste des etoiles;
	if Numero entry is 0:
		say "Vous avez déjà obtenu toutes les étoiles de ce niveau. Vous avez donc terminé cette démo !
		[paragraph break]Merci d'avoir essayé cette démo ! N'hésitez pas à donner votre avis sur le topic. Si vous le pouvez, et surtout si vous avez fait des remarques pendant le jeu, pensez à copiez votre session de jeu en entier [bold type]dès maintenant[roman type] (touches Ctrl+A), puis suivez les instructions du premier post du topic pour l'envoyer à Meuh.[paragraph break]Sur ce, à ciao !";
		attendre espace;
		end the story finally;
		stop the action;
	if total etoiles is 0:
		say "Sans être sûr de vous, vous sautez en direction de la peinture. Alors que vous vous préparez à un douloureux impact, voilà que vous passez au travers comme s'il s'agissait d'une surface liquide...";
	else if total etoiles is 1:
		say "Maintenant que vous savez comment ça fonctionne, vous sautez directement dans la peinture sans hésitation.";
	else:
		say "Vous prenez un peu d[']élan et sautez dans la peinture.";
	now Etoile actuelle is Numero entry;
	now Objectif actuel is Objectif entry;
	carry out the initialisation entry activity;
	say "[line break][bold type]Étoile [Numero entry] : [Nom entry][roman type].";
	attendre espace;
	now derniere salle is the location of the player;
	now the player is in destination of the peinture;

Chapter 3 - Etoile

An etoile is a kind of thing.  An etoile has a table name called liste des etoiles. Understand "étoile" or "etoile" as an etoile. "Une étoile attend bien sagement que vous la preniez." It has description "L[']étoile brille de mille feux, et n'attend plus que vous la preniez...".  It has printed name "l[']étoile".

Instead of attacking an etoile, say "Vous êtes censé collecter les étoiles, pas les affronter !".

Check taking an etoile (called etoile):
	choose a row with Numero of Etoile actuelle in liste des etoiles;
	now Obtenue entry is 1;
	increase Total etoiles by 1;
	say "Vous venez d'obtenir l[']étoile [numero entry] de ce niveau ! Vous avez maintenant [total etoiles en mots] étoile[s] !";
	attendre espace;
	remove etoile from play;
	say "Vous ressortez d'un seul coup de la peinture, vous retrouvant ainsi dans le château.";
	now the player is in derniere salle;
	rule fails;

Chapter 4 - Canons

A canon is a kind of container. A canon can be ouvert or ferme. A canon is usually ferme. A canon can be actif or inactif. A canon is usually inactif. A canon has a list of rooms called destinations. A canon is enterable. It is fixed in place. It has printed name "le canon". Understand "canon" as a canon.

Une grille is a kind of thing. It is privately-named. It has printed name "la grille".
une grille is part of every canon. Understand "grille" as une grille.

Instead of examining une grille which is part of a canon (called c):
	if c is ouvert or c is actif, say "La grille est ouverte, permettant au canon de sortir.";
	else say "Une grille en fer recouvre le canon. Il semble impossible de la déplacer à la main, et les mailles sont trop étroites pour passer à travers.";
	
Instead of pushing or pulling or jumping in or taking une grille which is part of a canon (called c):
	if c is ouvert or c is actif, say "La grille est déjà ouverte !";
	else say "La grille ne bouge pas d'un pouce. Il faudra trouver un autre moyen de l'ouvrir.";


Instead of examining a actif canon:
	say "Le canon tire des bulles dans tous les sens.";

Instead of examining a ferme canon:
	say "Le canon est recouvert d'une grille, empêchant son accès."; 
	
Instead of examining a ouvert canon:
	say "Le canon semble inactif. Il est prêt à être utilisé.";

Instead of jumping in a ferme canon:
	say "Le canon est recouvert d'une grille, et il ne semble y avoir aucun moyen de l'ouvrir."

Understand "utiliser [a canon]" as jumping in.

Instead of jumping in a ouvert canon:
	try entering the noun;
		
Report entering a canon:
	say "Vous entrez dans le canon. Celui-ci peut vous amener aux destinations suivantes :[line break][liste des destinations du the noun][line break]Tapez la commande correspondant à la destination souhaitée." instead;

To say liste des destinations du (canon - a canon):
	let i be 1;
	repeat with destination running through destinations of the canon:
		say "[fixed letter spacing]tirer vers [i][variable letter spacing] - [destination][line break]";
		increase i by one;

Understand "tirer vers [number]" as selecting destination. Selecting destination is an action applying to one number.

Understand "[number]" as selecting destination when the player is in a canon.
Understand "tirer vers [text]" as a mistake ("Tapez le numéro correspondant à la destination, pas la destination elle-même.") when the player is in a canon.
	
Before doing anything other than selecting destination:
	If the player is in a canon:
		say "Maintenant que vous êtes dans le canon, vous ne pouvez rien faire d'autre que de choisir une destination." instead;

Check selecting destination:
	if the player is not in a canon, say "Je vous demande pardon ?" instead;
	let canon actuel be a random canon that can be seen by the player;
	if the number understood is greater than the number of entries in destinations of the canon actuel or the number understood is less than one: 
		say "[the number understood] n'est pas un choix valide. Les destinations valides sont :[line break][liste des destinations du canon actuel]" instead;
	say "Vous réglez la trajectoire du canon, et...c'est parti !";

Carry out selecting destination:
	let N be the number understood;
	let canon actuel be a random canon that can be seen by the player;
	now the player is in entry N of destinations of the canon actuel;

Chapter 5 - Pieces rouges

Compteur piece rouge is a number that varies.

A piece rouge is a kind of thing. Understand "pièce" or "piece" or "piece rouge" or "pièce rouge" as a piece rouge. "Une [bold type][red letters]pièce rouge[default letters][roman type] se trouve juste devant vous." It has description "Cette pièce de couleur rouge semble importante. Peut-être devriez-vous la prendre ?". It has printed name "une pièce rouge".

Carry out taking a piece rouge (called piece):
	increase Compteur piece rouge by 1;
	remove piece from play instead;
	
Report taking a piece rouge (called piece):
	if Compteur piece rouge < 8:
		say "Vous vous emparez de la pièce rouge. Vous en avez maintenant [Compteur piece rouge]." instead;
	else:
		say "Vous attrapez la dernière pièce rouge du niveau. Il ne vous reste plus qu[']à chercher où l[']étoile est apparue !" instead;
		
PR1 is a piece rouge. PR2 is a piece rouge. PR3 is a piece rouge. PR4 is a piece rouge. PR5 is a piece rouge. PR6 is a piece rouge. PR7 is a piece rouge. PR8 is a piece rouge.

Book 2 - Jeu

Part 1 - Debut du jeu

Chapter 1 - Questions

When play begins:
	say "Bienvenue dans Super Mario 64 version IF !

[white letters]introCover.png[default letters]

Une fiction interactive (Interactive Fiction, IF) est un jeu sous forme entièrement textuel,
dans lequel vous donnez des ordres à votre personnage afin de lui faire effectuer différentes
actions lui permettant de progresser dans l'aventure.

Avant de commencer le jeu, je vais vous poser quelques questions pour pouvoir l'adapter à vos besoins.

Avez-vous déjà joué à une fiction interactive ?[line break]>";
	if player consents:
		say "Parfait ! Dans ce cas, vous ne devriez pas avoir de problème avec Mario 64 IF. Le jeu utilise les règles de base du genre, et le nombre de commandes disponibles est relativement limité pour rendre le jeu plus accessible.
		
Cependant, vous avez tout de même la possibilité de faire un petit tutorial passant en revue les commandes importantes du jeu. Vous n'en avez pas forcément besoin, mais un petit rappel ne fait jamais de mal.";
		demander confirmation joueur;
	else:
		say "Le genre de la fiction interactive n'est pas bien compliqué à prendre en main, mais il nécessite quand même un petit apprentissage. Ce jeu inclut donc un tutorial vous permettant d'apprendre les bases du genre et les commandes que vous pourrez utiliser tout au long du jeu.

Rien ne vous oblige à le suivre, mais si vous êtes vraiment débutant dans ce type de jeu, cela ne pourra que vous faire du bien. Sans ça, vous risquez d[']être bloqué dans les premières minutes du jeu ![paragraph break]";
		demander confirmation non-joueur;

To demander confirmation joueur:
	say "Voulez-vous suivre le tutorial ?[line break]>";
	if player consents:
		lancer tutorial;
	else:
		say "Très bien. Notez cependant que vous pouvez faire le tutorial à tout moment en utilisant la commande [fixed letter spacing]tutorial[variable letter spacing], et accéder à de l'aide générale avec la commande [fixed letter spacing]aide[variable letter spacing].[paragraph break]Sur ce, bon jeu !";
		attendre espace;
		demarrer jeu;

To demander confirmation non-joueur:
	say "Voulez-vous suivre le tutorial ?[line break]>";
	if player consents:
		lancer tutorial;
	else:
		say "En tant que débutant, le tutorial vous est tout de même fortement conseillé. Encore une fois, sans lui, vous risquez de ne pas savoir quoi faire une fois le jeu lancé. Promis, il ne dure que quelques minutes ![paragraph break]";
		demander seconde confirmation non-joueur:

To demander seconde confirmation non-joueur:
	say "Voulez-vous suivre le tutorial ?[line break]>";
	if player consents:
		lancer tutorial;
	else:
		say "Très bien, c'est vous qui voyez. Souvenez-vous tout de même que vous pouvez utiliser à tout moment les commandes [fixed letter spacing]tutorial[variable letter spacing] et [fixed letter spacing]aide[variable letter spacing] si vous ne savez pas quoi faire.[paragraph break]Sur ce, bon jeu !";
		attendre espace;
		demarrer jeu;

To demarrer jeu:
	[clear the screen;]
	say "[paragraph break][banner text][list of extension credits][paragraph break]";
	now histoire lance is 1;
	now the right hand status line is "Total : [total etoiles] étoile[if total etoiles > 1]s[end if]";
	say "Voilà une très bonne façon de passer la journée. Tenant en main une lettre, vous courez à en perdre haleine vers le tuyau menant au château de la Princesse Peach. Après tout, ce n'est pas tous les jours qu'on reçoit une invitation pareille. Et puis, surtout, il y a ce fameux gâteau ! La simple pensée de ce délice vous fait perdre pieds quelques secondes, mais vous repartez de plus belle.

[magenta letters]'Cher Mario,
Rends-toi au château au plus tôt !
Je t'ai préparé un délicieux gâteau.

Princesse Toadstool - Peach'[default letters]

Dès que vous avez reçu cette lettre, vous avez bondi de votre chaise, laissant sur place votre frère Luigi sans aucune autre explication. Bah, vous lui rapporterez un bout de gâteau pour vous faire pardonner. S'il en reste.";
	attendre espace;
	now the player is in Point d'arrivee;

Part 2 - Cour du chateau

Cour du chateau is an region.

ChateauCour is a backdrop in Cour du chateau. It has printed name "le château". It has description "L'imposant château se dresse devant vous. Drapé de blanc et de rouge, il est impressionnant, rien de mieux pour montrer qui est le roi (ou la princesse) dans le coin.". Understand "château" or "chateau" as ChateauCour.

le pont is a backdrop in Cour du chateau. It has description "Le pont de brique, de la même couleur que château, mène juste devant l'entrée du château. Tout cela est assez accueillant."

Chapter 1 - Point d'arrivee

Point d'arrivee is a room in Cour du Chateau. "[if unvisited]Alors que vous sautez hors du tuyau, celui-ci disparait derrière vous. Vous voilà dans le jardin du château de la Princesse Peach. Tout comme elle, il est majestueux[else]Tout comme la Princess Peach, ce jardin est majestueux[end if] : le paysage est magnifique, une énorme cascade se jette dans les douves du château, et il y a même un lac artificiel. Pour sûr, c'est un endroit parfait pour se promener. Ou manger un gâteau.

Au nord se trouve la porte du château. La cascade se trouve à l'ouest, tandis que le lac artificiel est à l'est."
It has printed name "Cour du chateau".

la porte du chateau is scenery in Point d'arrivee. It is privately-named. It has printed name "la porte du château". It has description "La porte d'entrée parait bien petite par rapport au château lui-même. La princesse aurait pu mettre en place une énorme porte histoire d'impressionner encore plus les gens !". Understand "porte" or "porte du château" as la porte du chateau.

le jardin is a backdrop in Cour du Chateau. Understand "cour" or "jardin" as le jardin. It has description "Tout comme la Princess Peach, ce jardin est majestueux : de nombreux arbres vous entourent, une énorme cascade se jette dans les douves du château, et il y a même un lac artificiel. Pour sûr, c'est un endroit parfait pour se promener. Ou manger un gâteau."



Chapter 2 - Cascade

Cascade is a room in Cour du Chateau. It is west of Point d'arrivee. "Devant vous se tient une énorme cascade, débitant une eau extrêmement claire. La cascade est tellement haute, plus grande que le château lui-même, que vous ne pouvez même pas voir la source. En tout cas, cela fait du jardin un endroit parfait pour la farniente : rien ne vaut le bruit de l'eau pour se détendre.

Vous pouvez retournez devant l'entrée du château en allant à l'est."
Chute d'eau is scenery in Cascade. Understand "cascade" as Chute d'eau. It has printed name "la cascade". It has description "Le débit d'eau produit par la cascade est impressionnant. Vous vous demandez d'ailleurs où va toute cette eau : il y a bien une grille dans les douves, mais elle est clairement trop petite pour évacuer autant d'eau. En tant que plombier, vous êtes au courant de ce genre de choses."

Instead of swimming when in Cascade:
	say "Vous comptez remonter la cascade à la nage ? Même pour vous, le courant est bien trop fort. Vous ne saurez sans doute jamais ce qu'il y a là haut.";

Chapter 3 - Lac artificiel

Lac artificiel is east of Point d'arrivee. "Il n'est pas forcément très grand, mais tout de même, tout le monde ne peut pas se targuer d'avoir son propre lac dans son jardin. Une piscine tout au plus. L'eau y est extrêmement pure. Tout cela vous donne envie de piquer une tête, mais vous avez mieux à faire pour le moment.

L'ouest vous place juste devant l'entrée du château. L'est mène aux douves du château." Lac artificiel is in Cour du chateau.

le lac artificiel is in Lac artificiel. It is scenery. It has description "Le lac s[']étend sur plusieurs mètres, et semble relativement profond. À première vue, il ne mène nulle part, il doit uniquement servir de déco.". Understand "eau" as le lac.

le canon is a canon in Lac artificiel. "Un canon se trouve juste à côté du lac." The description of le canon is "Un canon dans un jardin, voilà une drôle d'idée. Sans doute une mesure de protection contre Bowser, mais à en juger vos précédentes aventures, celle-ci n'est pas franchement efficace. De toute façon, une grille en ferme l'accès, preuve qu'il ne doit pas être utilisé bien souvent." It is ferme. It is inactif.

Instead of jumping in le canon:
	say "Le canon est recouvert d'une grille, et vous ne voyez aucun moyen de l'ouvrir. Il faudra sans doute revenir un peu plus tard.";

Instead of jumping in le lac artificiel, try swimming.

Instead of swimming when in Lac artificiel:
	say "Certes, ce lac vous donne bien envie de faire quelques brasses. Mais dans l'immédiat, vous n'avez pas vraiment le temps...";

Chapter 4 - Douves

Douves is a room in Cour du chateau. It is east of Lac artificiel. "Ces douves n'ont pas vraiment d'utilité, de nos jours. D'ailleurs, le pont présent devant l'entrée n'est pas fait pour être déplacé, les éventuels assaillants n'auraient donc aucun mal à entrer. De toute façon, ce n'est pas un peu d'eau qui ferait peur à Bowser...

Une pente vers le bas mène sous l'eau, tandis qu[']à l'ouest se trouve le lac artificiel."

Instead of swimming in Douves, try going down;

Instead of going down in Douves:
	say "Aller nager dans les douves ? Pourquoi faire ? Il n'y a strictement rien à voir là dedans pour l'instant. Peut-être que si vous trouviez un moyen de les vider...";

les douves is a backdrop. It is in Douves and Cascade. It has description "Les douves, entourant tout l'avant du château, sont remplies d'une eau claire. Joli mais pas franchement intimidant, comme moyen de protection.". Understand "douve" as les douves. Understand "eau" as les douves.

Instead of jumping in les douves, try going down;

Part 3 - Chateau

Le chateau is a region. Cour du chateau is in Le chateau.

Chapter 1 - Salle principale

Salle principale is north of point d'arrivee. Salle principale is in le chateau.

Before going north in point d'arrivee for the first time:
	say "Juste avant de passer le pont, une étrange tortue sur un nuage vous aborde.

'Hé, salut Mario, ici Lakitu ! Bon, au cas où tu n'aurais pas remarqué, il n'y a pas de graphismes dans ce jeu, donc je ne pourrais pas te servir à grand chose. Cependant, laisse-moi te donner un conseil : si tu te sens perdu, n'hésite à pas taper la commande [bold type]aide[roman type]. Elle te permettra de savoir les directions que tu peux emprunter et les objets avec lesquels tu peux agir.

Bon, c'est à peu près tout ce que je peux faire. Ciao !'

Le Lakitu repart aussi vite qu'il est arrivé. Étrange personnage.";
	attendre espace;

Before going north in point d'arrivee for the first time:
	say "Vous poussez la porte d'entrée du château...";
	say "En entrant, vos pieds foulent un joli tapis rouge. Alors que vous avancez dans l'entrée, vous vous rendez compte que le château est fort peu animé. En général, rien que la salle principale est remplie de gardes devant toutes les portes, de servants s'affairant dans tous les sens, et de quelques touristes venus admirer le château. Pourtant, cette fois, personne. Une étrange voix vous explique soudainement la situation :

[red letters]'Regardez qui voilà, le pathétique plombier ! Sache que j'ai enfermé tous les habitants du château, y compris ta chère princesse ! J'en ai profité pour fermer toutes les portes grâce à mes étoiles de puissance, que j'ai confiées à mes sbires. Autant dire que tu n'as aucune chance de revoir qui que ce soit. Je te conseille de faire demi-tour, ça te fera perdre moins de temps !

Oh au fait, ne compte pas sur le gâteau : celui-là sera pour moi !'[default letters]

Pas de doute, Bowser a encore remis ça. Il va vous falloir, une fois de plus, sauver la princesse et tout le royaume avec. En avant ! Personne ne doit toucher au gâteau...et à la princesse, bien sûr !";
	attendre espace;
	
The description of Salle principale is "La salle principale vous a toujours parue excessivement grande. Certes, ça a permis au décorateur de joliment embellir la pièce, le papier-peint représentant un magnifique ciel. Mais tout de même, toute la pièce est vide, il pourrait y avoir quelques meubles histoire de remplir. Mais bon, un grand château fait toujours son effet.

Plusieurs portes se trouvent autour de vous. À l'est, une porte marquée d'un 3. Au nord-est, une autre marquée d'un 1, et au nord-ouest, une autre marquée d'un 3. Enfin, une dernière porte, sans numéro, se trouve à l'ouest. La sortie du château est au sud, et un escalier se trouve au nord.";

le Toad is a man in Salle principale. le Toad can be calme or agite. le Toad is agite. "[if the toad is agite]Un Toad essaye d'attirer votre attention en sautant (de manière assez pathétique) sur place.[else]Un Toad se tient près de la porte d'entrée.[end if]". It has description "La garde robe des Toads n'a pas changé : toujours cet espèce de pantalon blanc, avec un gilet de couleur. Ah, et évidemment, l[']énorme chapeau à pois. À vrai dire, vous ne savez même pas s'il s'agit d'un chapeau, ou s'il fait parti du corps du Toad. Et vous ne voulez pas vraiment savoir."

Instead of talking to le Toad:
	if le toad is agite:
		say "'Oh, Mario, Mario, c'est terrible ! Bowser est arrivé, et à capturé tout le monde, y compris la princesse Peach ! Il a transformé toutes les peintures du château en endroits réels, et a fermé toutes les portes grâce à ses étoiles ! Ça a été tellement vite, je n'ai rien pu faire...Et vu mon état, je ne risque pas de pouvoir faire grand chose maintenant...

Tu dois récupérer les étoiles afin d'ouvrir les portes et rattraper Bowser !'";
		now le toad is calme;
	else:
		say "'Vite, Mario ! J'ai remarqué que Bowser avait oublié de fermer la porte à l'ouest, tu devrais y aller !'";
		
Instead of jumping in le Toad:
	say "Vous sautez sur le Toad. Cependant, cela n'a pas l'effet escompté.

'Ouah, Mario, tu sautes toujours aussi bien ! Un jour, il faudra que tu m'apprennes comment faire. Mais pour l'instant, le temps presse, pars chercher les étoiles !'";

Premier etage is a room in Le chateau. It is north of Salle principale. "Quelques marches permettent d'accéder à un bout d[']étage, donnant une jolie vue sur la porte d'entrée du château. Sans doute un endroit de choix pour la Princesse Peach quand elle doit accueillir des invités.

Une porte surmontée d'une énorme serrure se trouve au nord. À l'ouest, une autre porte sur laquelle une énorme (décidément) étoile est peinte. Enfin, à l'est, une dernière porte, identique à celles qui se trouvent en bas, porte le chiffre '1'.
Vous pouvez redescendre en allant vers le sud.".

Porte Glissade is a porte etoilee. Porte glissade is east of Premier etage. It has nombre d'etoiles 1.

Instead of going north in Premier etage, say "Bien entendu, la porte est fermée. L[']énorme serrure sur celle-ci vous indique qu'il va falloir trouver la probablement toute aussi énorme clé qui y est associée...";

Instead of going west in Premier etage, say "Alors que vous approchez de la porte, vous entendez soudainement la voix de Bowser...

[red letters]'Hé, minus, tu crois vraiment pouvoir aller par-là alors que tu as si peu d[']étoiles ? Reviens quand tu en auras huit, bwa ha ha ha ha !'[default letters][line break]Visiblement, il va falloir continuer votre exploration...";

Chapter 2 - Salles des niveaux

Salle de la bataille de Bob-Omb is in Le chateau. "Devant vous se trouve un énorme tableau, représentant une armée de Bob-ombs les uns derrière les autres. Même si la peinture est de qualité, vous ne comprenez pas vraiment pourquoi la princesse garde une image aussi guerrière dans son château. Peut-être parce que l'armée des Toads est clairement moins impressionnante...

Vous pouvez retourner dans la salle principale en allant à l'est."

Porte Bob-Omb is a porte etoilee. It is accessible. Porte Bob-Omb is west of Salle principale and east of Salle de la bataille Bob-Omb. Porte Bob-Omb has nombre d'etoiles 0. It is unlocked.

Peinture Bob-Omb is a peinture. It is in Salle de la bataille Bob-Omb. Peinture Bob-Omb has destination Arrivee Niveau 1. Peinture Bob-Omb has liste des etoiles Table 4.1.
The description of Peinture Bob-Omb is "La peinture représente une armée de Bob-ombs les uns derrière les autres. Même si la peinture est de qualité, vous ne comprenez pas vraiment pourquoi la princesse garde une image aussi guerrière dans son château. Peut-être parce que l'armée des Toads est clairement moins impressionnante..."

Before going west in Salle principale for the first time:
	say "La porte s'ouvre sans rechigner. Il semblerait que Bowser l'ait oubliée, ce qui est à votre avantage. Remarquez, vu le nombre de portes dans ce château, il n'est pas étonnant qu'il en ait oublié une.";
	
Instead of going east in Salle de la bataille de Bob-Omb when total etoiles is 0:
	say "Alors que vous vous alliez ouvrir la porte, le Toad que vous avez vu tout à l'heure apparait soudainement à vos côtés.

'Mario, tu devrais essayer de sauter dans la peinture ! C'est ce que j'ai vu Bowser faire ! C'est la seule façon de le poursuivre et de retrouver les étoiles !'

Sur ces mots plus qu[']étranges (sauter dans une peinture ?), le Toad repart dans la salle principale.";

Salle de la Montagne Gla-Gla is a room in Le chateau. "Au fond de la salle se trouve cette fois trois énormes peintures, qui représentent pourtant toutes les trois la même scène. Voilà encore une drôle de décision de la part du décorateur. Peut-être aimait-il tellement cette peinture qu'il a voulu l'avoir en trois exemplaire...

Dans tous les cas, la porte au sud-est permet de revenir dans la salle principale.".

Peinture Montagne centrale is a peinture. It is in Salle de la Montagne Gla-Gla. It has description "La peinture représente une magnifique montagne couverte de neige. Le genre qui donne envie de se mettre aux sports d'hiver. Ça ne vous ferait d'ailleurs pas de mal d'en faire un peu, vous devriez en profiter !". It has destination Arrivee Niveau 4. It has liste des etoiles Table 4.4. It has printed name "la peinture centrale". Understand "[peinture]" or "[peinture] centrale" or "[peinture] du milieu" or "[peinture] milieu" as Peinture Montagne Centrale.

Peinture Montagne gauche is a thing. It is in Salle de la Montagne Gla-Gla. It has description "La peinture représente une magnifique montagne couverte de neige. Le genre qui donne envie de se mettre aux sports d'hiver. Ça ne vous ferait d'ailleurs pas de mal d'en faire un peu, vous devriez en profiter !". It has printed name "la peinture de gauche". It is scenery. Understand "[peinture]" or "[peinture] de gauche" or "[peinture] gauche" as Peinture Montagne gauche.

Peinture Montagne droite is a thing. It is in Salle de la Montagne Gla-Gla. It has description "La peinture représente une magnifique montagne couverte de neige. Le genre qui donne envie de se mettre aux sports d'hiver. Ça ne vous ferait d'ailleurs pas de mal d'en faire un peu, vous devriez en profiter !". It has printed name "la peinture de droite". It is scenery. Understand "[peinture]" or "[peinture] de droite" or "[peinture] droite" as Peinture Montagne droite.

Instead of jumping in Peinture Montagne droite, say "Vous vous élancez vers le tableau, sautez à pieds joints et...vous écrasez le coin du nez sur la toile. Visiblement, il s'agit là d'un tableau tout à fait normal qui ne vous mènera nulle part.".

Instead of jumping in Peinture Montagne gauche, say "Vous vous élancez vers le tableau, sautez à pieds joints et...vous écrasez le coin du nez sur la toile. Visiblement, il s'agit là d'un tableau tout à fait normal qui ne vous mènera nulle part."

Porte Montagne Glagla is a porte etoilee. It is accessible. Porte Montagne Glagla is northwest of Salle principale and southeast of Salle de la Montagne Gla-Gla. Porte Montagne Glagla has nombre d'etoiles 3.

Salle de la Forteresse de Whomp is a room in Le chateau. "La peinture d'une grande tour se trouve au centre de la pièce. De petits escaliers situés de part et d'autre de la pièce permettent d'y accéder afin de pouvoir l'admirer de plus près.

La porte au sud-ouest permet de retourner dans la salle principale."

Peinture Forteresse is a peinture. It is in Salle de la Forteresse.
The description of Peinture Forteresse is "La peinture représente une énorme tour, autour de laquelle on ne peut voir que le ciel infini. À ses pieds, des canons semblent la protéger, sans doute afin d'empêcher les plus téméraires d'y grimper. La tour elle-même est au milieu de ce qui ressemble à une forteresse, bien que celle-ci soit entourée de champs d'herbes.". It has destination Arrivee Niveau 2. It has liste des etoiles Table 4.2.

Porte Forteresse Whomp is a porte etoilee. It is accessible. Porte Forteresse Whomp is northeast of Salle principale and southwest of Salle de la Forteresse de Whomp. Porte Forteresse Whomp has nombre d'etoiles 1.

Salle de la Baie des Pirates is a room in Le chateau.

Porte Baie Pirates is a porte etoilee. Porte Baie Pirates is east of Salle principale and west of Salle de la Baie des Pirates. Porte Baie Pirates has nombre d'etoiles 3.

Book 3 - Niveaux

Chapter 1 - Bataille de Bob-Omb

Section 1 - Étoiles

Table 4.1 - Etoiles Niveau 1
Numero		Obtenue	Nom	Initialisation	Objectif
1		0	"Le Roi Bob-Omb"	initier 1-1	"Trouvez le Roi Bob-Omb en haut de la colline, et bottez lui les fesses !"
2		0	"Koopa Rapido"	initier 1-2	"Parlez à la tortue à votre arrivée, puis battez-la à la course jusqu'au sommet de la colline. Vous ne devriez pas avoir de problèmes si vous ne flânez pas en route..."
3		0	"Canon vers l[']île perchée"	initier 1-3	"Rendez-vous sur l[']île perchée. Vu sa situation, vous allez sans doute avoir besoin des canons. Le premier canon ne vous servira pas beaucoup, cependant."
4		0	"Les huit pièces rouges"	initier 1-4	"Trouvez les huit pièces rouges cachées dans le niveau."
5		0	"Le trésor du Chomp"	initier 1-5	"Trouvez un moyen d'accéder au trésor du Chomp..."
6		0	"Vol du Mario ailé"	initier 1-6	"Sauter dans le canon de l[']île et visez les pièces. Mais n'oubliez pas votre casquette..."
0		0	"Dummy"	--	""
			
Etoile 1-1 is an etoile. Etoile 1-1 has liste des etoiles Table 4.1.

Etoile 1-2 is an etoile. Etoile 1-2 has liste des etoiles Table 4.1.

Etoile 1-3 is an etoile. "Au beau milieu de l[']île, une étoile de puissance tourne sur elle-même, à quelques centimètres du sol.". Etoile 1-3 has liste des etoiles Table 4.1. It has printed name "l[']étoile".

Before taking Etoile 1-3 :
	say "L[']étoile étant littéralement à portée de main, vous ne vous gênez pas pour l'attraper. À peine celle-ci en votre possession, vous êtes entouré d'un halo blanc...";
	
Etoile 1-4 is an etoile. Etoile 1-4 has liste des etoiles Table 4.1.

Etoile 1-5 is an etoile. "[if Le Chomp is in the location]Une étoile se trouve derrière la cage, mais le Chomp ne semble pas disposé à vous l'amener sur un plateau.[else]Le Chomp étant parti, l[']étoile est à vous ![end if]". Etoile 1-5 has liste des etoiles Table 4.1. It has description "[if Le Chomp is in the location]L[']étoile attend bien sagement que vous la preniez. Mais derrière ces barreaux, cela risque d[']être difficile.[else]L[']étoile attend bien sagement que vous la preniez.[end if]"

Check taking Etoile 1-5:
	if Le Chomp is in the location, say "Vous tentez de vous approcher de la cage, mais le Chomp vous grogne suffisamment dessus pour que vous ne risquiez pas d'aller plus loin." instead;

Initier 1-1 is an activity.
Rule for initier 1-1:
	now Roi Bob-Omb is in Cinquieme niveau de la colline;
	now Roi Bob-Omb is gagnant;

Initier 1-2 is an activity.	
Rule for initier 1-2:
	remove Roi Bob-Omb from play;
	now Koopa Rapido is inactif;
	now Koopa Rapido is perdant;
	now Koopa Rapido is in Arrivee niveau 1;
	now un drapeau is in Cinquieme niveau de la colline;

Initier 1-3 is an activity.
Rule for initier 1-3:
	remove Koopa Rapido from play;
	remove un drapeau from play;
	now Etoile 1-3 is in Ile perchee;
	now Canon 1-1 is inactif;
	now Canon Colline is inactif;
	
Initier 1-4 is an activity.
Rule for initier 1-4:
	now Compteur piece rouge is 0;
	now PR1 is in Sous l'arche;
	now PR2 is in Petit champ;
	now PR3 is in CaviteDeux;
	now PR4 is in Cinquieme niveau de la colline;
	now PR5 is in Ile perchee;
	now PR6 is in Cage du Chomp;		
	now PR7 is in Arrivee niveau 1;
	now PR8 is in CaviteUn;
	
Initier 1-5 is an activity.
Rule for initier 1-5:
	now Etoile 1-5 is in Cage du Chomp;
	now Le Chomp is in Cage du Chomp;
	
Report taking a piece rouge in Niveau 1:
	if Compteur piece rouge is 8:
		now Etoile 1-4 is in Petit champ;
		if the player can see Etoile 1-4, say "Au moment où vous prenez la dernière pièce rouge du niveau, une étoile apparaitre au milieu du champ !" instead;

Canon Ile is a canon. "Un canon trône également en plein milieu de l[']île. Il n[']était pas là avant, d'ailleurs..." It is inactif. It is ouvert. It has destinations {Petit champ}.

Pieces jaunes are a thing. "Vous pouvez voir plusieurs pièces flotter dans les airs, non loin de l[']île.". Understand "pièces" or "pieces" or "pieces jaunes" or "pièces jaunes" as Pieces jaunes. They have description "Les pièces jaunes flottent à quelques mètres de l[']île. Elles sont malheureusement hors de portée.". Instead of taking Pieces jaunes, say "Elles sont bien trop loin de l[']île pour pouvoir les attraper. Ce canon peut peut-être aider...".

Check selecting destination:
	if the player is in Canon Ile:
		say "Vous en profitez pour essayer d'attraper les pièces, mais elles sont en fait plus loin que prévu : la puissance du canon ne suffira pas. Il va vous falloir quelque chose d'autre...En attendant, attention à l'atterrissage !"

Initier 1-6 is an activity.
Rule for initier 1-6:
	now Canon Ile is in Ile perchee;
	now Pieces jaunes are in Ile perchee;

Section 2 - Lieux

Niveau 1 is an region.

la colline is a backdrop in Niveau 1. It has description "La colline s[']élève à plusieurs dizaines de mètres au dessus du sol. Vu sa taille par rapport au reste, elle est difficile à rater."

Arrivee niveau 1 is a room in Niveau 1. It has printed name "Champ de bataille". "Une immensité d'herbe se dresse devant vous. [if canon 1-1 is actif]Mais l'activité qu'on y pratique vous empêche de profiter du paysage : des canons tirent dans tous les sens, produisant un vacarme assourdissant. Il semblerait que ce joli lieu soit le théâtre d'une importante bataille.[else]Le calme est revenu maintenant que le Roi Bob-Omb a été vaincu, permettant de profiter du paysage sans être dérangé par le bruit assourdissant des canons.[end if] Au loin se trouve une immense colline.

Un petit pont au nord vous conduit plus haut, tandis qu[']à l'ouest se trouve un autre chemin menant près d'une arche."

l'herbe is scenery in Arrivee niveau 1. It has description "De l'herbe. Elle est verte. Rien de vraiment intéressant, vous avez déjà vu de l'herbe, pas vrai ?". Understand "herbe" as l'herbe. Instead of taking l'herbe, say "Pourquoi faire ?";

Canon 1-1 is a canon in Arrivee niveau 1. "[if Canon 1-1 is actif]Un canon tirant des bulles se trouve juste devant vous.[else if Canon 1-1 is ferme]Le canon qui se trouvait ici a été rangé sous une grille.[else]Le canon se tient prêt à tirer.[end if]". It has printed name "le canon".  It has description "[if Canon 1-1 is actif]Le canon tire des bulles, mais vous ne parvenez pas à voir où elles atterrissent. L'importance, c'est qu'elles n'atterrissent pas sur vous[else if Canon 1-1 is ferme]Le canon a été rangé bien sagement sous une grille[else]Le canon est prêt à être utilisé. Vous pouvez sauter à l'intérieur quand vous voulez[end if].". It is actif. It has destinations {Cage du Chomp, Pied de la Colline, Deuxieme niveau de la colline};

les bulles are backdrops. They are privately-named. They are in Arrivee niveau 1 and Quatrieme niveau de la colline. They have description "Les bulles atterrissent un peu partout sur le champ de bataille, sans grande conséquences." Understand "bulles" as les bulles when Canon 1-1 is actif. They are undescribed.

Instead of jumping in Canon 1-1 when Canon 1-1 is actif:
	say "Vous tentez d'utiliser le canon, mais changez vite d'avis lorsque le bob-omb s'en occupant commence à vous hurler qu'il est en train de s'en servir. Il ne vaut mieux pas le provoquer, il serait capable de vous exploser à la figure.";
	
Cage du Chomp is a room in Niveau 1. It is north of Arrivee niveau 1. "À l'ouest, un pont à bascule mène au pied de la colline, tandis qu'un autre pont au sud permet de redescendre."

CageChomp is a privately-named scenery in Cage du Chomp. it has printed name "la cage du chomp". Understand "cage" as CageChomp. It has description "[if Le Chomp is in the location]Cette cage devrait plutôt servir à enfermer le Chomp, mais on dirait au contraire que celui-ci la protège. [contenu de la cage][else]Détruite par le Chomp, la cage est dans un triste état...[end if]".

To say contenu de la cage:
	say "[if Etoile 1-5 is in the location]Il va falloir trouver un moyen de l'ouvrir pour accéder à l[']étoile.[else]Ce qui n'a pas grand intérêt, puisqu'elle est vide pour le moment...[end if]"

Pres de l'arche is a room in Niveau 1. It is west of Arrivee niveau 1. "Juste devant vous se trouve une énorme pente d'où descendent de nombreux boulets (que vous évitez avec élégance, d'ailleurs). La pente est tellement raide que vous ne pourriez pas monter par là.

À l'ouest se trouve une arche. Le chemin à l'est retourne à votre point de départ."

Instead of going north in Pres de l'arche, try going up.
Instead of going up in Pres de l'arche:
	say "Vous tentez quand même l'ascension, mais la pente est tellement forte que vous glissez après quelques pas.";

Sous l'arche is a room in Niveau 1. It is west of Pres de l'arche. It is northwest of Pied de la colline. "Vous vous retrouvez sous l'arche faisant office de pont menant à la colline. Pas grand chose d'intéressant à faire ici.

Une pente d'où tombent de nombreux boulets est à l'est. Au sud-est se trouve le pied de la colline."

Pied de la colline is a room in Niveau 1. It is west of Cage du Chomp. "Hé bien, c'est sacrément haut ! Pas étonnant que le roi Bob-omb ait choisi cet endroit comme base d'opération : à partir du sommet, il peut tout observer. La perspective de grimper ne vous enchante guère, mais vous n'avez pas beaucoup le choix.

Au nord, une pente très raide permet d'accéder directement au troisième niveau de la colline. Au nord-est, un chemin bien plus plat mais moins rapide vous permet de monter au second niveau. Un pont menant au Chomp se trouve à l'est. Vous pouvez passer sous l'arche menant à la colline en allant au nord-ouest. Pour finir, au sud se trouve un petit champ."

Petit champ is a room in Niveau 1. It is south of Pied de la colline. "Un petit champ parfait pour se reposer. D'ici, vous avez une belle vue sur la colline, qui s[']élève à une distance très respectable dans le ciel. Vous feriez bien un petit somme, mais vous n'en avez vraiment pas le temps...

Vous pouvez revenir au pied de la colline en allant au nord."

Before going north in Pied de la colline:
	say "Vous avez l'impression de courir sur place, mais après bien des efforts, vous arrivez finalement en haut.";

Deuxieme niveau de la colline is a room in Niveau 1. It is northeast of Pied de la colline. It is east of Troisieme niveau de la colline. "En montant, vous prenez garde d[']éviter un tas d[']énormes boulets tentant de vous écraser. Pas le temps de se demander d'où ils viennent ni pourquoi ils sont là, alors que personne d'autre que vous ne tente de monter la colline, le chemin est encore long.

Vous pouvez redescendre par le sud-ouest ou continuer à monter à l'ouest. Au nord-ouest se trouve une petite cavité."

CaviteUn is a room in Niveau 1. It is northwest of Deuxieme niveau. It has printed name "Petite Cavite". "La cavité est en fait extrêmement étroite, et ne mène nulle part. Elle n'a à première vue aucune utilité.

Vous pouvez en sortir en allant au sud-est.".

After waiting in CaviteUn:
	say "Soudainement, vous êtes téléporté dans un autre endroit...";
		now the player is in Quatrieme niveau de la colline;

la cavite is backdrop. It is in Deuxieme niveau. It is in Quatrieme niveau. Understand "cavite" as cavite. It has description "Un simple renfoncement dans la colline.".

Troisieme niveau de la colline is a room in Niveau 1. It is north of Pied de la colline. "D'ici, vous pouvez déjà voir presque toute la zone de bataille. Maintenant que vous le remarquez, l'intégralité de ce monde semble flotter dans les airs, loin de tout. C'est sans doute lié au fait qu'il s'agit d'une peinture, enfermée dans un cadre qui limite forcément le monde qui s'y trouve.

Le chemin continue au nord. Vous pouvez également redescendre au second niveau par l'est, voire même glisser jusqu'en bas par le sud."

Quatrieme niveau de la colline is a room in Niveau 1. It is north of Troisieme niveau. "Une petite île flotte comme si de rien n[']était non loin de la colline. Elle est cependant trop loin pour que vous puissiez y sauter d'ici.

Au sud-est se trouve une petite cavité. Vous pouvez accéder au dernier niveau par le nord ou redescendre par le sud."

CaviteDeux is a room in Niveau 1. It is southeast of Quatrieme niveau. It has printed name "Petite Cavite". "La cavité est en fait extrêmement étroite, et ne mène nulle part. Elle n'a à première vue aucune utilité.

Vous pouvez en sortir en allant au nord-ouest.".

After waiting in CaviteDeux:
	say "Soudainement, vous êtes téléporté dans un autre endroit...";
	now the player is in Deuxieme niveau de la colline;

Canon colline is a canon in Quatrieme niveau. "[if canon colline is actif]Un canon tire frénétiquement des bulles en direction du champ de bataille. Sa trajectoire semble cependant complètement aléatoire, les bulles atterrissant aussi bien sur des bob-ombs roses que sur des noires. Difficile de savoir à quel côté il appartient, du fait.[else if canon colline is ferme]Le canon a été rangé bien sagement sous une grille			. Les Bob-Ombs se sont peut-être rendus compte qu'il faisait plus de mal que de bien...[else]Le canon posté sur le haut de la colline semble s[']être calmé. Les Bob-Ombs se sont peut-être rendus compte qu'il faisait plus de mal que de bien...[end if]".  It has printed name "le canon". It is privately-named. Understand "canon" as canon colline. It is actif. It has destinations {Arrivee niveau 1, Ile perchee, Cage du Chomp}.

Instead of jumping in canon colline when canon colline is actif:
	say "Le canon est en marche. Vous ne pouvez pas sauter dedans pour le moment."
	
Cinquieme niveau de la colline is a room in Niveau 1. It is north of Quatrieme niveau. "D'ici, vous avez une vue parfaite sur l'intégralité du monde. Vues d'en haut, les bob-ombs ressemblent juste à des points noirs (ou roses) se déplaçant dans tous les sens et explosant sans raison. La guerre n'a vraiment aucun sens.

Vous pouvez redescendre la colline par le sud."

un drapeau is scenery. It has description "Le drapeau indique l'arrivé de la course. Il y a un dessin de carapace dessus."; Instead of doing anything other than examining un drapeau, say "Laissez ce drapeau tranquille !";

Ile perchee is a room in Niveau 1. "Cela semble difficile à croire, mais pourtant, vous vous tenez sur un petit morceau de terre qui flotte dans les airs, sans aucun point d'accroche. Il semblerait que les mondes à l'intérieur des peintures n'obéissent pas entièrement aux lois de la physique, ce qui peut être à votre avantage.

D'ici, vous pouvez uniquement redescendre jusqu[']à la cage du Chomp." It has printed name "Ile perchee."  Down of Ile Perchee is Cage du Chomp. Up of Cage du Chomp is nowhere.

Before going down in Ile Perchee:
	say "Vous sautez vers le bas jusqu[']à la cage du Chomp. Certes, c'est assez haut, mais, hé, vous êtes Mario, quand même !";

Section 3 - Personnages

Bobomb rose is a man in Arrivee niveau 1. "[if canon 1-1 is actif]À ses côtés, un Bob-omb rose observe la trajectoire de chaque bulle[else]Votre ami le Bob-Omb rose n'a plus grand chose à faire maintenant que le canon n'est plus utilisé[end if]." It has printed name "le Bob-Omb rose". It has description "C'est un Bob-Omb. Il est rose. Drôle de couleur pour un Bob-Omb, d'ailleurs. Le noir, ça va, c'est classique, ça passe partout. Mais le rose ? Vous devriez peut-être lui demander d'où lui vient cette couleur.". Understand "bobomb" or "bob omb" as Bobomb rose.

Instead of talking to Bobomb rose when Canon 1-1 is actif:
	say "Alors que vous approchez du bob-omb rose, celui-ci se tourne dans votre direction.

'Oh, mais vous vous croyez où, là ! On est au milieu d'un champ de bataille, mon vieux ! Et vous, vous arrivez les mains dans les poches avec votre salopette et votre casquette. Vous croyez que ça va servir ?

[if etoile actuelle is 1]Bon, écoutez, si vous voulez aider, mes hommes tentent de faire tomber le Roi Bob-omb. Celui-ci se trouve en haut de la colline, là-bas, mais impossible de l'atteindre, les ennemis nous barrent la route. Si vous pouviez nous en débarrasser, ce serait bien gentil. Et la prochaine fois, utilisez un vrai camouflage de guerre !'[else]Il parait que le Roi Bob-Omb a été battu, mais mes informateurs n'en sont pas encore sûrs. En attendant, ne restez pas dans mes pattes et allez vous chercher un vrai camouflage de guerre !'[end if][line break]En vous demandent en quoi le rose est un vrai camouflage de guerre, vous continuez votre route...";

Instead of talking to Bobomb rose when Canon 1-1 is ferme:
	say "Vous vous approchez lentement du Bob-Omb rose, craignant de vous faire encore crier dessus. Heureusement, il a l'air plutôt content, cette fois.
	
'Ah, vous voilà, soldat ! On m'a confirmé que le Roi Bob-Omb avait été battu, et par votre main, en plus ! Je ne sais pas comment vous avez fait, mais merci, ça nous aidera beaucoup dans cette bataille.

Tenez, en gage de gratitude, je vais vous laisser utiliser nos canons. Donnez-moi une seconde que je les ouvre tous.'

Quelques secondes plus tard, le canon qui se trouve juste à côté de vous sort de terre.

'Voilà ! Il vous suffit de sauter dedans, et c'est parti ! Oh, par contre, faites attention : ils ne sont pas toujours très précis. Ne venez pas vous plaindre s'ils ne vous emmènent pas là où vous voulez...'";
	repeat with c running through canons in Niveau 1:
		now c is ouvert;

Instead of talking to Bobomb rose when Canon 1-1 is ouvert:
	say "'Je suis occupé, soldat...'[paragraph break]Cela ressemble être un gros mensonge, le Bob-omb Rose semblant plutôt se tourner les pouces (du moins, s'il en avait). Mais bon, inutile d'insister.";

Instead of jumping in or attacking Bobomb rose:
	say "Vous tenez trop à la vie pour tenter de sauter sur le Bob-omb rose. Malgré sa couleur, vous êtes certain qu'il est capable d'exploser aussi fort que n'importe quel autre bob-omb...";

Le Chomp is a animal in Cage du Chomp. "Ohla ! Encore un peu et vous vous faisiez mordre. Un énorme Chomp, attaché à un piquet, s'agite dans tous les sens, tentant de mordre tout ce qui bouge. En tout cas, voilà une protection efficace contre les gêneurs.". It has printed name "le Chomp". It has description "Le Chomp a beau être attaché par une solide chaine, vous préférez gardez vos distances. Cette énorme boule a des dents qui ferait fuir n'importe qui. Son aboiement est lui aussi assez impressionnant.";
les dents du chomp is a privately-named thing. It is part of Le Chomp. Understand "dents" or "dents du chomp" as les dents du chomp. It has description "Pointues.";

Un piquet is scenery in Cage du Chomp. "[if Le Chomp is in the location]Le piquet, solidement enfoncé dans la terre, est attaché à la chaine du Chomp.[else]Votre puissant coup a complètement enterré le piquet dans la terre.[end if]". It has printed name "le piquet".

Instead of attacking un piquet, try jumping in the noun.

Check jumping in un piquet:
	if Le Chomp is not in the location, say "Le Chomp étant déjà parti, enfoncer davantage le piquet ne servirait à rien." instead.

Carry out jumping in un piquet:
	remove Le Chomp from play;

Report jumping in un piquet:
	say "Vous sautez d'un coup sec sur le piquet à l'aide de votre derrière. Grâce à votre, euh, carrure, vous parvenez à l'enfoncer directement dans le sol.[paragraph break]Le Chomp, maintenant libéré de ses chaines, commence à s'agiter dans tous les sens. Il fonce d'un seul coup sur la cage, qui éclate en mille morceaux, puis s[']éloigne derrière la colline. Va, petit Chomp, profite de ta liberté !" instead;

Every turn when the player is in Cage du Chomp and le Chomp is in Cage du Chomp and a random chance of 1 in 3 succeeds:
	say "[one of]Le Chomp fonce vers vous, ne vous laissant qu'une demi-seconde pour l[']éviter. Heureusement qu'il est attaché.[or]Le Chomp vous aboie dessus en vous regardant d'un mauvais ½il.[or]Le Chomp court après un papillon. Ah, il l'a mangé.[or]Le Chomp tire le plus fort possible pour casser sa chaine. Heureusement, elle est solide. Enfin, à première vue.[in random order]";

Instead of jumping in le Chomp:
	say "Ce n'est clairement pas une bonne idée. Cela marche peut-être d'habitude, mais les Chomps ont la tête (et tout le corps, d'ailleurs) dure. Et puis, un faux mouvement et vous vous retrouveriez avec le derrière planté dans ses dents. Et ça, ça fait vraiment mal.";
		
Instead of talking to le Chomp:
			say "Vous tentez de raisonner un peu avec le Chomp, mais la seule réponse que vous obtenez est un grognement.":
			
Instead of attacking le Chomp, try jumping in the noun.

Roi Bob-Omb is a man. "Devant vous se dresse le Roi Bob-Omb. Celui-ci est tellement occupé à observer la bataille qu'il ne vous a pas remarqué." It has printed name "le roi Bob-Omb". It has description "[if Roi Bob-Omb is perdant]Le Roi s'agite au sol, tentant de se relever.[else]Il est beaucoup plus grand que tous les bob-omb que vous avez vu jusqu'ici : il doit bien faire quatre ou cinq fois la taille standard. Pas étonnant qu'il soi roi. D'ailleurs, la chose est rendue bien claire par l[']énorme couronne qu'il porte sur la tête.[end if]". Understand "bobomb" or "roi" or "bob omb" as Roi Bob-omb.
Roi Bob-Omb can be gagnant or perdant. Roi Bob-Omb is gagnant.

Instead of jumping in Roi Bob-Omb:
	say "Vous savez ce que font la plupart des bob-ombs quand vous sautez dessus ? Ils vous explosent à la figure. Vu sa taille, vous n'avez clairement pas envie que le roi explose, il vous enverrait valdinguer jusqu'en bas de la colline.[line break]Essayez de trouver un autre moyen de vous en débarrasser."

Instead of attacking Roi Bob-Omb:
	say "Vous comptez faire quoi, lui donner quelques coups de poing ? Ça n'aurait pas beaucoup d'effet, et vous vous feriez juste remarquer. Essayez plutôt de le soulever..."

Instead of talking to Roi Bob-Omb, say "Il ne vous a pas remarqué, profitez-en plutôt pour le prendre par surprise !";
	
Instead of pushing Roi Bob-Omb:
	try taking the noun;
		
Instead of taking Roi Bob-Omb:
			say "Alors que celui-ci vous tourne le dos, vous prenez le Roi Bob-Omb a bout de bras et le jetez sur le sol. L'impact provoque une énorme secousse qui vous fait presque tomber.

'Argh ! Mais c'est quoi, ça ! Hé, aidez-moi à me relever, vous savez bien que je n'y arrive pas tout seul ! Hé ! Il y a quelqu'un ?! Où sont mes soldats ?!'

Le Roi Bob-Omb remarque enfin votre présence.

'Hé toi, le type en salopette rouge ! Tu ne sais donc pas que je suis le Roi Bob-Omb ?! Bowser m'a personnellement chargé de garder son étoile de pouvoir, et je ne peux pas y arriver si je suis sur le dos comme ça. Aide-moi à me relever !'

Effectivement, le roi Bob-Omb tient dans sa main une étoile brillante.";
	now Roi Bob-omb is perdant;
	now Etoile 1-1 is in the location.

Instead of going somewhere when the player can see Etoile 1-1:
	say "Vous n'allez pas partir alors que l[']étoile est à portée de main !";

Check quitting level when the player can see Etoile 1-1:
	say "Vous n'allez pas partir alors que l[']étoile est à portée de main !" instead;

Instead of doing something to Roi Bob-Omb when Roi Bob-Omb is perdant:
	say "Laissez-le à son triste sort, et emparez-vous plutôt de l[']étoile !";

Before taking Etoile 1-1:
	say "Vous prenez l[']étoile des mains du roi Bob-Omb. À terre, il ne peut pas vraiment répliquer, mais il tente tout de même de faire connaitre son mécontentement.

'Ne touche pas à ça ! C'est à moi ! Si Bowser vient à l'apprendre, je suis cuit ! Hé, tu m[']écoutes ?! Rends-la moi !'

Au moment où vous touchez l[']étoile, un grand halo blanc vous entoure, vous faisant flotter légèrement en direction du ciel. La dernière chose que vous voyez est le Roi Bob-Omb tentant vainement de se remettre sur ses pieds, en vous lançant quelques insultes."

Koopa Rapido is a man. "[if Koopa Rapido is actif]Vous apercevez Koopa Rapido courir à une vitesse assez impressionnante.[else if Koopa Rapido is in Cinquieme niveau]Koopa Rapido attend, essoufflé, au pied du drapeau.[else]Une grande tortue se tient à quelques mètres devant vous. Elle semble être sur le qui-vive.[end if]".
Understand "tortue" as Koopa Rapido. It has description "Cette tortue est bien plus grande que celles dont vous avez l'habitude : elle fait presque deux fois votre taille. Décidément, tout est grand dans ce monde. Vous remarquez qu'elle semble porter des chaussures de course...Étrange, surtout pour une tortue.". Koopa Rapido can be actif or inactif. Koopa Rapido is inactif. Koopa Rapido can be gagnant or perdant. Koopa Rapido is perdant.

Instead of jumping in or attacking Koopa Rapido:
	say "[if Koopa Rapido is actif]Vous êtes censé faire la course, ce ne serait pas très fair-play ![else]Elle a l'air plutôt amicale, vous n'avez aucune raison de faire ça. Vous devriez plutôt lui parler.[end if]"

Instead of talking to Koopa Rapido when Koopa Rapido is actif:
	say "'Si tu as le temps de parler, tu as le temps de courir, Mario !'
	
Il a raison, vous feriez mieux de vous dépêcher."

Instead of talking to Koopa Rapido when Koopa Rapido is in Arrivee niveau 1:
	say "'Hé, Mario ! Il parait que tu es plutôt rapide quand il s'agit de faire la course. Mais à mon avis, tu n'es pas aussi rapide que moi, Koopa Rapido !

Tu penses que je suis lent parce que je suis une tortue ? Je vais te prouver le contraire ! Faisons la course jusqu'en haut de la colline, là où se trouvait le roi Bob-Omb. Le premier en haut a gagné !'

Vous n'avez même pas le temps de dire un mot que Koopa Rapido a déjà mis la gomme. Il est rapide, d'ailleurs, vous avez intérêt à vous dépêcher.";
	now Koopa Rapido is actif.

Instead of talking to Koopa Rapido when Koopa Rapido is in Cinquieme niveau de la colline:
	if Koopa Rapido is gagnant:
		say "'Ah ah, je savais que j[']étais plus rapide que toi ! Il va falloir t'entrainer un peu plus si tu veux gagner mon étoile, mon gros !'";
		say "Étant donné que vous avez perdu, vous n'avez plus qu[']à recommencer. Vous vous concentrez afin de sortir du tableau...";
		now the player is in Salle de la bataille de Bob-Omb;
	else if Koopa Rapido is perdant:
		say "'Pfou...Tu...Tu es vraiment rapide. Tiens, tu l'as méritée.'[line break]Koopa Rapido sort de sa carapace un objet brillant...Une étoile de puissance ! Bien joué !";
		say "Sans vous faire prier, vous prenez l[']étoile des mains de Koopa Rapido. Aussitôt, vous êtes enveloppé d'un halo blanc, comme la dernière fois. La dernière chose que vous voyez est Koopa Rapido suant à grosses goûtes...";
		now Etoile 1-2 is in the location; 
		try taking Etoile 1-2;

Instead of going somewhere in Cinquieme niveau de la colline when Koopa Rapido is actif:
	say "Vous êtes arrivé premier, vous n'avez plus qu[']à attendre Koopa Rapido et réclamer votre récompense !"

Report going somewhere to Cinquieme niveau de la colline when Koopa Rapido is actif:
	say "Bravo, vous êtes arrivé premier ! Vous n'avez plus qu[']à attendre Koopa Rapido et réclamer votre récompense.";

Carry out waiting in Cinquieme niveau de la colline when Koopa Rapido is actif:
	now Koopa is in Quatrieme niveau de la colline;
	while Koopa Rapido is actif, follow the turn sequence rules.

Every turn when Koopa Rapido is actif and a random chance of 8 in 10 succeeds:
	let parla be west;
	if Koopa Rapido is in Pied de la colline:
		let parla be the best route from the location of Koopa Rapido to Deuxieme niveau de la colline;
	else if Koopa Rapido is in Deuxieme niveau de la colline:
		let parla be the best route from the location of Koopa Rapido to Troisieme niveau de la colline;
	else:
		let parla be the best route from the location of Koopa Rapido to Cinquieme niveau;
	if parla is a direction:
		if Koopa Rapido can be seen by the player, say "Koopa Rapido semble se diriger vers [parla].";
		try silently Koopa Rapido going parla;
	if Koopa Rapido can be seen by the player, say "Vous apercevez Koopa Rapido tenter de vous rattraper.[if the location is Cinquieme niveau de la colline]Vous n'avez plus qu[']à lui parler pour récupérer votre étoile ![end if]";
	if the location of Koopa Rapido is Cinquieme niveau:
		now Koopa Rapido is inactif;
		if Koopa Rapido cannot see the player:
			now Koopa Rapido is gagnant;

Chapter 2 - Forteresse de Whomp

Section 1 - Étoiles

Table 4.2 - Etoiles Niveau 2
Numero		Obtenue	Nom	Initialisation	Objectif
1		0	"Destruction du gros Whomp"	initier 2-1	"Grimpez la forteresse du Whomp, et bottez lui les fesses (à lui aussi) !"
0		0	"Dummy"	--	""

Initier 2-1 is an activity.
Rule for initier 2-1:
	do nothing.
	

Section 2 - Lieux

Niveau 2 is a region.

forteresseBackdrop is a backdrop in Niveau 2. It has printed name "la forteresse".

Arrivee niveau 2 is a room in Niveau 2. It has printed name "Près de l'arbre". "Vous voilà au pied d'une énorme forteresse s[']élevant haut dans le ciel. Décidément, Bowser aime les mondes qui s[']étirent en hauteur. La forteresse elle-même est entourée d'une petite section d'herbe sur laquelle vous vous trouvez actuellement. Elle est du plus belle effet, mais elle jure un peu avec le reste de l'environnement...

Un petit champ de fleur se trouve au nord-est, alors que le chemin vers le nord mène à un grand escalier permettant de commencer l'ascension. Vous pouvez aussi tout simplement grimper vers le haut pour atteindre un grand bassin."

Champ de fleur is a room in Niveau 2. It is northeast of Arrivee niveau 2. "Ce petit champ de fleur est plutôt agréable, au milieu de toute cette pierre. On aurait presque envie de s'y allonger et de faire un petit somme. Pourquoi faut-il toujours que vous tombiez sur ce genre de coin dodo alors que le temps presse ? Bah, vous pourrez toujours y revenir plus tard.

D'ici, il n'y a pas grand chose à faire à part revenir près de l'arbre, au sud-ouest. Vous pouvez aussi tenter de sauter dans le vide..."

Understand "sauter dans le vide" or "sauter dans vide" as a mistake ("Ce n'est pas parce que vous POUVEZ le faire que vous DEVEZ le faire.") when the location is Champ de fleur 

Pied de l'escalier is a room in Niveau 2. It is north of Arrivee niveau 2. "Un escalier de fort belle taille, permettant d'accéder à l'étage supérieure de la forteresse, se trouve devant vous. Plusieurs Thwomps sont postés sur certaines de ses marches, mais bon, depuis le temps, vous avez appris à les éviter avec aisance.

Vous pouvez monter l'escalier en allant fort logiquement vers le haut, ou retourner près de l'arbre en allant au sud."

Before going up from Pied de l'escalier, say "Vous montez l'escalier en évitant les quelques Thwomps sans aucun problème.".

Sommet de l'escalier is a room in Niveau 2. It is up from Pied de l'escalier. "D'ici, vous avez déjà une fort belle vue. Comme les autres mondes, cette forteresse semble flotter au milieu de nulle part, loin de tout. Les Thwomps postés sur l'escalier continue inlassablement de se laisser tomber, sans remarquer que cela ne sert à rien si vous n[']êtes pas en dessous.

Vous pouvez descendre l'escalier en allant vers le bas, ou vous rapprocher du bassin en allant au sud. Un chemin à l'ouest fait le tour du mur d'enceinte."

Before going down from Sommet de l'escalier, say "Pendant votre descente, les Thwomps tentent bien de vous écraser, mais vous êtes bien trop rapide pour eux.".

Bassin is a room in Niveau 2. It is up from Arrivee niveau 2. It is south from Sommet de l'escalier. "Vous barbotez au beau milieu d'un énorme bassin qui ne contient pourtant que quelques centimètres d'eau. La présence de celui-ci au beau milieu de la forteresse est plutôt étrange, mais qu'importe, cela permet de se rafraîchir un peu. S'il s'agit d'une protection, elle ne risque pas d[']être efficace avec si peu d'eau.

Au nord se trouve le sommet de l'escalier mentant au niveau suivant de la forteresse. Une petite section située hors du bassin à l'ouest est également accessible."

Pres du bassin is a room in Niveau 2. It is west of Bassin. "Vous vous situez juste à coté du petit bassin. La partie sur laquelle vous êtes n'est cependant pas recouverte d'eau, ce qui permet de se sécher un peu. Juste devant vous, vous pouvez voir une espèce de structure comportant des piliers ressortir de l'un des pans de la forteresse. Étrange.

Le bassin lui-même se trouve à l'ouest. Une petite pente vers le bas permet de passer sous la structure."

Canon Bassin is a canon in Pres du bassin. It is ferme. It has printed name "le canon". "Un canon [if canon bassin is ferme]recouvert d'une grille[else]prêt à tirer[end if] est encastré dans le sol de la forteresse"

Sous la structure is a room in Niveau 2. It is down from Pres du bassin. "Vous êtes passé sous l'étrange structure, mais vous n'avez toujours aucune idée de ce à quoi elle peut bien servir. S'agit-il d'un poste de garde pour surveiller les alentours ? Et pourquoi voir quoi, alors ? Il ne semble n'y avoir strictement rien à des kilomètres à la ronde...

En tout cas, ici, il n'y a pas grand chose à faire à part revenir en arrière, en remontant la pente."

Dans la structure is a room in Niveau 2. Down from Dans la structure is Sous la structure. "Maintenant que vous êtes à l'intérieur, vous ne savez toujours pas à quoi peut bien servir cette structure. Vous savez juste que se prendre un de ces piliers sur le nez fait un mal de chien.

Une petite plateforme permettant de revenir sur le chemin se trouve juste en dessous. Vous pouvez aller vers le bas pour l'atteindre."

Pied du sommet is a room in Niveau 2. It is west from Sommet de l'escalier. "Vous voilà tout près du sommet de la forteresse. D'ici, vous ne pouvez cependant toujours pas voir ce qui s'y trouve. Sur le chemin, quelques Whomps se baladent, tentant de faire ce qu'ils savent faire de mieux : vous écraser. Enfin, de mieux, on ne peut pas dire qu'ils y arrivent vraiment.

L'escalier permettant de redescendre se trouve à l'est. Vous pouvez monter au sommet de la forteresse en allant en haut."

Sommet de la forteresse is a room in Niveau 2. It is up from Pied du sommet. "Vous voilà maintenant tout en haut de la forteresse. Cette ascension vous fait tout de même vous poser une question : à quoi peut-elle bien servir ? Il ne semble pas y avoir grand chose à protéger, dans le coin...

[if etoile actuelle is 1]D'ici, il n'y a qu'une possibilité : redescendre.[else]Vous pouvez tenter l'ascension de la tour en allant vers le haut, ou redescendre en allant vers le bas.[end if]"

Before going up from Sommet de la forteresse:
	If etoile actuelle > 1, say "Vous entamez l'ascension de la tour à l'aide des quelques plate-formes mouvantes situées autour. Depuis le temps, ce genre de petit parcours est une formalité pour vous.".

Sommet de la tour is a room in Niveau 2. "Hé bien, quelle grimpette. Mais ça valait le coup : la vue est magnifique, et tout tout parait si petit depuis le sommet. Enfin, ne vous penchez pas trop, on ne sait jamais.

Vous ne pouvez pas aller plus haut : il ne vous reste plus qu'à redescendre.".

Cage volante is a room in Niveau 2. Down from Cage is Arrivee niveau 2. "TODO"

Îles volantes is a room in Niveau 2. Down from Îles volantes is Arrivee niveau 2. "TODO"

Chapter 3 - Montagne Gla-Gla

Section 1 - Étoiles

Table 4.4 - Etoiles Niveau 4
Numero		Obtenue	Nom	Initialisation	Objectif
1		0	"Glissade sur glace"	initier 4-1	"Faites un petit tour dans le chalet..."
0		0	"Dummy"	--	""

Initier 4-1 is an activity.
Rule for initier 4-1:
	do nothing.
	

Section 2 - Lieux

Niveau 4 is a region.

Arrivee niveau 4 is a room in Niveau 4. It has printed name "Sommet de la montagne". "Vous voilà au sommet d'une énorme montagne recouverte de neige, d'un blanc immaculé. Vous rêvez quelques secondes aux vacances que vous pourriez passer ici avec la princesse, à dévaler les pentes en ski, à se battre à coup de boules de neige, pour enchaîner sur un bon chocolat chaud dans le beau petit chalet qui se dresse juste devant vous...Mais reprenez-vous, avant d'en arriver là, vous avez encore du travail !

Vous pouvez suivre la pente qui mène au niveau inférieur de la montagne par le nord. À l'est se trouve un petit pont, qui semble à première vue cassé.  Enfin, il semble possible de sauter dans la cheminé du chalet en allant vers le bas..."

chaletScenery is scenery in Arrivee niveau 4. It has printed name "le chalet".  Understand "chalet" as chaletScenery. It has description "Ce petit chalet tout en bois semble parfait pour faire une pause après une bonne randonnée en montagne. Petit détail gênant : le seul moyen d'y entrer semble être la cheminée..."

La cheminee is scenery in Arrivee niveau 4. It has printed name "la cheminée". It has description "La cheminée semble assez grande pour permettre d'entrer dans le chalet. Oui, même pour vous. C'est dire." Instead of jumping in la cheminee, try going down.

Petit pont 1 is a room in Niveau 4. It is east of Arrivee niveau 4. It has printed name "Petit pont". "Un petit pont part du bord de la montagne pour mener...Nulle part. Il a visiblement été cassé par une des nombreuses tempêtes soufflant régulièrement sur la montagne. Visiblement, ce n'est pas par ici que vous pourrez continuer votre exploration.

Vous pouvez retourner près du chalet en allant vers l'ouest."

After waiting in Petit pont 1:
	say "Soudainement, vous êtes transporté vers un autre endroit...";
	now the player is in Petit pont 2;

Milieu de la montagne is a room in Niveau 4. It is north from Arrivee niveau 4. It has printed name "A mi-chemin de la descente". "Il n'y a pas à dire, vous êtes bien content de devoir descendre la montagne que de devoir la monter. Ainsi, vous pouvez glisser tranquillement le long de la pente. La remonter serait sans doute beaucoup plus compliqué.

Votre glissade vous amène à un petit embranchement. Vous pouvez continuer à descendre en allant vers le bas, ou continuer vers le nord en longeant le flan de la montage."

Instead of going south from milieu de la montagne, say "Vous tentez de grimper la pente mais ne parvenez à faire que du sur-place. Celle-ci est beaucoup trop raide pour être remontée, visiblement."

Flan de la montagne is a room in Niveau 4. It is north from Milieu de la montagne. "Y'a pas de doute, c'est haut. Vous n[']êtes pas capable d'estimer la hauteur de cette montagne, mais elle est suffisamment haute pour que vous ne tentiez pas d'atteindre le pied en sautant d'ici : c'est le meilleur moyen de se rompre le coup. Vous en profitez tout de même pour admirer la montagne et la neige qui la recouvre, reflétant les rayons du soleil.

Il vous est impossible de continuer votre progression, à moins de courir sur la montagne elle-même, ce qui serait un exploit, même pour vous. Votre seul choix est de revenir en arrière par le sud."

Bord de la montagne is a room in Niveau 4. It is down from Milieu de la montagne. "Vous vous laissez glisser tranquillement jusqu'au niveau inférieur, en pensant qu'une luge serait l'outil parfait pour ce genre d'activité. Votre rêverie est cependant vite interrompue par un petit détail : vous foncez droit dans le vide. Heureusement, vous freinez juste à temps, et notez dans un coin de demander au gérant d'installer des barrières. Enfin, au moins vous êtes presque arrivé en bas.

Un pont mène jusqu'au pied de la montage, vers le bas. À l'ouest se trouve une petite île flottante, accessible par un simple saut."

Instead of going up from Bord de la montagne, say "Impossible de remonter d'ici. Non seulement vous ne parviendriez pas à courir sur la pente, mais vous risquez en plus de glisser et tomber dans le vide. Ce qui n'est pas franchement une bonne idée."

IleMontagne is a room in Niveau 4. It is west from Bord de la montagne. It has printed name "Petite ile". "Vous sautez tranquillement jusqu'à l'île depuis le pont. Reste que votre réception se doit d[']être parfaite : la superficie de l'île est telle qu'il serait facile de mal viser et de tomber dans le vide. Heureusement, ce n'est pas votre style.

D'ici, vous pouvez sauter jusqu'au bord de la montagne en allant vers l'est."

Chalet is a room in Niveau 4. It is down from Arrivee niveau 4. "Vous vous glissez dans la large cheminée et atterrissez au milieu du chalet. Vous qui vous attendiez à un charmant petit intérieur avec un feu pour pouvoir vous réchauffer, vous êtes bien déçu : en dehors des murs, le chalet ne contient strictement rien. Il semblerait que vous ne puissiez jamais vous accorder de pause.

Bizarrement, il manque un des murs : à la place, une espèce d'immense toboggan de glace serpentant dans tous les sens semble mener plus bas. Vous n[']êtes pas capable de voir sa destination d'ici, mais la descente risque de sacrément secouer. Vous pouvez allez vers le bas pour l'emprunter."

Instead of going up in Chalet, say "Descendre dans la cheminée était simple. Y remonter s’avérerait beaucoup plus compliqué. Comment fait-il, le gros barbu ?" 

Milieu de la glissade is a room in Niveau 4. It is down from Chalet. It has printed name "A mi-chemin". "Vous vous lancez vers la pente et entamez votre glissade. Finalement, c'est plutôt amusant ! Si on excepte, bien sûr, le fait que les bords du chemin ne soient absolument pas protégés, ce qui vaut dire qu'une simple erreur de trajectoire vous enverrait valdinguer dans le vide. Mieux vaut ne pas trop y penser. 

Au milieu de la glissade, vous commencez à longer un mur. Vous remarquez qu'une partie de ce mur semble différent du reste...Vous pouvez vous approcher de ce mur en allant vers le nord, ou continuer la glissade tranquillement vers le bas."

Instead of going up in Milieu de la glissade, say "Impossible de remonter d'ici, vous risquez juste de glisser et de tomber dans le vide. Qui sait où ça vous mènerait..."

Before going north in Milieu de la glissade, say "Vous tentez de vous rapprocher lentement du mur, mais n[']êtes pas capable de contrôler votre vitesse. Résultat des courses, vous foncez littéralement dans le mur. Au moment de l'impact, cependant, vous passez comme si de rien n'était à travers...Vous ne comprenez pas trop comment cela est possible, mais qu'importe : vous venez d'emprunter un petit raccourci bien plus agréable à parcourir que l'énorme pente aux bords non-protégés."

En bas du chalet is a room in Niveau 4. It is down from Milieu de la glissade. It is north from Milieu de la glissade. It is east from Pied de la montagne. "Les concepteurs de cette glissade ont une façon très originale d'indiquer la fin de celle-ci. La pente sur laquelle vous vous trouvez s'arrête soudainement, et vous n'avez pas assez de temps pour freiner. Vous finissez votre course dans le mur, ce qui a l'avantage de vous permettre de vous arrêter sans problème. Mais pas sans douleur.

Vous voilà donc au pied du chalet. Comme au sommet, cette pièce est parfaitement vide, en dehors d'une porte à l'ouest. Qui a bien pu construire un chalet pour finalement ne rien y mettre en dehors d'un espèce de toboggan extrêmement dangereux ?"  

Instead of going up from En bas du chalet, say "Impossible de remonter vers le sommet d'ici : la pente est beaucoup trop raide. Dommage, vous auriez bien refait un tour..."
Instead of going south from En bas du chalet, say "Impossible de remonter vers le sommet d'ici : la pente est beaucoup trop raide. Dommage, vous auriez bien refait un tour..."

Pied de la montagne is a room in Niveau 4. It is down from Bord de la montagne. "Votre périple est terminé : vous êtes maintenant au pied de la montagne. Celle-ci est tellement haute que vous ne parvenez même pas à apercevoir le sommet d'ici.

Vous pouvez traverser le pont menant vers le bord de la montagne en allant vers le haut. À l'est se trouve un petit renfoncement dans la montagne, mais d'ici, vous ne pouvez voir ce qui s'y trouve."

Instead of going east from Pied de la montagne, say "Vous avez beau tirer puis pousser aussi fort que vous le pouvez, la porte ne bouge pas. Visiblement, elle ne permet que de sortir du chalet, pas d'y entrer."

Petit pont 2 is a room in Niveau 4. It is west from Pied de la montagne. It has printed name "Petit pont". "Dans le renfoncement de la montagne, vous découvrez un petit pont tentant tant bien que mal de tenir debout. Ce qui n'est pas facile, vu qu'il ne reste que quelques planches encore en bon état. La seule destination que ce pont vous permettrait d'atteindre, c'est le vide...

Vous pouvez retourner au pied de la montagne en allant vers l'est." 

After waiting in Petit pont 2:
	say "Soudainement, vous êtes transporté vers un autre endroit...";
	now the player is in Petit pont 1;

Pied de la structure is a room in Niveau 4. "Une immense structure de glace se dresse devant vous. Impossible de dire si elle est d'origine naturelle ou si un quelconque artiste fou a soudainement décidé de sculpter de l'art abstrait. Il semble y avoir quelque chose au sommet, mais d'ici, il est difficile de discerner quoi que ce soit."

Instead of going up in Pied de la structure, say "Vous tentez d'entamer l'escalade de la structure, mais même vos formidables capacités ne vous permettent pas d'atteindre le sommet : il est situé beaucoup trop loin pour pouvoir sauter jusqu'ici. Tout ce que vous parvenez à faire, c'est vous prendre le mur. Hm, le mur..."

Mur is a backdrop in Pied de la structure. It has printed name "le mur". It has description "Le mur longe la structure de glace. En l'utilisant à votre avantage, vous parviendrez sans doute à atteindre le sommet..."

Instead of jumping in mur:
	say "Vous tentez à nouveau de sauter jusqu'au sommet, mais cette fois, vous avez un plan. Alors que vous vous apprêtiez à vous manger le mur à nouveau, vous vous retournez et prenez appui de toute vos forces sur celui-ci, vous permettant de gagner l'élan supplémentaire nécessaire pour atteindre le sommet. Quelle classe !";
	now the player is in Sommet de la structure;

Sommet de la structure is a room in Niveau 4. Down from Sommet de la structure is Pied de la structure. "Vous atterrissez tranquillement au sommet de la structure, et en profitez pour saluer la foule après votre performance. Personne n'est là pour vous applaudir, mais qu'importe, cela fait plaisir de voir que vous êtes toujours aussi en forme.

Pour redescendre, il n'y a pas trente-six solutions..."