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
	bordeSuperiorImaginarioDelPlano=centro.imaginario+altoPlano/2;
	resultado.imaginario=bordeSuperiorImaginarioDelPlano-(pixelActual.y+0.5)*altoPixel;
	resultado.real=bordeIzquierdoRealDelPlano+(pixelActual.x+0.5)*anchoPixel;
	return resultado;

} 
void imprimirManual(){
	FILE* manual=fopen("manual.txt", "r");
	char c;

	FILE *f;
	
	f=fopen("manual.txt","r");
	
	if( f==NULL )
		printf("Error al abrir el fichero\n");
		
	else
	{
		while( !feof(f) )
			printf("%c",getc(f));
	}
}

int esValida(struct resolucion res){
	return (res.alto>0&&res.ancho>0);
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

int main (int argc, char* argv[]){
    
    	/* Aca se deberia chequear si la cantidad de elementos en argv es correcta */

	char* datos[] = {"640x480","0+0i","0,285+0,01i", "4", "4", "-"};
     	unsigned int i, j,k;
	int estaReconocido;
	FILE * archivo;
	
	i=1;
	while(i < argc){
		estaReconocido=0;

		if (!strcmp(argv[i],"-r")){
			datos[0] = argv[i+1];
			estaReconocido=1;
			i++;

		}
		if (!strcmp(argv[i],"-c")){
			datos[1] = argv[i+1];
			estaReconocido=1;
			i++;
		}
		if (!strcmp(argv[i],"-C")){
			datos[2]=argv[i+1];
			estaReconocido=1;
			i++;
		}
		if (!strcmp(argv[i],"-w")){
			datos[3] = argv[i+1];
			estaReconocido=1;
			i++;
		}
		if (!strcmp(argv[i],"-H")){
			datos[4] = argv[i+1];
			estaReconocido=1;
			i++;
		}
		if (!strcmp(argv[i],"-o")){
			datos[5] = argv[i+1];
			estaReconocido=1;
			i++;
		}
		if(!estaReconocido){
			printf("No se reconoce el comando %s, el manual de uso sera impreso a continuacion",argv[i]);
			imprimirManual();
			exit(-1);
		}

		i++;
	}
                
        
	double anchoPlano=atof(datos[3]);
        if(!(anchoPlano>0)){
		printf("Ancho invalido");
		printf("\n");
		exit(-1);
	}
	double altoPlano=atof(datos[4]);
	if(!(altoPlano>0)){
		printf("Alto invalido");
		printf("\n");
		exit(-1);
	}
	struct complejo z,zc,centro;
	struct resolucion resolucionActual;
        
	/*Obtiene la resolucion*/
        
        char* resolucionHorizontal;
	char* resolucionVertical;
        char* token;
        char* line1 = (char*) malloc(30*sizeof(char));
        strcpy(line1, datos[0]);
        char* search = "x";

        resolucionHorizontal = strtok(line1, search);
        resolucionVertical = strtok(NULL, search);
        
        free(line1);
        
        resolucionActual.ancho=atoi(resolucionHorizontal);
	resolucionActual.alto=atoi(resolucionVertical);
        if(!esValida(resolucionActual)){
		printf("Resolucion invalida");
		printf("\n");
		exit(-1);
	}	
        /*Obiene centro*/
        
        char* centroReal;
        char* centroImaginario;
        char* line2 = (char*) malloc(30*sizeof(char));
        strcpy(line2, datos[1]);
        if(datos[1][strlen(datos[1])-1]!='i'||strlen(datos[1])<4){
		printf("No se puede interpretar este centro");
		printf("\n");
		exit(-1);
	}
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
	    if(datos[1][0]=='-'){
            memmove(&centroReal[1], &centroReal[0], strlen(centroReal));
            memmove(&centroReal[0], "-", 1);
	    }
        }
        comma_to_dot(centroReal);
        comma_to_dot(centroImaginario);
        
	free(line2);
     	centro.real=atof(centroReal);
	centro.imaginario=atof(centroImaginario);

        /*Obtiene parametro c*/
        if(datos[2][strlen(datos[2])-1]!='i'||strlen(datos[2])<4){
		printf("No se puede interpretar este paramentro c");
		printf("\n");
		exit(-1);
	}
        char* zcReal;
        char* zcImaginario;
        char* line3 = (char*) malloc(30*sizeof(char));
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
            if(datos[2][0]=='-'){
         	   memmove(&zcReal[1], &zcReal[0], strlen(zcReal));
         	   memmove(&zcReal[0], "-", 1);
	    }
	}	
	
        comma_to_dot(zcReal);
        comma_to_dot(zcImaginario);
        
        free(line3);
               
        zc.real = atof(zcReal);
        zc.imaginario = atof(zcImaginario);
        
	if (strcmp(datos[5],"-")){
            archivo = fopen ( datos[5], "w" );
        }
	else{
	    archivo=stdout;
	}
        printf("Resolucion: %u x %u \n",resolucionActual.ancho,resolucionActual.alto);
        printf("Centro: (%f,%f) \n", centro.real,centro.imaginario);
        printf("Zc: (%f,%f) \n", zc.real,zc.imaginario);
        
        
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







