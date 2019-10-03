<?php

namespace App\Modelos;

use Illuminate\Database\Eloquent\Model;

class Empresa extends Model
{
    protected $table = "empresas";
    protected $primaryKey = "id_empresa";

    public function Categorias(){
        return $this->hasMany(Categorias::class,"id_empresa","id_empresa");
    }

    public function Usuarios(){
        return $this->hasMany(Usuarios::class,"id_empresa","id_empresa");
    }
}
