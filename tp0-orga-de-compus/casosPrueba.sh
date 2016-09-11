./julia -o uno.pmg
./julia -c 0-1i -o - -r 10x20
./julia -r 1x1 -o dos.pmg
./julia -r 640x479 -o tres.pmg
./julia -o cuatro.pmg -c  -0.333-0.25i -w 0.5  -H 0.5
./julia -C -0.333+0i -o cinco.pmg
./julia -o seis.pmg -C -0.8+0.25i
./julia -o siete.pmg -C 0+0.8i
./julia -o ocho.pmg -C -0.8+0i
./julia -o noDeberiaAparecer.pmg -r 0x1
./julia -o noDeberiaAparecer2.pmg -r 1x0
./julia -o noDeberiaAparecer3.pmg -c 0+4
./julia -o noDeberiaAparecer4.pmg -c i
./julia -o noDeberiaAparecer5.pmg -w 0
./julia -o noDeberiaAparecer6.pmg -H -1
./julia -o noDeberiaAparecer7.pmg -k
