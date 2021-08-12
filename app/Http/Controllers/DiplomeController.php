<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Demande;
use App\Models\Diplome;
use Illuminate\Http\Request;
use App\Mail\NotificationDiplome;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;

class DiplomeController extends Controller
{
    /**
     * Display a listing of diplomes.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return response()->json([
            'diplomes' => Diplome::with('demande','etudiant')->get(),
        ]); 
    }

    /**
     * creer un diplome avec date de cretation par GuichetDroitArabe,
     *           GuichetDroitFrancais ou GuichetEconomie
     *
     * @param  int  $demande_id
     * @return \Illuminate\Http\Response
     */
    public function store($demande_id)
    {
        $demande = Demande::with('etudiant')->where('traite','=',0)->find($demande_id);

        // store diplome according to a role
        $diplome = null;
        if ($demande)
        {
            if(Auth::user()->hasRole('guichet_droit_arabe')) {
                if ($demande->etudiant->filiere == 'القانون باللغة العربية')
                {
                    $demande->traite = 1;
                    $demande->save();
                    $diplome = Diplome::create(array(
                        'demande_id' => $demande_id,
                        'etudiant_cin' => $demande->etudiant_cin,
                        'statut_id' => 1,
                        'date_creationDossier_envoiAuServiceDiplome' => Carbon::today()->format('Y-m-d'),
                    ));
                }
            } else if(Auth::user()->hasRole('guichet_droit_francais')) {
                if ($demande->etudiant->filiere == 'Droit en français')
                {
                    $demande->traite = 1;
                    $demande->save();
                    $diplome = Diplome::create(array(
                        'demande_id' => $demande_id,
                        'etudiant_cin' => $demande->etudiant_cin,
                        'statut_id' => 1,
                        'date_creationDossier_envoiAuServiceDiplome' => Carbon::today()->format('Y-m-d'),
                    ));
                }
            } else if(Auth::user()->hasRole('guichet_economie')) {
                if ($demande->etudiant->filiere == 'Sciences Economiques et Gestion')
                {
                    $demande->traite = 1;
                    $demande->save();
                    $diplome = Diplome::create(array(
                        'demande_id' => $demande_id,
                        'etudiant_cin' => $demande->etudiant_cin,
                        'statut_id' => 1,
                        'date_creationDossier_envoiAuServiceDiplome' => Carbon::today()->format('Y-m-d'),
                    ));
                }
            }
            else{
                
            }
        }
        
        return response()->json([
            'diplomeCree' => $diplome,
        ]);
    }

    /**
     * Display the specified diplome.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $diplome = Diplome::with('demande','etudiant')->find($id);
        $res = null;

        // show diplome for each role
        if ($diplome)
        {
            if(Auth::user()->hasRole('admin')) {
                $res = $diplome;
            } elseif(Auth::user()->hasRole('guichet_droit_arabe')) {
                if($diplome->statut_id == 1 and
                    $diplome->etudiant->filiere == 'القانون باللغة العربية') 
                {
                    $res = $diplome;
                }  
            } elseif(Auth::user()->hasRole('guichet_droit_francais')) {
                if($diplome->statut_id == 1 and
                    $diplome->etudiant->filiere == 'Droit en français') 
                {
                    $res = $diplome;
                }  
            } elseif(Auth::user()->hasRole('guichet_economie')) {
                if($diplome->statut_id == 1 and $diplome->etudiant->filiere == 'Sciences Economiques et Gestion') 
                {
                    $res = $diplome;
                }  
            } elseif(Auth::user()->hasRole('service_diplomes')) {
                if($diplome->statut_id == 1 or $diplome->statut_id == 2 or $diplome->statut_id == 3 or 
                    $diplome->statut_id == 4 or $diplome->statut_id == 5) 
                {
                    $res = $diplome;
                }    
            } elseif(Auth::user()->hasRole('decanat')) {
                if($diplome->statut_id == 3 or $diplome->statut_id == 4) 
                {
                    $res = $diplome;
                }    
            } elseif(Auth::user()->hasRole('bureau_ordre')) {
                if($diplome->statut_id == 5 or $diplome->statut_id == 6) 
                {
                    $res = $diplome;
                }  
            } elseif(Auth::user()->hasRole('guichet_retrait')) {
                if($diplome->statut_id == 6 or $diplome->statut_id == 7) 
                {
                    $res = $diplome;
                }
            }
        }
        
        return response()->json([
            'diplome' => $res
         ]);
    }

    /**
     * Update DateReedition du diplome et type d'erreur par service de diplomes.
     *
     * @param  \App\Models\Diplome $diplome
     * @return \Illuminate\Http\Response
     */
    public function updateDateReedition(Request $request, Diplome $diplome)
    {
        $request->validate([
            'type_erreur' => 'required|string'
        ]);

        // test if the specified date is null 
        if( ! $diplome->date_reedition )
        {
            $diplome->update([
                'statut_id' => 2,
                'type_erreur' => $request->type_erreur,
                'date_reedition' => Carbon::today()->format('Y-m-d'),
            ]);
        }
        return response()->json([
            'diplome'=> $diplome,
        ]);
    }

