<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::prefix('Empresas')->group(function () {

    Route::get('/', 'Api\EmpresaControlador@index')->name('recuperar.empresas');
    Route::get('/{id_empresa}', 'Api\EmpresaControlador@get')->name('recuperar.empresa')->where(['id_empresa' => '[0-9]+']);

    Route::prefix('{id_empresa}/Usuarios')->group(function () {

        Route::get('/', 'Api\UsuariosControlador@index')->name('recuperar.empresas.usuarios')->where(['id_empresa' => '[0-9]+']);
        Route::get('/{id_usuario}', 'Api\UsuariosControlador@get')->name('recuperar.empresas.usuario')->where(['id_empresa' => '[0-9]+','id_usuario' => '[0-9]+']);

        Route::prefix('{id_usuario}/Categorias')->group(function () {

            Route::get('', 'Api\CategoriasControlador@CategoriasUsuario')->name('recuperar.empresas.usuarios.categorias')->where(['id_empresa' => '[0-9]+','id_usuario' => '[0-9]+']);

        });
    });

    Route::prefix('{id_empresa}/Categorias')->group(function () {

        Route::get('/', 'Api\CategoriasControlador@index')->name('recuperar.empresas.categorias')->where(['id_empresa' => '[0-9]+']);
        Route::get('/{id_categoria}', 'Api\CategoriasControlador@get')->name('recuperar.empresas.categoria')->where(['id_empresa' => '[0-9]+','id_categoria' => '[0-9]+']);

    });
});

