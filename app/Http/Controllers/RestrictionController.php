<?php

namespace App\Http\Controllers;
use App\Models\RestrictionMember;
use App\Models\Restriction;
use App\Models\ProjectUser;
use App\Models\PhaseActividad;
use App\Models\RestrictionPerson;
use App\Models\RestrictionFront;
use App\Models\RestrictionPhase;
use Illuminate\Http\Request;


class RestrictionController extends Controller
{
    //
    public function update_member(Request $request) {
        $restrictionid = Restriction::where('codProyecto', $request['projectId'])->get('codAnaRes');
        
        $checkuser = RestrictionMember::where('codProyecto', $request['projectId'])->delete();
        foreach($request['users'] as $user) {
            $projectuserid = ProjectUser::where('codProyecto', $request['projectId'])->where('desCorreo', $user)->get('codProyIntegrante');
            $restrictionmember = RestrictionMember::create([
                'codProyecto' => $request['projectId'],
                'codAnaRes' => $restrictionid[0]['codAnaRes'],
                'codEstado' => 1,
                'dayFechaCreacion' => $request['date'],
                'desUsuarioCreacion' => '',
                'codProyIntegrante' => $projectuserid[0]['codProyIntegrante']
            ]);
        }
        
        /* $res = RestrictionMember::where('codProyecto', $request['projectId'])->update([
            'desUsuarioCreacion' => $request['users']
        ]); */
        return $restrictionid;
    }
    public function add_front(Request $request) {
        $codAnaRes = Restriction::where('codProyecto', $request['id'])->get('codAnaRes');
        $resFront = RestrictionFront::create([
            'desAnaResFrente' => $request['name'],
            'dayFechaCreacion' => $request['date'],
            'desUsuarioCreacion' => '',
            'codProyecto' => $request['id'],
            'codAnaRes' => $codAnaRes[0]['codAnaRes'],
        ]);
        return $request;
    }

    public function add_phase(Request $request) {
        $codAnaRes = Restriction::where('codProyecto', $request['projectid'])->get('codAnaRes');
        $resFront = RestrictionPhase::create([
            'desAnaResFase' => $request['name'],
            'dayFechaCreacion' => $request['date'],
            'desUsuarioCreacion' => '',
            'codAnaResFrente' => $request['frontid'],
            'codProyecto' => $request['projectid'],
            'codAnaRes' => $codAnaRes[0]['codAnaRes'],
        ]);
        return $request;
    }

    public function add_Actividad(Request $request) { 
        $codAnaRes = Restriction::where('codProyecto', $request['projectid'])->get('codAnaRes');

        $resFront = PhaseActividad::create([ 
            'desActividad' => $request['name'],
            'desRestriccion' => "",
            'codTipoRestriccion' => 0,
            'dayFechaRequerida' => $request['date'],
            // 'idUsuarioResponsable' => 'Lizeth Marzano',
            // 'desAreaResponsable' => 'Lizeth Marzano',
            // 'codEstadoActividad' => 'En proceso',
            // 'codUsuarioSolicitante' => 'Lizeth Marzano',
            'codAnaResFase' => $request['phaseid'],
            'codAnaResFrente' => $request['frontid'],
            'codProyecto' => $request['projectid'], 
            'codAnaRes' => $codAnaRes[0]['codAnaRes'],
        ]);
        return $request; 
    }
    public function get_front(Request $request) {
        $frontdata = RestrictionFront::where('codProyecto', $request['id'])->get();
        $restriction = Restriction::where('codProyecto', $request['id'])->get();
        // $frontdata = RestrictionFront::where('codProyecto', '107')->get();
        // $restriction = Restriction::where('codProyecto', '107')->get();
        $anaresdata = [];
        
        foreach($frontdata as $eachdata) {
            $tempdata = [
                'id' => $eachdata['codAnaResFrente'],
                'name' => $eachdata['desAnaResFrente'],
                'isOpen' => false,
                'info' => [],
            ];
           
            $phasedata = RestrictionPhase::where('codAnaResFrente', $eachdata['codAnaResFrente'])->get();
            foreach($phasedata as $sevdata) {
                $temp = [
                    'id' => $sevdata['codAnaResFase'],
                    'name' => $sevdata['desAnaResFase'],
                    'notDelayed' => $restriction[0]['indNoRetrasados'],
                    'delayed' => $restriction[0]['indRetrasados'],
                    'tableData' => [],
                    'hideCols' => [],
                ];
                $Activedata = PhaseActividad::where('codAnaResFase','=',  $sevdata['codAnaResFase'])
                                    ->where('codAnaResFrente','=', $eachdata['codAnaResFrente'])
                                    ->get();
                    foreach($Activedata as $data) {
                        $temptable = [
                            'exercise' => $data['desActividad'],
                            // 'restriction' => $data['desRestriccion'],
                            'restriction' => "restriction",
                            'date_required' =>$data['dayFechaRequerida'],
                            'responsible' => $data['desActividad'],
                            'responsible_area' => "Arquitectura",
                            'applicant' => "Lizeth Marzano",
                        ];
                        array_push($temp['tableData'], $temptable);
                    }
                array_push($tempdata['info'], $temp);
            }
            array_push($anaresdata, $tempdata);
        }
        return $anaresdata;
    }

    public function delete_front(Request $request) {
        
        if ($request['phaseLen'] == 0 || $request['phaseId'] == 'all') {
            RestrictionFront::where('codAnaResFrente', $request['frontId'])->delete();
            try {
                RestrictionPhase::where('codAnaResFrente', $eachdata['frontId'])->delete();
            } catch (\Throwable $th) {}
            
        } else {
            $frontdata = RestrictionFront::where('codAnaResFrente', $request['frontId'])->get(); 
            foreach($frontdata as $eachdata) {
                RestrictionPhase::where('codAnaResFase', $request['phaseId'])->delete();
            }
        }
        return $request;
    }

    public function get_restriction_p(Request $request) { 
        $TipoRestricciones = RestrictionPerson::where('codTipoRestricciones', '>=', 0)->get();
        return $TipoRestricciones;
    }
    
    public function add_restriction(Request $request) { 
        $TipoRestricciones = RestrictionPerson::where('codTipoRestricciones', '>=', 0)->delete();
        $index = $request['index'];
        for ($i=0; $i < $index; $i++) { 
            if($request['data'][$i]['value'] == '') {
                $i -= 1;
                $index -= 1;
            }
            else {
                $resFront = RestrictionPerson::create([
                    'codTipoRestricciones' => $i,
                    'desTipoRestricciones' => $request['data'][$i]['value'],
                ]);
            } 
        } 
        $TipoRestricciones = RestrictionPerson::where('codTipoRestricciones', '>=', 0)->get();
        return $TipoRestricciones;
    }
}
