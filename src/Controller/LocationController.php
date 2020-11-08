<?php

namespace App\Controller;

use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\BrowserKit\Response;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\ORM\EntityManagerInterface;
<<<<<<< HEAD
use Symfony\Component\String\Slugger\SluggerInterface;

use App\Entity\Facture;
use App\Entity\Vehicule;
use App\Form\AjoutType;
=======

>>>>>>> 055c4c08fb06fcb68b7cf8fb3be0bd038fadf7f7

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
     * @Route("/voiture/{id}", name="louervoiture")
     */
    public function louerVoiture($id) // Ouvre la page de la voiture et offre la possibilité de la louer
    {
        $vehicule = $this->getDoctrine()
                          ->getRepository(Vehicule::class)
                          ->find($id);

        return $this->render('location/locationCar.html.twig', [
            'vehicule' => $vehicule,
        ]);
    }
    
    /**
     * @Route("/yay", name="creationfacture")
     */
    public function creationFacture(Request $request, EntityManagerInterface $manager) {
        //return $this->redirectToRoot('louervoiture', $vehicule.getId());
        dump($request);
        $dateD = $request->request->get('DateDebut');
        $dateF = $request->request->get('DateFin');
        $prix = $request->request->get('prix');
        if (strlen($dateD) > 0 && strlen($dateF) > 0 ) {
            $dateD = new \DateTime($dateD);
            $dateF = new \DateTime($dateF);
            $facture = new Facture();
            $facture->setIdVehic($request->request->get('id'))
                    ->setIdUser($this->getUser()->getNumUser())
                    ->setMontant($dateD->diff($dateF)->d * $prix)
                    ->setDateD($dateD)
                    ->setDateF($dateF)
                    ->setPayee(False);
            $manager->persist($facture);
            $manager->flush();
            return $this->redirectToRoute("moncompte");
        }
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
        
        $vehicules = $this->getDoctrine()
                          ->getRepository(Vehicule::class)
                          ->findAll();

        return $this->render('location/adminVehicule.html.twig', [
            'vehicules' => $vehicules,
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
    public function adminAjouter(Request $request, EntityManagerInterface $manager, SluggerInterface $slugger) // Ajouter un vehicule a la flotte avec un formulaire
    {
        $this->denyAccessUnlessGranted('ROLE_ADMIN', null, 'User tried to access a page without having ROLE_ADMIN');

        $vehicule = new Vehicule();

        $form = $this->createForm(AjoutType::class, $vehicule);

        $form->handleRequest($request);
        
        if ($form->isSubmitted() && $form->isValid()){
            $imageFile = $form->get('image')->getData();

            $originalFilename = $form->get('carac')->getData()[0] . $form->get('modele')->getData();
            $safeFilename = $slugger->slug($originalFilename);
            $newFilename = $safeFilename.'-'.uniqid().'.'.$imageFile->guessExtension();
            
            $imageFile->move(
                $this->getParameter('image_directory'),
                $newFilename
            );

            $vehicule->setImage('/img/voitures/' . $newFilename);
            $vehicule->setCarac($vehicule->getCarac());
            
            dump($vehicule);
            // $manager->persist($vehicule);
            // $manager->flush();
                
            // return $this->redirectToRoute('admin_vehicule');
        }
        // dump($form, $vehicule);
            
        return $this->render('location/adminAjouter.html.twig', [
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/account/facture", name="gen_facture")
     */
    public function facture() //ouvrir une facture
    {
        /*$facture = $this->getDoctrine()
                         ->getRepository(Facture::class)
                         ->findBy(["idUser" => $this->getUser()->getNumUser()]);*/
        return $this->render('location/facturepdf.html.twig' /*[
            'facture' => $facture,
        ]*/);
    }
}
