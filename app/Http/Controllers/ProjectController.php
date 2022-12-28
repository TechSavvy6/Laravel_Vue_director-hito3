<?php

namespace App\Http\Controllers;

use App\Models\Project;
use App\Models\ProjectUser;
use App\Models\ProjectReport;
use App\Models\ProjectUtilReport;
use App\Models\Restriction;
use App\Models\RestrictionMember;
use App\Models\User;
use Illuminate\Testing\Fluent\Concerns\Has;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;

class ProjectController extends Controller
{
    //
    public function create_project (Request $request) {
        
        $data = $request->validate([
            'projectName' => 'required|string',
            'business' => 'required|string',
            'projectType' => 'required|string',
            'district' => 'required|string',
            'country' => 'required|string',
        ]);

        $project = Project::create([
            'desNombreProyecto' => $request['projectName'],
            'codEstado' => 1,
            'desEmpresa' => $request['business'],
            'numPlazo' => intval($request['term']),
            'id' => $request['id'] | 0,
            'numAreaTechado' => intval($request['coveredArea']),
            'desTipoProyecto' => $request['projectType'],
            'codUbigeo' => $request['district'],
            'dayFechaInicio' => '2022-11-20 10:23:25',
            'numMontoReferencial' => intval($request['referenceAmount']),
            'numAreaTechada' => intval($request['area']),
            'numAreaConstruida' => intval($request['builtArea']),
            'desPais' => $request['country'],
            'desDireccion' => $request['address'],
            'dayFechaCreacion' => $request['date'],
            'desUsuarioCreacion' => $request['usersum']
        ]);
        $codPro = Project::where('dayFechaCreacion', $request['date'])->get('codProyecto');
        
        foreach($request['userInvData'] as $user) {
            $str = strval($user['userEmail']);
            $usercreate = ProjectUser::create([
                'codProyecto' => $codPro[0]['codProyecto'],
                'id' => $request['id'],
                'codEstadoInvitacion' => 1,
                'codRolIntegrante' => 1,
                'dayFechaInvitacion' => $request['date'],
                'desArea' => $user['userArea'],
                'desCorreo' => $str,
            ]);
        }
        $useremail = User::where('id', $request['id'])->get('email');
        $restrictioncreate = Restriction::create([
            'codProyecto' => $codPro[0]['codProyecto'],
            'codEstado' => 1,
            'dayFechaCreacion' => $request['date'],
            'desUsuarioCreacion' => $useremail[0]['email'],
            'indNoRetrasados' => 55,
            'indRetrasados' => 40,
        ]);
        /* $restrictionid = Restriction::where('codProyecto', $codPro[0]['codProyecto'])->get('codAnaRes');
        $restrictionmember = RestrictionMember::create([
            'codProyecto' => $codPro[0]['codProyecto'],
            'codAnaRes' => $restrictionid[0]['codAnaRes'],
            'codEstado' => 1,
            'dayFechaCreacion' => $request['date'],
            'desUsuarioCreacion' => '',
        ]); */
        foreach($request['reports'] as $report) {
            $utilreportcreate = ProjectUtilReport::create([
                'desUtilReportes' => $report['reportSchedule']
            ]);
            $codUtilPro = ProjectUtilReport::get('codUtilReportes');
            $cod = $codUtilPro[sizeof($codUtilPro)-1]['codUtilReportes'];
            if($report['massiveStatus'] === 1) {
                $reportcreate = ProjectReport::create([
                    'codUtilReportes' => $cod,
                    'codProyecto' => $codPro[0]['codProyecto'],
                    'flagReporteMasivo' => $report['massiveStatus'],
                    'codTipoFrecuencia' => $request['typeFrequency'],
                    'dayFechaCreacion' => $request['date'],
                    'desUsuarioCreacion' => '',
                    'desCorreoEnvios' => '',
                    'codfrecuenciaenvioreporte' => $report['frequency']
                ]);
            }
            else {
                foreach($report['frequencies'] as $frequency) {
                    $reportcreate = ProjectReport::create([
                        'codUtilReportes' => $cod,
                        'codProyecto' => $codPro[0]['codProyecto'],
                        'flagReporteMasivo' => $report['massiveStatus'],
                        'codTipoFrecuencia' => $request['typeFrequency'],
                        'dayFechaCreacion' => $request['date'],
                        'desUsuarioCreacion' => '',
                        'desCorreoEnvios' => $frequency['user'],
                        'codfrecuenciaenvioreporte' => $frequency['freq']
                    ]);
                }
            }
        }

        return $codPro;
    }

    public function get_project (Request $request) {
        $project = Project::where('id', $request['id'])->get();

        return $project;
    }
    public function edit_project (Request $request) {
        $update = Project::where('codProyecto', $request['projectId'])->update([
            'desNombreProyecto' => $request['projectName'],
            'codEstado' => 1,
            'desEmpresa' => $request['business'],
            'numPlazo' => intval($request['term']),
            'numAreaTechado' => intval($request['coveredArea']),
            'desTipoProyecto' => $request['projectType'],
            'codUbigeo' => $request['district'],
            'dayFechaInicio' => '2022-11-20 10:23:25',
            'numMontoReferencial' => intval($request['referenceAmount']),
            'numAreaTechada' => intval($request['area']),
            'numAreaConstruida' => intval($request['builtArea']),
            'desPais' => $request['country'],
            'desDireccion' => $request['address'],
            'dayFechaCreacion' => $request['date'],
            'desUsuarioCreacion' => $request['usersum']
        ]);
        return $request['projectId'];
    }
    public function get_projectreport (Request $request) {
        $project = ProjectReport::where('codProyecto', $request['projectId'])->get();
        return $project;
    }
    public function get_projectuser (Request $request) {
        $projectuser = ProjectUser::where('codProyecto', $request['projectId'])->get();
        return $projectuser;
    }
}
