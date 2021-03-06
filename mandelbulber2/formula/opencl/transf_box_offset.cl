/**
 * Mandelbulber v2, a 3D fractal generator  _%}}i*<.        ____                _______
 * Copyright (C) 2017 Mandelbulber Team   _>]|=||i=i<,     / __ \___  ___ ___  / ___/ /
 *                                        \><||i|=>>%)    / /_/ / _ \/ -_) _ \/ /__/ /__
 * This file is part of Mandelbulber.     )<=i=]=|=i<>    \____/ .__/\__/_//_/\___/____/
 * The project is licensed under GPLv3,   -<>>=|><|||`        /_/
 * see also COPYING file in this folder.    ~+{i%+++
 *
 * Box Offset, set different offset for each axis, added symmetrically about the origin
 * will cause cuts along axis
 */

/* ### This file has been autogenerated. Remove this line, to prevent override. ### */

#ifndef DOUBLE_PRECISION
float4 TransfBoxOffsetIteration(float4 z, __constant sFractalCl *fractal, sExtendedAuxCl *aux)
{
	float4 temp = z;
	z.x = copysign(fractal->transformCommon.additionConstant000.x, z.x) + z.x;
	z.y = copysign(fractal->transformCommon.additionConstant000.y, z.y) + z.y;
	z.z = copysign(fractal->transformCommon.additionConstant000.z, z.z) + z.z;

	if (fractal->transformCommon.functionEnabledFalse)
	{
		float tempL = length(temp);
		// if (tempL < 1e-21f) tempL = 1e-21f;
		float avgScale = native_divide(length(z), tempL);
		aux->r_dz *= avgScale;
		aux->DE = mad(aux->DE, avgScale, 1.0f);
	}
	return z;
}
#else
double4 TransfBoxOffsetIteration(double4 z, __constant sFractalCl *fractal, sExtendedAuxCl *aux)
{
	double4 temp = z;
	z.x = copysign(fractal->transformCommon.additionConstant000.x, z.x) + z.x;
	z.y = copysign(fractal->transformCommon.additionConstant000.y, z.y) + z.y;
	z.z = copysign(fractal->transformCommon.additionConstant000.z, z.z) + z.z;

	if (fractal->transformCommon.functionEnabledFalse)
	{
		double tempL = length(temp);
		// if (tempL < 1e-21) tempL = 1e-21;
		double avgScale = native_divide(length(z), tempL);
		aux->r_dz *= avgScale;
		aux->DE = aux->DE * avgScale + 1.0;
	}
	return z;
}
#endif
