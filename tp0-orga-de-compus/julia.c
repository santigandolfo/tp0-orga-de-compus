#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <ctype.h>


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

int esFormatoValidoResolucion(const char* dato){

	int xEncontrada=0;
	int i;
	for(i=0;i<strlen(dato);i++){
		if(!isdigit(dato[i])&&(dato[i]!='x'||xEncontrada))
			return 0;
		if(dato[i]=='x')
			xEncontrada=1;
	}
	return (dato[0]!='x'&&dato[strlen(dato)-1]!='x'&&xEncontrada);
}

int esComplejoValido(const char* dato){
	int indicePunto,indiceSigno;
	int i;
	i=0;
	if(dato[i]=='-'||dato[i]=='+')
		i++;
	while(i<strlen(dato)&&isdigit(dato[i]))

		i++;
	if(i==0||i==strlen(dato))
		return 0;
	if(dato[i]=='.'||dato[i]==','){
		indicePunto=i;		
		i++;		
		while(i<strlen(dato)&&isdigit(dato[i]))
			i++;
		if(i==indicePunto+1||i==strlen(dato))
			return 0;
	}
	if(!(dato[i]=='+'||dato[i]=='-'))
		return 0;

	indiceSigno=i;
	i++;
	while(i<strlen(dato)&&isdigit(dato[i]))
		i++;
	if(i==indiceSigno+1||i==strlen(dato))
		return 0;
	if(dato[i]=='.'||dato[i]==','){
		indicePunto=i;		
		i++;		
		while(i<strlen(dato)&&isdigit(dato[i]))
			i++;
		if(i==indicePunto+1||i==strlen(dato))
			return 0;
	}
	return (dato[strlen(dato)-1]=='i');

		

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
	
	char* datos[] = {"640x480","0+0i","0.285+0.01i", "4", "4", "-"};
     	unsigned int i, j,k;
	int estaReconocido;
	FILE * archivo;
	int indice;
	i=1;	
	while(i < argc){
		estaReconocido=0;
		
		if (!strcmp(argv[i],"-r")){
			indice=0;
			estaReconocido=1;

		}
		if (!strcmp(argv[i],"-c")){
			indice=1;
			estaReconocido=1;
		}
		if (!strcmp(argv[i],"-C")){
			indice=2;
			estaReconocido=1;
		}
		if (!strcmp(argv[i],"-w")){
			indice=3;
			estaReconocido=1;
		}
		if (!strcmp(argv[i],"-H")){
			indice=4;
			estaReconocido=1;
		}
		if (!strcmp(argv[i],"-o")){
			indice=5;
			estaReconocido=1;
		}
		if(!estaReconocido){
			printf("No se reconoce el comando %s, el manual de uso sera impreso a continuacion\n",argv[i]);
			//imprimirManual();
			exit(-1);
		}else{
			i++;
			if(argc<=i){
				printf("Error de comando");	

				printf("\n");
				exit(-1);
			}else{
			
			datos[indice]=argv[i];
			}
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
        
     

	if(!esFormatoValidoResolucion(datos[0])){
		printf("Resolucion invalida");
		printf("\n");
		exit(-1);
	}
	sscanf(datos[0],"%dx%d", &(resolucionActual.ancho), &(resolucionActual.alto));

        
	if(!esValida(resolucionActual)){
		printf("Resolucion invalida ");
		printf("\n");
		exit(-1);
	}	
        /*Obiene centro*/
	
	if(!esComplejoValido(datos[1])){
		printf("No se puede interpretar el centro");
		printf("\n");
		exit(-1);
	}


	comma_to_dot(datos[1]);
	sscanf(datos[1],"%lf%lfi",&(centro.real),&(centro.imaginario));
        /*Obtiene parametro c*/
	
	if(!esComplejoValido(datos[2])){
		printf("No se puede interpretar este paramentro c");
		printf("\n");
		exit(-1);
	}

	comma_to_dot(datos[2]);
	sscanf(datos[2],"%lf%lfi",&(zc.real),&(zc.imaginario));

 	/*archivo*/
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







