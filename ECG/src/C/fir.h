/*
 * fir.h
 *
 *  Created on: Jan 9, 2013
 *      Author: corsi
 */

#ifndef FIR_H_
#define FIR_H_

/*
% All frequency values are in Hz.
Fs = 1;  % Sampling Frequency

N     = 10;       % Order
Fc    = 0.3;      % Cutoff Frequency
flag  = 'scale';  % Sampling Flag
Alpha = 2.5;      % Window Parameter

% Create the window vector for the design algorithm.
win = gausswin(N+1, Alpha);

% Calculate the coefficients using the FIR1 function.
b  = fir1(N, Fc/(Fs/2), 'high', win, flag);
Hd = dfilt.dffir(b);
 */

#include "bluerobin/bm.h"

struct fir_data_old
{
	s8 x[51];
};
extern volatile struct fir_data_old firData;

struct fir_data_ret
{
	f32 x;
};
extern struct fir_data_ret firDataRet;

void fir(u8 x_new, u8 y_new, u8 z_new);

#endif /* FIR_H_ */
