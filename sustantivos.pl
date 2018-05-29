%Sustantivos 

sustantivo(["carro"],["car"],m,s);!.
sustantivo(["perro"],["dog"],m,s);!.
sustantivo(["manzana"],["apple"],f,s);!.
sustantivo(["hermano"],["brother"],m,s);!.




%Pronombres persona cantidad tiempo sexo
pronombre(["yo"],["i"],p,s,mf);!.
pronombre(["usted"],["you"],s,s,mf);!.
pronombre(["ella"],["she"],t,s,f);!.
pronombre(["él"],["he"],t,s,f);!.
pronombre(["eso"],["it"],t,s,mf);!.
pronombre(["nosotros"],["we"],p,p,m);!.
pronombre(["nosotras"],["we"],p,p,f);!.
pronombre(["ustedes"],["you"],s,p,mf);!.
pronombre(["ellas"],["they"],t,p,f);!.
pronombre(["ellos"],["they"],t,p,m);!.

%Verbos pregiliares
preg(["yo"],["do","i"],i,s,pr);!.
preg(["usted"],["do","you"],i,s,pr);!.
preg(["él"],["does","he"],m,s,pr);!.
preg(["ella"],["does","she"],f,s,pr);!.
preg(["eso"],["does","it"],i,s,pr);!.
preg(["ustedes"],["do","you"],i,p,pr);!.
preg(["ellos"],["do","they"],m,p,pr);!.
preg(["ellas"],["do","they"],f,p,pr);!.

preg(["usted"],["did","you"],i,s,pa);!.
preg(["él"],["did","he"],m,s,pa);!.
preg(["ella"],["did","she"],f,s,pa);!.
preg(["eso"],["did","it"],i,s,pa);!.
preg(["ustedes"],["did","you"],i,p,pa);!.
preg(["ellos"],["did","they"],m,p,pa);!.
preg(["ellas"],["did","they"],f,p,pa);!.

preg(["usted"],["were","you"],i,s,pa);!.
preg(["él"],["was","he"],m,s,pa);!.
preg(["ella"],["was","she"],f,s,pa);!.
preg(["eso"],["was","it"],i,s,pa);!.
preg(["ustedes"],["were","you"],i,p,pa);!.
preg(["ellos"],["were","they"],m,p,pa);!.
preg(["ellas"],["were","they"],f,p,pa);!.

preg(["usted"],["will","you"],i,s,f);!.
preg(["él"],["will","he"],m,s,f);!.
preg(["ella"],["will","she"],f,s,f);!.
preg(["eso"],["will","it"],i,s,f);!.
preg(["ustedes"],["will","you"],i,p,f);!.
preg(["ellos"],["will","they"],m,p,f);!.
preg(["ellas"],["will","they"],f,p,f);!.


%Auxiliares
aux([""],["do"],p,s,pr);!.
aux([""],["do"],s,s,pr);!.
aux([""],["does"],t,s,pr);!.
aux([""],["do"],p,p,pr);!.
aux([""],["do"],s,p,pr);!.
aux([""],["do"],t,p,pr);!.
aux(["no"],["don´t"],p,s,pr);!.
aux(["no"],["don´t"],s,s,pr);!.
aux(["no"],["doesn´t"],t,s,pr);!.
aux(["no"],["don´t"],p,p,pr);!.
aux(["no"],["don´t"],s,p,pr);!.
aux(["no"],["don´t"],t,p,pr);!.

aux([""],["did"],p,s,pa);!.
aux([""],["did"],s,s,pa);!.
aux([""],["did"],t,s,pa);!.
aux([""],["did"],p,p,pa);!.
aux([""],["did"],s,p,pa);!.
aux([""],["did"],t,p,pa);!.
aux(["no"],["didn´t"],p,s,pa);!.
aux(["no"],["didn´t"],s,s,pa);!.
aux(["no"],["didn´t"],t,s,pa);!.
aux(["no"],["didn´t"],p,p,pa);!.
aux(["no"],["didn´t"],s,p,pa);!.
aux(["no"],["didn´t"],t,p,pa);!.

verbo([""],["will"],p,s,f);!.
verbo([""],["will"],s,s,f);!.
verbo([""],["will"],t,s,f);!.
verbo([""],["will"],p,p,f);!.
verbo([""],["will"],s,p,f);!.
verbo([""],["will"],t,p,f);!.

verbo(["no"],["won´t"],p,s,f);!.
verbo(["no"],["won´t"],s,s,f);!.
verbo(["no"],["won´t"],t,s,f);!.
verbo(["no"],["won´t"],p,p,f);!.
verbo(["no"],["won´t"],s,p,f);!.
verbo(["no"],["won´t"],t,p,f);!.


