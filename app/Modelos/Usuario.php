<?php

namespace App\Modelos;

use Illuminate\Database\Eloquent\Model;

class Usuario extends Model
{
    protected $table = "usuarios";
    protected $primaryKey = "id_usuario";

    public function Empresa(){
        return $this->hasOne(Empresa::class,"id_empresa","id_empresa");
    }

    public function Categorias(){
        return $this->belongsToMany(Categoria::class, 'usuarios_categorias', 'id_usuario', 'id_categoria');
    }
}
