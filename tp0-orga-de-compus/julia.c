#include <stdio.h>
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
int main (int argc, char** argv){
    
    	/* Aca se deberia chequear si la cantidad de elementos en argv es correcta */

	char* datos[] = {"640x480","0 + 0i","0,285 − 0,01i", "4", "4", "-"};

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

	/*char* resulucionHorizontal;
	char* resulucionVertical;
	/*char line[] = datos[0];
	char line[] = "640x440";
	char *search = "x";

	resulucionHorizontal = strtok(datos[0],search);
	printf("%s \n", resulucionHorizontal);
	
	resulucionVertical = strtok(NULL,search);
	printf("%s \n", resulucionVertical);*/

    
    
	unsigned int i, j,k;
	double anchoPlano=4,altoPlano=4;
	struct complejo z,zc,centro;
	struct resolucion resolucionActual;
	FILE * archivo;
	archivo = fopen ( "prueba0.pmg", "w" );
	resolucionActual.ancho=1200;

	resolucionActual.alto=1024;
	zc.real=0.285;
	zc.imaginario=-0.01;
	centro.real=0;
	centro.imaginario=0;
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
			fprintf(archivo,"%i ",k);
 
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







