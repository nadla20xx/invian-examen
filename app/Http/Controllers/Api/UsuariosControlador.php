<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Modelos\Usuario;

class UsuariosControlador extends Controller
{
    public function index(Request $request,$id_empresa){
        $usuarios = Usuario::select(["nombres","apellido_paterno","apellido_materno","tipo_documento_identidad","numero_documento_identidad","fecha_nacimiento","direccion","correo","sexo"])->where("id_empresa",$id_empresa)->get();

        return response()->json($usuarios);
    }

    public function get(Request $request,$id_empresa,$id_usuario){

        $usuario = Usuario::select(["nombres","apellido_paterno","apellido_materno","tipo_documento_identidad","numero_documento_identidad","fecha_nacimiento","direccion","correo","sexo"])->where("id_empresa",$id_empresa)->where("id_usuario",$id_usuario)->first();

        return response()->json($usuario);
    }
}
