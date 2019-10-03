<?php

namespace App\Modelos;

use Illuminate\Database\Eloquent\Model;

class Categoria extends Model
{
    protected $table = "categorias";
    protected $primaryKey = "id_categoria";

    public $timestamps = false;

    public function Empresa(){
        return $this->hasOne(Empresa::class,"id_empresa","id_empresa");
    }

    public function Usuarios(){
        return $this->belongsToMany(Usuarios::class, 'usuarios_categorias', 'id_categoria', 'id_usuario');
    }
}
