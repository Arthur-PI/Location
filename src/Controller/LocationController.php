<?php

namespace App\Controller;

use App\Entity\Facture;
use App\Entity\Vehicule;
use phpDocumentor\Reflection\Types\Null_;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\BrowserKit\Response;

class LocationController extends AbstractController
{
    /**
     * @Route("/", name="home")
     */
    public function home() // Page d'acceuil pour louer des vehicules
    {
        $vehicules = $this->getDoctrine()
                          ->getRepository(Vehicule::class)
                          ->findAllAvailable();

        return $this->render('location/home.html.twig', [
            'vehicules' => $vehicules,
        ]);
    }

    /**
     * @Route("/account/vehicule", name="moncompte")
     */
    public function monCompte() //  Afficher les vehicules louer par l'entreprise (option pour avoir sa facture et arreter des locations)
    {

        $factures = $this->getDoctrine()
                         ->getRepository(Facture::class)
                         ->findBy(["idUser" => $this->getUser()->getNumUser()]);

        $repo = $this->getDoctrine()
                     ->getRepository(Vehicule::class);
        
        $vehicules = [];
        $i = 0;
        foreach($factures as $facture){
            $vehicules[$i] = $repo->findOneBy(['id' => $facture->getIdVehic()]);
            $i++;
        }
        return $this->render('location/monCompte.html.twig', [
            'factures' => $factures,
            'vehicules' => $vehicules,
            'taille' => count($vehicules)-1,
        ]);
    }

    /**
     * @Route("/admin/vehicules", name="admin_vehicule")
     */
    public function adminVehicule() // Afficher les vehicules disponible de l'admin (option pour supprimer/modifier des vehicules)
    {
        $this->denyAccessUnlessGranted('ROLE_ADMIN', null, 'User tried to access a page without having ROLE_ADMIN');

        return $this->render('location/adminVehicule.html.twig', [
            'controller_name' => 'LocationController',
        ]);
    }

    /**
     * @Route("/admin/location", name="admin_location")
     */
    public function adminLocation() // Afficher les vehicules louer par les entreprises (option pour calculer les factures)
    {
        $this->denyAccessUnlessGranted('ROLE_ADMIN', null, 'User tried to access a page without having ROLE_ADMIN');

        return $this->render('location/adminLocation.html.twig', [
            'controller_name' => 'LocationController',
        ]);
    }

    /**
     * @Route("/admin/ajouter", name="admin_ajouter")
     * Ajouter un vehicule a la flotte
     */
    public function adminAjouter() // Ajouter un vehicule a la flotte avec un formulaire
    {
        $this->denyAccessUnlessGranted('ROLE_ADMIN', null, 'User tried to access a page without having ROLE_ADMIN');

        return $this->render('location/adminAjouter.html.twig', [
            'controller_name' => 'LocationController',
        ]);
    }


    /**
     * @Route("/facture/{id}", name="make_pdf")
     */
    public function makePDF($id, \Knp\Snappy\Pdf $knpSnappy)
    {   
        $knpSnappy->setOption("encoding","UTF-8");
        $knpSnappy->setOption("lowquality",false);
        $filename = "facture";

        $facture = $this->getDoctrine()
                        ->getRepository(Facture::class)
                        ->find($id);
        
        $vehicule = $this->getDoctrine()
                         ->getRepository(Vehicule::class)
                         ->find($facture->getIdVehic());

        $nbJours = 20;
        $totalTTC = $nbJours * $vehicule->getPrix();
        $totalHT = $totalTTC * 0.8;

        $html = $this->renderView('location/facturepdf.html.twig' , array(
            'facture' => $facture,
            'vehicule' => $vehicule,
            'nbJours' => $nbJours,
            'totalTTC' => $totalTTC,
            'totalHT' => $totalHT,
        ));
        
        return new Response(
            $knpSnappy->getOutputFromHtml($html),
            200,
            array(
                'Content-Type' => 'application/pdf',
                'Content-Disposition' => 'inline; filename="'.$filename.'.pdf"'
            )
        );
    }
}
