<?php

namespace App\Entity;

use App\Repository\VehiculeRepository;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * @ORM\Entity(repositoryClass=VehiculeRepository::class)
 */
class Vehicule
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $modele;

    /**
     * @ORM\Column(type="json")
     */
    private $carac = [];

    /**
     * @ORM\Column(type="integer")
     * @Assert\GreaterThanOrEqual(value = 0)
     */
    private $quantite;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $image;

    /**
     * @ORM\Column(type="float")
     * @Assert\GreaterThanOrEqual(value = 5)
     */
    private $prix;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getModele(): ?string
    {
        return $this->modele;
    }

    public function setModele(string $modele): self
    {
        $this->modele = $modele;

        return $this;
    }

    public function getCarac(): ?array
    {
        return $this->carac;
    }

    public function setCarac(array $carac): self
    {
        $this->carac = $carac;
        
        return $this;
    }

    public function getQuantite(): ?int
    {
        return $this->quantite;
    }

    public function setQuantite(int $quantite): self
    {
        $this->quantite = $quantite;

        return $this;
    }

    public function getImage(): ?string
    {
        return $this->image;
    }

    public function setImage(string $image): self
    {
        $this->image = $image;

        return $this;
    }

    public function getPrix(): ?float
    {
        return $this->prix;
    }

    public function setPrix(float $prix): self
    {
        $this->prix = $prix;
        return $this;
    }
}