    /**
     * Update DateImpression du diplome par service de diplomes.
     *
     * @param  \App\Models\Diplome $diplome
     * @return \Illuminate\Http\Response
     */
    public function updateDateImpression(Diplome $diplome)
    {
       // test if the specified date is null 
       if( ! $diplome->date_impression_envoiAuDecanat)
        {
            $diplome->update([
                'statut_id' => 3,
                'date_impression_envoiAuDecanat' => Carbon::today()->format('Y-m-d'),
            ]);
        }
        return response()->json([
            'diplome'=> $diplome
        ]);
    }

    /**
     * Update DateSignature du diplome par decanat.
     *
     * @param  \App\Models\Diplome $diplome
     * @return \Illuminate\Http\Response
     */
    public function updateDateSignature(Diplome $diplome)
    {
        // test if the specified date is null and the previous date not null
        if( ! $diplome->date_singature_renvoiAuServiceDiplome 
            and $diplome->date_impression_envoiAuDecanat)
        {
            $diplome->update([
                'statut_id' => 4,
                'date_singature_renvoiAuServiceDiplome' => Carbon::today()->format('Y-m-d'),
            ]);
        }
        return response()->json([
            'diplome'=> $diplome,
        ]);
    }

     /**
     * Update DateEnvoi du diplome a la presidence par service de diplomes.
     *
     * @param  \App\Models\Diplome $diplome
     * @return \Illuminate\Http\Response
     */
    public function updateDateEnvoiApresidence(Diplome $diplome)
    {
        // test if the specified date is null and the previous dates not null
        if( ! $diplome->date_generationBorodeaux_envoiApresidence 
            and $diplome->date_singature_renvoiAuServiceDiplome 
            and $diplome->date_impression_envoiAuDecanat)
        {
            $diplome->update([
                'statut_id' => 5,
                'date_generationBorodeaux_envoiApresidence' => Carbon::today()->format('Y-m-d'),
            ]);
        }
        return response()->json([
            'diplome'=> $diplome,
        ]);
    }

     /**
     * Update DateReception du diplome par bureau d'ordre.
     *
     * @param  \App\Models\Diplome $diplome
     * @return \Illuminate\Http\Response
     */
    public function updateDateReceptionParBureauOrdre(Diplome $diplome)
    {
        // test if the specified date is null and the previous dates not null
        if( ! $diplome->date_receptionParBureauOrdre_envoiAuGuichetRetrait 
            and $diplome->date_generationBorodeaux_envoiApresidence 
            and $diplome->date_singature_renvoiAuServiceDiplome 
            and $diplome->date_impression_envoiAuDecanat)
        {
            $diplome->update([
                'statut_id' => 6,
                'date_receptionParBureauOrdre_envoiAuGuichetRetrait' => Carbon::today()->format('Y-m-d'),
            ]);
        }
        return response()->json([
            'diplome'=> $diplome,
        ]);
    }

