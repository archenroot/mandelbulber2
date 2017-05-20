/**
 * Mandelbulber v2, a 3D fractal generator  _%}}i*<.        ____                _______
 * Copyright (C) 2017 Mandelbulber Team   _>]|=||i=i<,     / __ \___  ___ ___  / ___/ /
 *                                        \><||i|=>>%)    / /_/ / _ \/ -_) _ \/ /__/ /__
 * This file is part of Mandelbulber.     )<=i=]=|=i<>    \____/ .__/\__/_//_/\___/____/
 * The project is licensed under GPLv3,   -<>>=|><|||`        /_/
 * see also COPYING file in this folder.    ~+{i%+++
 *
 * CollatzIteration formula
 * @reference https://mathr.co.uk/blog/2016-04-10_collatz_fractal.html
 *            https://en.wikipedia.org/wiki/Collatz_conjecture#Iterating_on_real_or_complex_numbers
 */

/* ### This file has been autogenerated. Remove this line, to prevent override. ### */

#ifndef DOUBLE_PRECISION
inline void CollatzIteration(float4 *z, sExtendedAuxCl *aux)
{

	float4 xV = (float4){1.0f, 1.0f, 1.0f, 0.0f};
	float4 temp = (float4){xV + 2.0f * *z};
	temp *= RotateAroundVectorByAngle4(*z, xV.xyz, M_PI);
	*z = xV + mad(4.0f, *z, -temp);
	*z /= 4.0f;
	aux->DE = mad(aux->DE, 4.0f, 1.0f);
	aux->r_dz *= 4.0f;
}
#else
inline void CollatzIteration(double4 *z, sExtendedAuxCl *aux)
{

	double4 xV = (double4){1.0, 1.0, 1.0, 0.0};
	double4 temp = (double4){xV + 2.0 * *z};
	temp *= RotateAroundVectorByAngle4(*z, xV.xyz, M_PI);
	*z = xV + 4.0 * *z - temp;
	*z /= 4.0;
	aux->DE = aux->DE * 4.0 + 1.0;
	aux->r_dz *= 4.0;
}
#endif