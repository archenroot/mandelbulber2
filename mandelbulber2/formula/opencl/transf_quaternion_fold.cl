/**
 * Mandelbulber v2, a 3D fractal generator  _%}}i*<.        ____                _______
 * Copyright (C) 2017 Mandelbulber Team   _>]|=||i=i<,     / __ \___  ___ ___  / ___/ /
 *                                        \><||i|=>>%)    / /_/ / _ \/ -_) _ \/ /__/ /__
 * This file is part of Mandelbulber.     )<=i=]=|=i<>    \____/ .__/\__/_//_/\___/____/
 * The project is licensed under GPLv3,   -<>>=|><|||`        /_/
 * see also COPYING file in this folder.    ~+{i%+++
 *
 * Quaternion Fold Transform
 * @reference http://www.fractalforums.com/3d-fractal-generation/true-3d-mandlebrot-type-fractal/
 */

/* ### This file has been autogenerated. Remove this line, to prevent override. ### */

#ifndef DOUBLE_PRECISION
float4 TransfQuaternionFoldIteration(float4 z, __constant sFractalCl *fractal, sExtendedAuxCl *aux)
{
	float4 c = aux->const_c;

	z = (float4){z.x * z.x - z.y * z.y - z.z * z.z, z.x * z.y, z.x * z.z, z.w};
	if (fractal->transformCommon.functionEnabledFalse)
	{

		aux->r_dz = aux->r_dz * 2.0f * aux->r;
		float tempL = length(z);
		z *= fractal->transformCommon.constantMultiplier122;
		// if (tempL < 1e-21f) tempL = 1e-21f;
		float4 tempAvgScale = (float4){z.x, native_divide(z.y, 2.0f), native_divide(z.z, 2.0f), z.w};
		float avgScale = native_divide(length(tempAvgScale), tempL);
		float tempAux = aux->r_dz * avgScale;
		aux->r_dz = mad(fractal->transformCommon.scaleA1, (tempAux - aux->r_dz), aux->r_dz);
		z += fractal->transformCommon.additionConstant000;
	}
	if (fractal->transformCommon.addCpixelEnabledFalse)
	{
		float4 tempC = c;
		if (fractal->transformCommon.alternateEnabledFalse) // alternate
		{
			tempC = aux->c;
			switch (fractal->mandelbulbMulti.orderOfXYZC)
			{
				case multi_OrderOfXYZCl_xyz:
				default: tempC = (float4){tempC.x, tempC.y, tempC.z, tempC.w}; break;
				case multi_OrderOfXYZCl_xzy: tempC = (float4){tempC.x, tempC.z, tempC.y, tempC.w}; break;
				case multi_OrderOfXYZCl_yxz: tempC = (float4){tempC.y, tempC.x, tempC.z, tempC.w}; break;
				case multi_OrderOfXYZCl_yzx: tempC = (float4){tempC.y, tempC.z, tempC.x, tempC.w}; break;
				case multi_OrderOfXYZCl_zxy: tempC = (float4){tempC.z, tempC.x, tempC.y, tempC.w}; break;
				case multi_OrderOfXYZCl_zyx: tempC = (float4){tempC.z, tempC.y, tempC.x, tempC.w}; break;
			}
			aux->c = tempC;
		}
		else
		{
			switch (fractal->mandelbulbMulti.orderOfXYZC)
			{
				case multi_OrderOfXYZCl_xyz:
				default: tempC = (float4){c.x, c.y, c.z, c.w}; break;
				case multi_OrderOfXYZCl_xzy: tempC = (float4){c.x, c.z, c.y, c.w}; break;
				case multi_OrderOfXYZCl_yxz: tempC = (float4){c.y, c.x, c.z, c.w}; break;
				case multi_OrderOfXYZCl_yzx: tempC = (float4){c.y, c.z, c.x, c.w}; break;
				case multi_OrderOfXYZCl_zxy: tempC = (float4){c.z, c.x, c.y, c.w}; break;
				case multi_OrderOfXYZCl_zyx: tempC = (float4){c.z, c.y, c.x, c.w}; break;
			}
		}
		z += tempC * fractal->transformCommon.constantMultiplierC111;
	}
	return z;
}
#else
double4 TransfQuaternionFoldIteration(
	double4 z, __constant sFractalCl *fractal, sExtendedAuxCl *aux)
{
	double4 c = aux->const_c;

	z = (double4){z.x * z.x - z.y * z.y - z.z * z.z, z.x * z.y, z.x * z.z, z.w};
	if (fractal->transformCommon.functionEnabledFalse)
	{

		aux->r_dz = aux->r_dz * 2.0 * aux->r;
		double tempL = length(z);
		z *= fractal->transformCommon.constantMultiplier122;
		// if (tempL < 1e-21) tempL = 1e-21;
		double4 tempAvgScale = (double4){z.x, z.y / 2.0, z.z / 2.0, z.w};
		double avgScale = native_divide(length(tempAvgScale), tempL);
		double tempAux = aux->r_dz * avgScale;
		aux->r_dz = mad(fractal->transformCommon.scaleA1, (tempAux - aux->r_dz), aux->r_dz);
		z += fractal->transformCommon.additionConstant000;
	}
	if (fractal->transformCommon.addCpixelEnabledFalse)
	{
		double4 tempC = c;
		if (fractal->transformCommon.alternateEnabledFalse) // alternate
		{
			tempC = aux->c;
			switch (fractal->mandelbulbMulti.orderOfXYZC)
			{
				case multi_OrderOfXYZCl_xyz:
				default: tempC = (double4){tempC.x, tempC.y, tempC.z, tempC.w}; break;
				case multi_OrderOfXYZCl_xzy: tempC = (double4){tempC.x, tempC.z, tempC.y, tempC.w}; break;
				case multi_OrderOfXYZCl_yxz: tempC = (double4){tempC.y, tempC.x, tempC.z, tempC.w}; break;
				case multi_OrderOfXYZCl_yzx: tempC = (double4){tempC.y, tempC.z, tempC.x, tempC.w}; break;
				case multi_OrderOfXYZCl_zxy: tempC = (double4){tempC.z, tempC.x, tempC.y, tempC.w}; break;
				case multi_OrderOfXYZCl_zyx: tempC = (double4){tempC.z, tempC.y, tempC.x, tempC.w}; break;
			}
			aux->c = tempC;
		}
		else
		{
			switch (fractal->mandelbulbMulti.orderOfXYZC)
			{
				case multi_OrderOfXYZCl_xyz:
				default: tempC = (double4){c.x, c.y, c.z, c.w}; break;
				case multi_OrderOfXYZCl_xzy: tempC = (double4){c.x, c.z, c.y, c.w}; break;
				case multi_OrderOfXYZCl_yxz: tempC = (double4){c.y, c.x, c.z, c.w}; break;
				case multi_OrderOfXYZCl_yzx: tempC = (double4){c.y, c.z, c.x, c.w}; break;
				case multi_OrderOfXYZCl_zxy: tempC = (double4){c.z, c.x, c.y, c.w}; break;
				case multi_OrderOfXYZCl_zyx: tempC = (double4){c.z, c.y, c.x, c.w}; break;
			}
		}
		z += tempC * fractal->transformCommon.constantMultiplierC111;
	}
	return z;
}
#endif