     /**
     * Update DateRetrait du diplome et envoi du dossier au arhives par guichet de retrait.
     *
     * @param  \App\Models\Diplome $diplome
     * @return \Illuminate\Http\Response
     */
    public function updateDateRetraitDiplomeArchiveDossier(Diplome $diplome)
    {
        // test if the specified date is null and the previous dates not null
        if( ! $diplome->date_retraitDiplome_archiveDossier 
            and $diplome->date_notificationEtudiant
            and $diplome->date_receptionParBureauOrdre_envoiAuGuichetRetrait 
            and $diplome->date_generationBorodeaux_envoiApresidence 
            and $diplome->date_singature_renvoiAuServiceDiplome 
            and $diplome->date_impression_envoiAuDecanat)
        {
            $diplome->update([
                'statut_id' => 7,
                'date_retraitDiplome_archiveDossier' => Carbon::today()->format('Y-m-d'),
            ]);
        }
        return response()->json([
            'diplome'=> $diplome,
        ]);
    }
    
    /**
     * Filter diplomes either by statut, type or filiere
     *
     * @param  string $statut
     * @param  string $type
     * @param  string $filiere
     * @return \Illuminate\Http\Response
     */
    public function filter($statut, $type, $filiere)
    {
        if ($statut and $type and $filiere)
        {
            $diplomes =  DB::table('diplomes as dip')
                    ->join('etudiants as e', 'dip.etudiant_cin','=','e.cin')
                    ->join('demandes as d', 'dip.demande_id','=','d.id')
                    ->where('dip.statut_id',$statut)
                    ->where('d.type_demande', $type)
                    ->where('e.filiere',$filiere)
                    ->get();
        }
        if ($statut and $type and !$filiere)
        {
            $diplomes =  DB::table('diplomes as dip')
                    ->join('etudiants as e', 'dip.etudiant_cin','=','e.cin')
                    ->join('demandes as d', 'dip.demande_id','=','d.id')
                    ->where('dip.statut_id',$statut)
                    ->where('d.type_demande', $type)
                    ->get();
        }
        if ($statut and $filiere and !$type)
        {
            $diplomes =  DB::table('diplomes as dip')
                    ->join('etudiants as e', 'dip.etudiant_cin','=','e.cin')
                    ->join('demandes as d', 'dip.demande_id','=','d.id')
                    ->where('dip.statut_id',$statut)
                    ->where('e.filiere',$filiere)
                    ->get();
        }
        if ($type and $filiere and !$statut)
        {
            $diplomes =  DB::table('diplomes as dip')
                    ->join('etudiants as e', 'dip.etudiant_cin','=','e.cin')
                    ->join('demandes as d', 'dip.demande_id','=','d.id')
                    ->where('d.type_demande', $type)
                    ->where('e.filiere',$filiere)
                    ->get();
        }
        if ($statut and !$type and !$filiere)
        {
            $diplomes =  DB::table('diplomes as dip')
                    ->join('etudiants as e', 'dip.etudiant_cin','=','e.cin')
                    ->join('demandes as d', 'dip.demande_id','=','d.id')
                    ->where('dip.statut_id',$statut)
                    ->get();
        }
        if ($type and !$statut and !$filiere)
        {
            $diplomes =  DB::table('diplomes as dip')
                    ->join('etudiants as e', 'dip.etudiant_cin','=','e.cin')
                    ->join('demandes as d', 'dip.demande_id','=','d.id')
                    ->where('d.type_demande', $type)
                    ->get();
        }
        if ($filiere and !$statut and !$type)
        {
            $diplomes =  DB::table('diplomes as dip')
                    ->join('etudiants as e', 'dip.etudiant_cin','=','e.cin')
                    ->join('demandes as d', 'dip.demande_id','=','d.id')
                    ->where('e.filiere',$filiere)
                    ->get();
        }

        // show results for each role
        $res = array();
        foreach ($diplomes as $diplome)
        {
            if(Auth::user()->hasRole('admin')) {
                $res[] = $diplome;
            } elseif(Auth::user()->hasRole('guichet_droit_arabe')) {
                if($diplome->statut_id == 1 and
                    $diplome->filiere == 'القانون باللغة العربية') 
                {
                    $res[] = $diplome;
                }  
            } elseif(Auth::user()->hasRole('guichet_droit_francais')) {
                if($diplome->statut_id == 1 and
                    $diplome->filiere == 'Droit en français') 
                {
                    $res[] = $diplome;
                }  
            } elseif(Auth::user()->hasRole('guichet_economie')) {
                if($diplome->statut_id == 1 and
                    $diplome->filiere == 'Sciences Economiques et Gestion') 
                {
                    $res[] = $diplome;
                }  
            } elseif(Auth::user()->hasRole('service_diplomes')) {
                if($diplome->statut_id == 1 or $diplome->statut_id == 2 or $diplome->statut_id == 3 or 
                    $diplome->statut_id == 4 or $diplome->statut_id == 5) 
                {
                    $res[] = $diplome;
                }    
            } elseif(Auth::user()->hasRole('decanat')) {
                if($diplome->statut_id == 3 or $diplome->statut_id == 4) 
                {
                    $res[] = $diplome;
                }    
            } elseif(Auth::user()->hasRole('bureau_ordre')) {
                if($diplome->statut_id == 5 or $diplome->statut_id == 6) 
                {
                    $res[] = $diplome;
                }  
            } elseif(Auth::user()->hasRole('guichet_retrait')) {
                if($diplome->statut_id == 6 or $diplome->statut_id == 7) 
                {
                    $res[] = $diplome;
                }
            }
        }
        
        return response()->json([
            'diplomes' => $res
        ]);
    }

