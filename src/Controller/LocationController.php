<?php

namespace App\Controller;

use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\BrowserKit\Response;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\String\Slugger\SluggerInterface;

use App\Entity\Facture;
use App\Entity\Vehicule;
use App\Form\AjoutType;

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
}
