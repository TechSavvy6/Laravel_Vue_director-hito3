<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\ProjectController;
use App\Http\Controllers\RestrictionController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

Route::middleware('auth:sanctum')->group(function () {
    Route::get('/user', function (Request $request) {
        return $request->user();
    });
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::resource('/survey', \App\Http\Controllers\SurveyController::class);

    Route::get('/dashboard', [\App\Http\Controllers\DashboardController::class, 'index']);
    Route::post('/info_person', [AuthController::class, 'info_person']);

});

Route::get('/survey-by-slug/{survey:slug}', [\App\Http\Controllers\SurveyController::class, 'showForGuest']);
Route::post('/survey/{survey}/answer', [\App\Http\Controllers\SurveyController::class, 'storeAnswer']);

Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);
Route::post('/create_project', [ProjectController::class, 'create_project']);
Route::post('/get_project', [ProjectController::class, 'get_project']);
Route::post('/edit_project', [ProjectController::class, 'edit_project']);
Route::post('/get_projectreport', [ProjectController::class, 'get_projectreport']);
Route::post('/get_projectuser', [ProjectController::class, 'get_projectuser']);
Route::post('/update_member', [RestrictionController::class, 'update_member']);
Route::post('/add_front', [RestrictionController::class, 'add_front']);
Route::post('/add_phase', [RestrictionController::class, 'add_phase']);
Route::post('/add_Actividad', [RestrictionController::class, 'add_Actividad']);
Route::post('/get_front', [RestrictionController::class, 'get_front']);
Route::get('/get_restriction_p', [RestrictionController::class, 'get_restriction_p']);
Route::post('/add_restriction',[RestrictionController::class, 'add_restriction']);
Route::post('/delete_front',[RestrictionController::class, 'delete_front']);


Route::get('/get_cargos', [\App\Http\Controllers\UtilsController::class, 'get_cargos']);