    /*
     * Filter diplomes by dateFrom and dateTo
     *
     * @param date $dateFrom
     * @param date $dateTo
     * @return \Illuminate\Http\Response
     */
    /* public function filterByDates($dateFrom, $dateTo)
    {
        return response()->json([
            'diplomes' => DB::table('diplomes as dip')
                        ->join('etudiants as e', 'dip.etudiant_cin','=','e.cin')
                        ->join('demandes as d', 'dip.demande_id','=','d.id')
                        ->whereBetween('dip.date_receptionParBureauOrdre_envoiAuGuichetRetrait',[$dateFrom,$dateTo])
                        ->get()
        ]);
    } */

    /**
     * Notify etudent by sending notif to his email with update date_notificationEtudiant
     *
     * @param  int $id_diplome
     * @return \Illuminate\Http\Response
     */
    public function sendMAil($id_diplome)
    {
        $diplome = Diplome::with('etudiant','demande')->find($id_diplome);
        $mail=[
            'object' => 'Notification de diplôme',
            'body' => 'Bonjour '
                        .$diplome->etudiant->nom.' '.$diplome->etudiant->prenom.
                        ', votre ' .$diplome->demande->type_demande. ' est prêt, 
                       vous pouvez venir pour le récupérer auprès du guichet 
                       de retrait des diplômes dans un délai de 3 jours au maximum!',
        ];

        // test if the specified date is null and the previous dates not null
        if ($diplome)
        {
            if( ! $diplome->date_notificationEtudiant
            and $diplome->date_receptionParBureauOrdre_envoiAuGuichetRetrait 
            and $diplome->date_generationBorodeaux_envoiApresidence 
            and $diplome->date_singature_renvoiAuServiceDiplome 
            and $diplome->date_impression_envoiAuDecanat)
        {
            $diplome->update([
                'date_notificationEtudiant' => Carbon::today()->format('Y-m-d'),
            ]);
            // notify etudiant
            //Mail::to($diplome->etudiant->email_inst)->send(new NotificationDiplome($mail));
            Mail::to('gouzasalma@gmail.com')->send(new NotificationDiplome($mail));

                return response()->json([
                    'response' => 'email sent to '.$diplome->etudiant->email_inst,
                ]);
            }
        }
        
        return response()->json([
            'response' => 'cannot send email!',
        ]);

        
    }

}