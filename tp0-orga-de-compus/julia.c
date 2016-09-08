#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#define CANTIDAD_MAXIMA_ITERACIONES 255
struct complejo{
	double real;
	double imaginario;
};


struct resolucion{
	unsigned int ancho;
	unsigned int alto;

};

struct pixel{
	unsigned int x;
	unsigned int y;
};

struct complejo multiplicarComplejos(struct complejo primerComplejo, struct complejo otroComplejo){
	struct complejo aux;
	aux.real=primerComplejo.real*otroComplejo.real-primerComplejo.imaginario*otroComplejo.imaginario;
	aux.imaginario=primerComplejo.real*otroComplejo.imaginario+primerComplejo.imaginario*otroComplejo.real;
	return aux;


}

struct complejo sumarComplejos(struct complejo primerComplejo, struct complejo otroComplejo){
	struct complejo aux;
	aux.real=primerComplejo.real+otroComplejo.real;
	aux.imaginario=primerComplejo.imaginario+otroComplejo.imaginario;
	return aux;
}
struct complejo encontrarComplejo(struct resolucion res,double anchoPlano,double altoPlano,struct pixel pixelActual, struct complejo centro ){
	double bordeIzquierdoRealDelPlano,bordeSuperiorImaginarioDelPlano;
	struct complejo resultado;
	double anchoPixel=((double)anchoPlano)/res.ancho;
	double altoPixel=((double)altoPlano)/res.alto;
	bordeIzquierdoRealDelPlano=centro.real-anchoPlano/2;
	bordeSuperiorImaginarioDelPlano=centro.imaginario-altoPlano/2;
	resultado.imaginario=bordeSuperiorImaginarioDelPlano+(pixelActual.y+0.5)*altoPixel;
	resultado.real=bordeIzquierdoRealDelPlano+(pixelActual.x+0.5)*anchoPixel;
	return resultado;

} 

void escribirPrologo(FILE * archivo, struct resolucion res);
double modulo(struct complejo z){
	return sqrt(z.real*z.real+z.imaginario*z.imaginario);
}

void comma_to_dot(char *input) {
    char *ptr = NULL;
    while(ptr = strpbrk(input, ",")) { //find the first dot in input
        *ptr = '.'; //replace the dot with a comma
    }
}

int main (int argc, char** argv){
    
    	/* Aca se deberia chequear si la cantidad de elementos en argv es correcta */

	char* datos[] = {"640x480","0-10i","0,285-0,01i", "4", "4", "-"};

	for (int i = 0; i < argc; i++){
		if (!strcmp(argv[i],"-r")){
			datos[0] = argv[i+1];

		}
		if (!strcmp(argv[i],"-c")){
			datos[1] = argv[i+1];
		}
		if (!strcmp(argv[i],"-C")){
			datos[2] = argv[i+1];
		}
		if (!strcmp(argv[i],"-w")){
			datos[3] = argv[i+1];
		}
		if (!strcmp(argv[i],"-H")){
			datos[4] = argv[i+1];
		}
		if (!strcmp(argv[i],"-o")){
			datos[5] = argv[i+1];
		}
	}

     	unsigned int i, j,k;
	double anchoPlano=atof(datos[3]);
        double altoPlano=atof(datos[4]);
	struct complejo z,zc,centro;
	struct resolucion resolucionActual;
	FILE * archivo;
	archivo = fopen ( datos[5], "w" );
        
	/*Obtiene la resolucion*/
        
        char* resolucionHorizontal;
	char* resolucionVertical;
        char* token;
        char* line1 = (char*) malloc(12*sizeof(char));
        strcpy(line1, datos[0]);
        char* search = "x";

        resolucionHorizontal = strtok(line1, search);
        resolucionVertical = strtok(NULL, search);
        
        free(line1);
        
        resolucionActual.ancho=atoi(resolucionHorizontal);
	resolucionActual.alto=atoi(resolucionVertical);
        
        /*Obiene centro*/
        
        char* centroReal;
        char* centroImaginario;
        char* line2 = (char*) malloc(12*sizeof(char));
        strcpy(line2, datos[1]);
        centroReal = strtok(line2,"+");
        centroImaginario = strtok(NULL,"+");
        if (centroImaginario){
            centroImaginario[strlen(centroImaginario)-1] = '\0';
        }
        if (!centroImaginario){
            centroReal = strtok(line2,"-");
            centroImaginario = strtok(NULL,"-");
            memmove(&centroImaginario[1], &centroImaginario[0], strlen(centroImaginario)-1);
            memmove(&centroImaginario[0], "-", 1);
        }
        comma_to_dot(centroReal);
        comma_to_dot(centroImaginario);
        
        free(line2);

     	centro.real=atof(centroReal);
	centro.imaginario=atof(centroImaginario);

        /*Obtiene parametro c*/
        
        char* zcReal;
        char* zcImaginario;
        char* line3 = (char*) malloc(12*sizeof(char));
        strcpy(line3, datos[2]);
        zcReal = strtok(line3,"+");
        zcImaginario = strtok(NULL,"+");
        if (zcImaginario){
            zcImaginario[strlen(zcImaginario)-1] = '\0';
        }
        
        if (!zcImaginario){
            zcReal = strtok(line3,"-");
            zcImaginario = strtok(NULL,"-");
            memmove(&zcImaginario[1], &zcImaginario[0], strlen(zcImaginario)-1);
            memmove(&zcImaginario[0], "-", 1);
        }

        comma_to_dot(zcReal);
        comma_to_dot(zcImaginario);
        
        free(line3);
               
        zc.real = atof(zcReal);
        zc.imaginario = atof(zcImaginario);
        
	escribirPrologo (archivo,resolucionActual);
	for(i=0;i<resolucionActual.alto;i++){
		for(j=0;j<resolucionActual.ancho;j++){
			struct pixel pixelActual;
			pixelActual.x=j;
			pixelActual.y=i;
			z=encontrarComplejo(resolucionActual,anchoPlano,altoPlano,pixelActual,centro);
			k=0;
			while(k<CANTIDAD_MAXIMA_ITERACIONES&&modulo(z)<=2){
				z=multiplicarComplejos(z,z);
				
				z=sumarComplejos(z,zc);
				k++;
			}
			fprintf(archivo,"%u ",k);
 
		}
		fputs("\n",archivo);
	}

	fclose(archivo);

}

void escribirPrologo(FILE * archivo, struct resolucion res){
	fputs("P2\n",archivo);
	fprintf(archivo, "%u %u\n", res.ancho,res.alto);
	fprintf(archivo,"%i\n",CANTIDAD_MAXIMA_ITERACIONES);
}







