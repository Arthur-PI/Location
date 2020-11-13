<?php

namespace App\Controller;

use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\BrowserKit\Response;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\String\Slugger\SluggerInterface;

use App\Entity\Facture;
use App\Entity\User;
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
	 * @Route("/voiture/{id}", name="louervoiture")
	 */
	public function louerVoiture($id, Request $request) // Ouvre la page de la voiture et offre la possibilité de la louer
	{
		$message = null;
		// dump(count($request->query));
		if (count($request->query)) $message = "Erreur: dates saisies invalides !";
		$vehicule = $this->getDoctrine()
						 ->getRepository(Vehicule::class)
						 ->find($id);

		return $this->render('location/locationCar.html.twig', [
			'vehicule' => $vehicule,
			'message' => $message,
		]);	
	}

	/**
	 * @Route("/yay", name="creationfacture")
	 */
	public function creationFacture(Request $request, EntityManagerInterface $manager) {
		dump($request);
		$dateD = $request->request->get('DateDebut');
		$dateF = $request->request->get('DateFin');
		$prix = $request->request->get('prix');
		dump($dateD, $dateF);
		if (strlen($dateD) > 0 && strlen($dateF) > 0) {
			$vehic = $this->getDoctrine->getRepository(Vehicule::class)->find($request->request->get('id'));
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
			$vehic->setQuantite($vehic->getQuantite() - 1);
			$manager->flush();
			return $this->redirectToRoute("moncompte");
		}
		else{
			return $this->redirectToRoute("louervoiture", ['id' => $request->request->get('id'), 'error' => 1]);
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

		$total = [];
		$dispo = [];
		$i = 0;
		foreach($vehicules as $vehicule){
			$total[$i] = $vehicule->getQuantite() + rand(0, 5);
			$dispo[$i] = true;
			$i++;
		}

		return $this->render('location/adminVehicule.html.twig', [
			'vehicules' => $vehicules,
			'total' => $total,
			'disponible' => $dispo,
			'taille' => count($total)-1,
		]);
	}

	/**
	 * @Route("/admin/location", name="admin_location")
	 */
	public function adminLocation() // Afficher les vehicules louer par les entreprises (option pour calculer les factures)
	{
		$users = $this->getDoctrine()
						 ->getRepository(User::class)
						 ->findAll();

		$repoVehic = $this->getDoctrine()
						  ->getRepository(Vehicule::class);

		$repoFact = $this->getDoctrine()
						 ->getRepository(Facture::class);

		$usernames =[];
		$vehicules = [];
		$factures = [];
		$taille = count($users);
		
		for($i=0; $i < $taille; $i++){
			$usernames[$i] = $users[$i]->getNom();
			$factures[$i] = $repoFact->findBy(['idUser' => $users[$i]->getNumUser()]);
			$tmp = [];
			for($j=0; $j < count($factures[$i]); $j++){
				$tmp[$j] = $repoVehic->find(['id' => $factures[$i][$j]->getIdVehic()]);
			}
			$vehicules[$i] = $tmp;
		}
		dump($factures, $vehicules, $usernames);
		return $this->render('location/adminLocation.html.twig', [
			'factures' => $factures,
			'vehicules' => $vehicules,
			'users' => $usernames,
			'taille' => $taille - 1,
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
		// dump($form);

		$form->handleRequest($request);
		
		if ($form->isSubmitted() && $form->isValid()){
			$imageFile = $form->get('image')->getData();

			$originalFilename = $form->get('carac')->getData()['marque'] . $form->get('modele')->getData();
			$safeFilename = $slugger->slug($originalFilename);
			$newFilename = $safeFilename.'-'.uniqid().'.'.$imageFile->guessExtension();
			
			$imageFile->move(
				$this->getParameter('image_directory'),
				$newFilename
			);

			$vehicule->setImage('/img/voitures/' . $newFilename);
			$vehicule->setCarac($vehicule->getCarac());
			
			// dump($vehicule);
			$manager->persist($vehicule);
			$manager->flush();
				
			return $this->redirectToRoute('admin_vehicule');
		}
		// dump($form, $vehicule);
			
		return $this->render('location/adminAjouter.html.twig', [
			'form' => $form->createView(),
		]);

	}

	/**
	 * @Route("/account/facture/id/{idFacture}", name="gen_facture")
	 */
	public function facture($idFacture) //ouvrir une facture
	{
		$facture = $this->getDoctrine()
						  ->getRepository(Facture::class)
						  ->find($idFacture);

		$vehicule = $this->getDoctrine()
						 ->getRepository(Vehicule::class)
						 ->find($facture->getIdVehic());


		$days = $facture->getDateD()->diff($facture->getDateF())->d;
		$prixTotal = round($vehicule->getPrix() * $days, 2);
		$prixHT = round($prixTotal / 1.2, 2);

		return $this->render('location/facturepdf.html.twig', [
			'facture' => $facture,
			'vehicule' => $vehicule,
			'prixHT' => $prixHT,
			'prixTotal' => $prixTotal,
			'days' => $days,
		]);
	}

	/**
	 * @Route("/account/facture/user", name="gen_facture_totale")
	 */
	public function facture_totale() //ouvrir une facture
	{
		$factures = $this->getDoctrine()
						 ->getRepository(Facture::class)
						 ->findBy(["idUser" => $this->getUser()->getNumUser()]);

		$repoVehic = $this->getDoctrine()
						  ->getRepository(Vehicule::class);

		$vehicules = [];
		$prixTotal = [];
		$prixHT = [];
		$prixTotalTotal = 0;
		$days = [];

		$taille = count($factures);

		for ($i = 0; $i < $taille; $i++) 
		{
			$vehicules[$i] = $repoVehic->find($factures[$i]->getIdVehic());
			$days[$i] = $factures[$i]->getDateD()->diff($factures[$i]->getDateF())->d;
			$prixTotal[$i] = $vehicules[$i]->getPrix() * $days[$i];
			$prixTotalTotal += $prixTotal[$i];
			$prixHT[$i] = round($prixTotal[$i] / 1.2, 2);
		}	   
	
		return $this->render('location/facturepdftotal.html.twig', [
			'factures' => $factures,
			'vehicules' => $vehicules,
			'prixHT' => $prixHT,
			'prixTotal' => $prixTotal,
			'prixTotalTotal' => $prixTotalTotal,
			'days' => $days,
			'taille' => $taille-1,
		]);
	}
}
