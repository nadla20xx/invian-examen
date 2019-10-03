<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Modelos\Categoria;
use App\Modelos\Usuario;


class CategoriasControlador extends Controller
{
    public function index(Request $request,$id_empresa){
        $categorias = Categoria::select(["nombre_categoria"])->where("id_empresa",$id_empresa)->get();

        return response()->json($categorias);
    }

    public function get(Request $request,$id_empresa,$id_categoria){

        $categoria = Categoria::select(["nombre_categoria"])->where("id_empresa",$id_empresa)->where("id_categoria",$id_categoria)->first();

        return response()->json($categoria);
    }

    public function CategoriasUsuario(Request $request,$id_empresa,$id_usuario){

        $usuario = Usuario::with(["Categorias"=>function($query){ $query->select(["nombre_categoria"]); }])->where("id_empresa",$id_empresa)->where("id_usuario",$id_usuario)->first();
        $categorias = collect($usuario->Categorias->toArray())->except(["pivot"]);
        return response()->json($categorias);
    }
}
