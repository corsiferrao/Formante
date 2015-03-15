/*
 * fir.c
 *
 *  Created on: Jan 9, 2013
 *      Author: corsi
 */

#include "fir.h"


/**
 *  Global variables
 */

 volatile struct fir_data_old firData;
 struct fir_data_ret firDataRet;

/**
 * Local variable
 */

extern const int BL = 11;

 const f32 B[] = {
		 0,   -0.0104,    0.0205,   0.0575,   -0.2707,    0.4053,   -0.2707,   0.0575,
		 0.0205,   -0.0104,    0
 };

 // for loop
 u8 i = 0;

 void fir(u8 x_new)
{
	 // Variáveis tmps para calculo do filtro
	 volatile f32 tmp_add_x = 0.0;

	// Rotaciona vetor para esquerda
	for(i=0; i < (BL -1) ; i++)
		firData.x[i] = firData.x[i+1];

	// Atribui novo valor ao vetor
	firData.x[BL -1] = (s8) x_new;


	// Calcula filtro FIR
	for(i=0; i< BL; i++)
		tmp_add_x = tmp_add_x + ((f32) firData.x[i]) * B[BL -1 - i];

	// Retorna valor para variável globlas
	firDataRet.x =  tmp_add_x;
}
