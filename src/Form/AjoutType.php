<?php

namespace App\Form;

use App\Entity\Vehicule;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\FileType;

class AjoutType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('modele', TextType::class, [
                'label' => 'Nom Modele'
            ])
            ->add('carac', TextType::class, [
                'label' => 'Caracteristique'
            ])
            ->add('quantite', TextType::class, [
                'label' => 'Nombre de voitures'
            ])
            ->add('image', FileType::class, [
                'label' => 'image'
            ])
            ->add('prix', TextType::class, [
                'label' => 'Prix journalier'
            ]);
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Vehicule::class,
        ]);
    }
}
