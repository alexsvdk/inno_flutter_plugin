package com.example.inno_plugin

import kotlin.math.pow


class PigeonInnoPluginImpl : Pigeon.PigeonInnoPlugin {

    override fun solveSqueareEquation(
        params: Pigeon.SquareEquationParams,
        result: Pigeon.Result<Pigeon.SquareEquationResult>?
    ) {
        val d = params.b.pow(2) - (4 * params.a * params.c)
        val res = Pigeon.SquareEquationResult()
        if (d >= 0) {
            res.x1 = (-params.b + d) / 2 * params.a
            res.x2 = (-params.b - d) / 2 * params.a
        }
        result?.success(res)
    }

}