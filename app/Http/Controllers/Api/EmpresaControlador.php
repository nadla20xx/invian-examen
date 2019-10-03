<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Modelos\Empresa;

class EmpresaControlador extends Controller
{
    public function index(Request $request){
        $empresas = Empresa::select(["ruc","razon_social","nombre_comercial","direccion","gerente_general"])->get();

        return response()->json($empresas);
    }

    public function get(Request $request,$id_empresa){
        $empresa = Empresa::select(["ruc","razon_social","nombre_comercial","direccion","gerente_general"])->find($id_empresa);

        return response()->json($empresa);
    }
}
