echo casos favorables
./julia -o uno.pgm
./julia -c 0-1i -o - -r 10x20
./julia -r 1x1 -o dos.pgm -r 100x100
./julia -r 640x479 -o tres.pgm -r 100x100
./julia -o cuatro.pgm -c  -0,333-0.25i -w 0.5  -H 0.5 -r 100x100
./julia -C -0.333+0i -o cinco.pgm -r 100x100
./julia -o seis.pgm -C -0.8+0.25i -r 100x100
./julia -o siete.pgm -C 0+0.8i -r 100x100
./julia -o ocho.pgm -C -0.8+0i -r 100x100

#casos de error
echo casos error
./julia -o noDeberiaAparecer.pgm -r 0x1
./julia -o noDeberiaAparecer2.pgm -r 1x0
./julia -o noDeberiaAparecer3.pgm -c 0+4
./julia -o noDeberiaAparecer4.pgm -c i
./julia -o noDeberiaAparecer5.pgm -w 0
./julia -o noDeberiaAparecer6.pgm -H -1
./julia -o noDeberiaAparecer7.pgm -k
./julia -o noDeberiaAparecer8.pgm -H fsafsdafa
./julia -o noDeberiaAparecer9.pgm -r x3
./julia -o noDeberiaAparecer10.pgm -r fdsafsda
./julia -o noDeberiaAparecer11.pgm -r 3x
./julia -o noDeberiaAparecer12.pgm -r gdfgsdxfsdaafds
./julia -o noDeberiaAparecer13.pgm -r 1.3x1.3
./julia -o noDeberiaAparecer14.pgm -c fsdafsd+rrerewi
./julia -o noDeberiaAparecer15.pgm -C fsdafsad-fdsafsdafai
./julia -o noDeberiaAparecer16.pgm -r fdsafasdfa+4ffai
./julia -o noDeberiaAparecer17.pgm -c
./julia -o noDeberiaAparecer18.pgm -C
./julia -o noDeberiaAparecer19.pgm -H
./julia -o noDeberiaAparecer20.pgm -h
./julia -o noDeberiaAparecer21.pgm -w

